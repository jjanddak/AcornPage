package com.gura.spring05.toondetail.servcie;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gura.spring05.exception.CanNotDeleteException;
import com.gura.spring05.toondetail.dao.ToonDetailDao;
import com.gura.spring05.toondetail.dto.ToonDetailDto;
import com.gura.spring05.users.dto.UsersDto;

@Service
public class ToonDetailServiceImp implements ToonDetailService{
	@Autowired
	ToonDetailDao dao;

	@Override
	public List<ToonDetailDto> getDetailList(HttpServletRequest request) {
		List<ToonDetailDto> detailList = null;
		String select=request.getParameter("select");
		String keyword=request.getParameter("keyword"); 
		
		if(select.equals("writer")) {
			detailList = dao.getWriterDetail(keyword);
		}else if(select.equals("title")) {
			detailList = dao.getTitleDetail(keyword);
		}else if(select.equals("hashtag")) {
			detailList = dao.getHashtagDetail(keyword);
		}
		return detailList;
	}

	@Override
	public void deleteToon(HttpServletRequest request, ToonDetailDto dto, String title) {
		String id=(String)request.getSession().getAttribute("id");
		
		ToonDetailDto tmpdto=new ToonDetailDto();
		tmpdto.setWriter(dao.getToonDetail(title).getWriter());
		
		if(!id.equals(tmpdto.getWriter())){
			throw new CanNotDeleteException();
		}
		
		dto.setTitle(title);
		dto.setWriter(id);
		
		dao.deleteToon(dto);
		dao.deleteList(dto);
	
		
	}

	@Override
	public void updateDetail(ToonDetailDto dto) {
		dao.updateDetail(dto);
	}

	@Override
	public String thumbUpdate(HttpServletRequest request, MultipartFile mFile, String title) {
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
		
		ToonDetailDto dto=new ToonDetailDto();
		dto.setTitle(title);
		dto.setThumb(path);
		// UsersDao 를 이용해서 DB 에 반영하기 
		dao.updateThumb(dto);
		
		//이미지 경로 리턴해주기 
		return path;
	}

}
