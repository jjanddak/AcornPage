package com.gura.spring05.users.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.exception.NoMoneyException;
import com.gura.spring05.library.dto.LibraryDto;
import com.gura.spring05.toondetail.dao.ToonDetailDao;
import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.toonlist.dao.ToonListDao;
import com.gura.spring05.toonlist.dto.ToonListDto;
import com.gura.spring05.users.dao.UsersDao;
import com.gura.spring05.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao dao;
	@Autowired
	private ToonDetailDao detailDao;
	@Autowired
	private ToonListDao listDao;
	
	//인자로 전달된 아이디가 존재하는지 여부를 Map 에 담아서 리턴하는 메소드 
	@Override
	public Map<String, Object> isExistId(String inputId) {
		boolean isExist=dao.isExist(inputId);
		Map<String, Object> map=new HashMap<>();
		map.put("isExist", isExist);
		return map;
	}
	@Override
	public void addUser(UsersDto dto) {
		//비밀번호를 암호화 한다.
		String encodedPwd=new BCryptPasswordEncoder().encode(dto.getPwd());
		//암호화된 비밀번호를 UsersDto 에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		//UsersDao 객체를 이용해서 DB 에 저장하기 
		dao.insert(dto);
	}
	@Override
	public boolean validUser(UsersDto dto, HttpSession session, ModelAndView mView) {
		//아이디 비밀번호가 유효한지 여부 
		boolean isValid=false;
		//아이디를 이용해서 저장된 비밀 번호를 읽어온다. 
		String pwdHash=dao.getPwdHash(dto.getId());
		if(pwdHash != null) {//비밀번호가 존재하고 
			//입력한 비밀번호와 일치 하다면 로그인 성공
			isValid=BCrypt.checkpw(dto.getPwd(), pwdHash);
		}
		if(isValid) {
			//로그인 처리를 한다.
			int wallet=dao.getWallet(dto.getId());
			session.setAttribute("id", dto.getId());
			session.setAttribute("wallet", wallet);
			UsersDto profile=dao.getData(dto.getId());
			session.setAttribute("profile", profile.getProfile());			
			return true;
		}else {
			return false;
		}
	}
	@Override
	public void showInfo(String id, ModelAndView mView) {
		UsersDto dto=dao.getData(id);
		mView.addObject("dto", dto);
	}
	@Override
	public String saveProfileImage(HttpServletRequest request, 
			MultipartFile mFile) {
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getServletContext().getRealPath("/upload");
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//디렉토리를 만들 파일 객체 생성
		File file=new File(filePath);
		if(!file.exists()){//디렉토리가 존재하지 않는다면
			file.mkdir();//디렉토리를 만든다.
		}
		//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
		String saveFileName=
				System.currentTimeMillis()+orgFileName;
		try{
			//upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath+saveFileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//UsersDao 객체를 이용해서 프로파일 이미지
		//경로를 DB 에 저장하기
		String path="/upload/"+saveFileName;			
		//로그인된 아이디
		String id=(String)
				request.getSession().getAttribute("id");
		//아이디와 프로파일 이미지 경로를 dto 에 담고 
		UsersDto dto=new UsersDto();
		dto.setId(id);
		dto.setProfile(path);
		// UsersDao 를 이용해서 DB 에 반영하기 
		dao.updateProfile(dto);
		
		//이미지 경로 리턴해주기 
		return path;
	}
	@Override
	public boolean updatePassword(UsersDto dto, ModelAndView mView) {
		//1. 예전 비밀번호가 맞는 정보인지 확인
		String pwdHash=dao.getData(dto.getId()).getPwd();
		boolean isValid=BCrypt.checkpw(dto.getPwd(), pwdHash);
		//2. 만일 맞다면 새로 비밀번호를 암호화 해서 저장하기
		if(isValid) {
			//새 비밀번호를 암호화 해서 dto 에 담고 
			String encodedPwd=new BCryptPasswordEncoder()
					.encode(dto.getNewPwd());
			dto.setPwd(encodedPwd);
			//DB 에 수정 반영하기
			dao.updatePwd(dto);
			return true;
		}else {
			return false;
		}
	}
	@Override
	public void updateUser(UsersDto dto) {
		dao.updateUser(dto);
	}
	@Override
	public void deleteUser(String id) {
		
		dao.delete(id);
	}
	@Override
	public void userStarList(HttpServletRequest request, String id) {
		ToonListDto dto=new ToonListDto();
		dto.setId(id);
		List<ToonListDto> list=dao.getUserStarList(dto);
		request.setAttribute("list", list);
	}

	@Override
	public void needPermit(HttpServletRequest request) {
		
		String id=(String)request.getSession().getAttribute("id");
		if(!id.equals("admin")) {
			throw new NoMoneyException("관리자가 아닙니다.");
		}else {
			List<String> list=detailDao.needPermit();
			HashSet<String> hash=new HashSet<String>(list);
			list=new ArrayList<String>(hash);
			List<ToonDetailDto> detailList=new ArrayList<ToonDetailDto>();
			for(int i=0; i<list.size(); i++) {
				ToonDetailDto dto=detailDao.getNoPermitDetail(list.get(i));
				detailList.add(dto);
			}
			request.setAttribute("list", detailList);
		}
	}
	@Override
	public void permitDetail(HttpServletRequest request,String title) {
		String id=(String)request.getSession().getAttribute("id");
		if(!id.equals("admin")) {
			throw new NoMoneyException("관리자가 아닙니다.");
		}else {
			List<ToonListDto> list=listDao.permitDetail(title);
			request.setAttribute("list", list);
		}
	}
	@Override
	public void permitCode(HttpServletRequest request) {
		String title=(String)request.getParameter("title");
		String id=(String)request.getSession().getAttribute("id");
		String code=(String)request.getParameter("code");
		ToonListDto dto=new ToonListDto();
		dto.setCode(code);
		dto.setTitle(title);
		if(!id.equals("admin")) {
			throw new NoMoneyException("관리자가 아닙니다.");
		}else {
			dto=listDao.permitCode(dto);
			request.setAttribute("dto", dto);
		}
	}
	@Override
	public boolean permit_update(HttpServletRequest request, ToonListDto dto) {
		String id=(String)request.getSession().getAttribute("id");
		if(!id.equals("admin")) {
			throw new NoMoneyException("관리자가 아닙니다.");
		}else {
			if(!dto.getPermit().equals("Y")) {
				dto.setPermit(dto.getContent());
				listDao.permit_update(dto);
			}else {
				listDao.permit_update(dto);
				listDao.permit_update_detail(dto);
			}
			List<String> moreList=listDao.morePermit(dto.getTitle());
			if(moreList.size()==0) {
				return false;
			}else {
				return true;
			}
		}
	}
	@Override
	public void getToonList(HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		if(!id.equals("admin")) {
			throw new NoMoneyException("관리자가 아닙니다.");
		}else {
			List<ToonDetailDto> list=listDao.allDetailList();
			request.setAttribute("list", list);
		}
	}
	@Override
	public void manageDetail(HttpServletRequest request,String title) {
		String id=(String)request.getSession().getAttribute("id");
		if(!id.equals("admin")) {
			throw new NoMoneyException("관리자가 아닙니다.");
		}else {
			List<ToonListDto> list=listDao.manageDetail(title);
			request.setAttribute("list", list);
		}	
	}
	@Override
	public void deleteAll(HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		if(!id.equals("admin")) {
			throw new NoMoneyException("관리자가 아닙니다.");
		}else {
			String title=request.getParameter("title");
			String writer=request.getParameter("writer");
			ToonDetailDto detailDto=new ToonDetailDto();
			detailDto.setWriter(writer);
			detailDto.setTitle(title);
			detailDao.deleteToon(detailDto);
			detailDao.deleteList(detailDto);
		}
		
	}
	@Override
	public void manageCode(HttpServletRequest request, String title, String code) {
		String id=(String)request.getSession().getAttribute("id");
		if(!id.equals("admin")) {
			throw new NoMoneyException("관리자가 아닙니다.");
		}else {
			ToonListDto dto=new ToonListDto();
			dto.setTitle(title);
			dto.setCode(code);
			dto.setId(id);
			LibraryDto libDto=new LibraryDto();
			LibraryDto libDto2=new LibraryDto();
			libDto.setId(id);	
			libDto.setTitle(title);
			libDto.setCode(code);
			libDto2.setId(id);	
			libDto2.setTitle(title);		
			dto=listDao.getCodeDetail(dto);
			UsersDto dto2=new UsersDto();
			dto2.setId(id);
			dto2.setLastread(code);
			listDao.lastRead(dto2);
		      
			String num = code.replaceAll("[^0-9]","");
			String tmpcode=code.replaceAll("[0-9]","");
			int tmp=Integer.parseInt(num);
			tmp--;
			String nextnum=Integer.toString(tmp+2);
			String prevnum=Integer.toString(tmp);
			String prevcode=tmpcode+prevnum;
			String nextcode=tmpcode+nextnum;
			libDto.setCode(prevcode);
			libDto2.setCode(nextcode);
			
			String havePrev=listDao.havePrev(libDto);
			String haveNext=listDao.haveNext(libDto2);		
					
			request.setAttribute("havePrev", havePrev);
			request.setAttribute("haveNext", haveNext);
			request.setAttribute("dto", dto);
		}
	}
	@Override
	public boolean deleteCode(HttpServletRequest request, String code) {
		String id=(String)request.getSession().getAttribute("id");
		if(!id.equals("admin")) {
			throw new NoMoneyException("관리자가 아닙니다.");
		}else {
			String title=listDao.getTitle(code);
			listDao.deleteCode(code);
			List<ToonListDto> list=listDao.getDetailList(title);
			if(list==null) {
				ToonDetailDto dto=new ToonDetailDto();
				String writer=(String)request.getParameter("writer");
				dto.setWriter(writer);
				dto.setTitle(title);
				detailDao.deleteToon(dto);
				return true;
			}else {
				return false;
			}
		}
	}
}
















