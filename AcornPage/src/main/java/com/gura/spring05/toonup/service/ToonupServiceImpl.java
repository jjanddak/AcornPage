package com.gura.spring05.toonup.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.toonlist.dao.ToonListDao;
import com.gura.spring05.toonlist.dto.ToonListDto;
import com.gura.spring05.toonup.dao.ToonupDao;
import com.gura.spring05.toonup.dto.NewToonupDto;
import com.gura.spring05.toonup.dto.ToonupDto;
import com.gura.spring05.users.dto.UsersDto;

@Service
public class ToonupServiceImpl implements ToonupService{
	@Autowired
	private ToonupDao dao;
	
	@Autowired
	private ToonListDao listdao;

	
	//툰리스트 업로드
	@Override
	public void saveToon(ToonupDto dto) {
		dao.insert(dto);
	}

	@Override
	public void getLastNum(HttpServletRequest request, ModelAndView mView, @RequestParam String title) {
		String id=(String)request.getSession().getAttribute("id");
		int lastNum=dao.getLastNum(title);
		lastNum++;
		
		mView.addObject("title",title);
		mView.addObject("id",id);
		mView.addObject("lastNum",lastNum);
	}
	
	@Override
	public void newToonupload(HttpServletRequest request, NewToonupDto dto) {
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getServletContext().getRealPath("/upload");
		//콘솔창에 테스트 출력
		System.out.println(realPath);
		String saveFileName;
		String path="";
		
		//MultipartFile 객체의 참조값 얻어오기
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
		MultipartFile mFile=dto.getFile();
		
		System.out.println(mFile);
		if(!mFile.isEmpty()) {
			//원본 파일명
			String orgFileName=mFile.getOriginalFilename();
			//파일 사이즈
			long fileSize=mFile.getSize();
			//저장할 파일의 상세 경로
			String filePath=realPath+File.separator;
			//디렉토리를 만들 파일 객체 생성
			File file=new File(filePath);
			if(!file.exists()){//디렉토리가 존재하지 않는다면
				file.mkdir();//디렉토리를 만든다.
			}
			//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
			saveFileName=
					System.currentTimeMillis()+orgFileName;
			try{
				//upload 폴더에 파일을 저장한다.
				mFile.transferTo(new File(filePath+saveFileName));
			}catch(Exception e){
				e.printStackTrace();
			}
			//FileDto 객체에 추가 정보를 담는다.
			String id=(String)request.getSession().getAttribute("id");
			path="/upload/"+saveFileName;
			dto.setWriter(id); //작성자
			dto.setThumb(path);
			//FileDao 객체를 이용해서 DB 에 저장하기
			dao.newToonupload(dto);	
		}else {
			//FileDto 객체에 추가 정보를 담는다.
			String id=(String)request.getSession().getAttribute("id");
			dto.setWriter(id); //작성자
			dto.setThumb(path);
			//FileDao 객체를 이용해서 DB 에 저장하기
			dao.newToonupload(dto);						
		}		
	}

	@Override
	public void writerLibrary(ToonupDto dto) {
		dao.writerLibrary(dto);
	}

	@Override
	public void getLastCodeDetail(HttpServletRequest request, String title) {
		String id=(String)request.getSession().getAttribute("id");
		int lastNum=dao.getLastNum(title);
		
		String code=title+lastNum;
		
		ToonListDto dto=new ToonListDto();
		
		dto.setId(id);
		dto.setNum(lastNum);
		dto.setTitle(title);
		dto.setCode(code);
		
		dto=listdao.getCodeDetail(dto);
		
		request.setAttribute("dto", dto);
	}

	@Override
	public void toonUpdate(HttpServletRequest request, ToonListDto dto) {
		String code=dto.getTitle()+dto.getNum();
		dto.setCode(code);
		
		listdao.toonupdate(dto);
	}

}












