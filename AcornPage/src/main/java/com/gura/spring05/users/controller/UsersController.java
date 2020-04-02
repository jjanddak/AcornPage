package com.gura.spring05.users.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.star.service.StarService;
import com.gura.spring05.toonlist.dto.ToonListDto;
import com.gura.spring05.toonlist.service.ToonListService;
import com.gura.spring05.users.dto.UsersDto;
import com.gura.spring05.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	
	@Autowired
	private ToonListService toonService;
	
	@Autowired
	private StarService starService;
	
	//회원가입 폼 요청 처리 
	@RequestMapping("/users/signup_form")
	public String signup_form() {
		return "users/signup_form";
	}
	/*
	 *  [ JSON 문자열 응답하는 방법 ]
	 *  1. pom.xml 에 jackson-databind dependency 명시
	 *  2. controller 의 메소드에 @ResponseBody 어노테이션 붙이기
	 *  3. List, Map, Dto 중에 하나를 리턴한다.
	 */
	@ResponseBody
	@RequestMapping("/users/checkid")
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=service.isExistId(inputId);
		return map;
	}
	// POST 방식 /users/signup.do 요청 처리 
	@RequestMapping(value = "/users/signup", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("dto") UsersDto dto,
			ModelAndView mView) {
		service.addUser(dto);
		mView.setViewName("users/insert");
		return mView;
	}
	
	//로그인 폼 요청 처리
	@RequestMapping("/users/loginform")
	public String loginform(HttpServletRequest request) {
		// "url" 이라는 파라미터가 넘어오는지 읽어와 본다.  
		String url=request.getParameter("url");
		if(url==null){//만일 없으면 
			//로그인 성공후에 index 페이지로 보낼수 있도록 구성한다. 
			url=request.getContextPath()+"/home.do";
		}
		//아이디, 비밀번호가 쿠키에 저장되었는지 확인해서 저장 되었으면 폼에 출력한다.
		Cookie[] cookies=request.getCookies();
		//저장된 아이디와 비밀번호를 담을 변수 선언하고 초기값으로 빈 문자열 대입 
		String savedId="";
		String savedPwd="";
		if(cookies != null){
			for(Cookie tmp:cookies){
				if(tmp.getName().equals("savedId")){
					savedId=tmp.getValue();
				}else if(tmp.getName().equals("savedPwd")){
					savedPwd=tmp.getValue();
				}
			}
		}	
		//view page 에서 필요한 정보 넘겨주기 
		request.setAttribute("url", url);
		request.setAttribute("savedId", savedId);
		request.setAttribute("savedPwd", savedPwd);
		return "users/loginform";
	}
	//로그인 요청 처리 
	@ResponseBody
	@RequestMapping(value = "/users/login", method = RequestMethod.POST)
	public boolean login(@ModelAttribute UsersDto dto,
			ModelAndView mView, 
			HttpServletRequest request,
			HttpServletResponse response) {
		//목적지 정보
		String url=request.getParameter("url");
		if(url==null){
			url=request.getContextPath()+"/home.do";
		}
		//목적지 정보를 미리 인코딩 해 놓는다.
		String encodedUrl=URLEncoder.encode(url);
		// view page 에 전달하기 
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		
		//아이디 비밀번호 저장 체크박스를 체크 했는지 읽어와 본다.
		String isSave=request.getParameter("isSave");	
		//아이디, 비밀번호를 쿠키에 저장
		Cookie idCook=new Cookie("savedId", dto.getId());
		Cookie pwdCook=new Cookie("savedPwd", dto.getPwd());
		if(isSave != null){ // null 이 아니면 체크 한 것이다.
			//한달 동안 저장하기
			idCook.setMaxAge(60*60*24*30);
			pwdCook.setMaxAge(60*60*24*30);
		}else{
			//쿠키 지우기 RX
			idCook.setMaxAge(0);
			pwdCook.setMaxAge(0);
		}
		String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }
		
		     
		//응답할때 쿠키도 심어 지도록 
		response.addCookie(idCook);
		response.addCookie(pwdCook);
		boolean checkPwd=service.validUser(dto, request.getSession(), mView, ip);
		return checkPwd;
	}
	
	//로그아웃 처리
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		String id=(String) session.getAttribute("id");
		session.invalidate();
		return "redirect:/home.do";
	}
	
	//개인 정보 보기 요청 처리
	@RequestMapping("/users/info")
	public ModelAndView authInfo(HttpServletRequest request, 
				ModelAndView mView) {
		//로그인된 아이디 읽어오기
		String id=(String)request.getSession().getAttribute("id");
		//UsersService 객체를 이용해서 개인정보를 ModelAndView 객체에 담기도록 한다.
		service.showInfo(id, mView);
		toonService.getMyToon(id, mView);
		toonService.getMyToonList(id, request);
		//view page 정보를 담고 
		mView.setViewName("users/info");
		return mView;//ModelAndView 객체를 리턴해주기 
	}
	
	
	@RequestMapping("/users/userStarList")
	public ModelAndView authStarSearch(HttpServletRequest request, @RequestParam String id) {
		service.userStarList(request, id);
		
		return new ModelAndView("users/userStarList");
	}
	
	
	/*
	 *  [ 파일 업로드 설정 ]
	 *  
	 *  1. pom.xml 에 commons-fileupload , commons-io dependency 명시하기
	 *  2. servlet-context.xml 에  CommonsMultipartResolver bean 설정
	 *  3. MultipartFile 객체 활용
	 *  4. upload 폴더 만들기
	 */
	
	// ajax 파일 업로드 처리, JSON 문자열을 리턴해 주어야 한다. 
	@ResponseBody
	@RequestMapping(value = "/users/profile_upload", 
			method = RequestMethod.POST)
	public Map<String, Object> profileUpload(HttpServletRequest request,
			@RequestParam MultipartFile profileImage,HttpSession session){
		String path=service.saveProfileImage(request, profileImage);
		/*
		 *  {"savedPath":"/upload/xxxx.jpg"} 형식의 JSON 문자열을 리턴해주도록
		 *  Map 객체를 구성해서 리턴해준다. 
		 */
		session.setAttribute("profile", path);
		Map<String, Object> map=new HashMap<>();
		map.put("savedPath", path);
		return map;
	}
	//비밀번호 수정하기 폼 요청 처리
	@RequestMapping("/users/pwd_updateform")
	public ModelAndView authPwdForm(HttpServletRequest request,
			ModelAndView mView) {
		mView.setViewName("users/pwd_updateform");
		return mView;
	}
	//비밀번호 수정 반영 요청 처리
	@ResponseBody
	@RequestMapping(value="/users/pwd_update", method=RequestMethod.POST)
	public boolean authPwdUpdate(HttpServletRequest request,
			ModelAndView mView) {
		//기존 비밀번호 
		String pwd=request.getParameter("pwd");
		//새 비밀번호
		String newPwd=request.getParameter("newPwd");
		//로그인된 아이디
		String id=(String)request.getSession().getAttribute("id");
		//위의 3가지 정보를 UsersDto 객체에 담아서 
		UsersDto dto=new UsersDto();
		dto.setPwd(pwd);
		dto.setNewPwd(newPwd);
		dto.setId(id);
		//서비스에 전달
		boolean Success=service.updatePassword(dto, mView);
		
		return Success;
	}
	
	//회원정보 수정폼 요청처리
	@RequestMapping("/users/updateform")
	public ModelAndView authUpdateform(HttpServletRequest request,
			ModelAndView mView) {
		//세션 영역에서 로그인된 id 를 읽어와서 
		String id=(String)request.getSession().getAttribute("id");
		//서비스 메소드를 호출해서 ModelAndView 객체에 회원정보가 담기게 하고 
		service.showInfo(id, mView);
		//view page 설정한 다음 
		mView.setViewName("users/updateform");
		return mView; //리턴해준다. 
	}
	
	@RequestMapping(value = "/users/update", method = RequestMethod.POST)
	public ModelAndView authUpdate(@ModelAttribute UsersDto dto, 
			HttpServletRequest request) {
		//서비스를 이용해서 수정 반영하고
		service.updateUser(dto);
		//개인정보 보기로 다시 리다일렉트 이동 시킨다.
		return new ModelAndView("redirect:/users/info.do");
	}
	@RequestMapping("/users/delete")
	public ModelAndView authDelete(HttpServletRequest request,
			ModelAndView mView) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		//서비스를 이용해서 해당 회원 정보 삭제 
		service.deleteUser(id);
		//로그 아웃 처리 
		session.invalidate();
		
		mView.addObject("id", id);
		mView.setViewName("users/delete");
		return mView;
		
	}
	
	@RequestMapping("/admin/needPermit")
	public ModelAndView authNeedPermit(HttpServletRequest request) {
		service.needPermit(request);
		return new ModelAndView("admin/needPermit");
	}
	@RequestMapping("/admin/permitDetail")
	public ModelAndView authpermitDetail(HttpServletRequest request,@RequestParam String title) {
		service.permitDetail(request,title);
		
		return new ModelAndView("admin/permitDetail");
	}
	@RequestMapping("/admin/permitCode")
	public ModelAndView authpermitCode(HttpServletRequest request) {
		service.permitCode(request);
		return new ModelAndView("admin/permitCode");
	}
	@RequestMapping(value="/admin/permit_update", method = RequestMethod.POST)
	public ModelAndView authpermit_update(HttpServletRequest request,@RequestParam String title,@ModelAttribute("dto") ToonListDto dto) throws UnsupportedEncodingException {
		boolean morePermit=service.permit_update(request,dto);
		if(morePermit) {
			String Entitle=URLEncoder.encode(title,"UTF-8");
			return new ModelAndView("redirect:/admin/permitDetail.do?title="+Entitle);
		}else {
			return new ModelAndView("redirect:/admin/needPermit.do");
		}
	}
	@RequestMapping("/admin/manageToon")
	public ModelAndView authmanageToon(HttpServletRequest request) {
		service.getToonList(request);
		return new ModelAndView("admin/manageToon");
	}
	@RequestMapping("/admin/manageDetail")
	public ModelAndView authmanageDetail(HttpServletRequest request,@RequestParam String title) {
		service.manageDetail(request, title);
		toonService.getDetailInfo(request, title);
		return new ModelAndView("admin/manageDetail");
	}
	@RequestMapping("/admin/deleteAll")
	public ModelAndView authdeleteAll(HttpServletRequest request) {
		service.deleteAll(request);
		return new ModelAndView("redirect:/admin/manageToon.do");
	}
	@RequestMapping("/admin/manageCode")
	public ModelAndView authmanageCode(HttpServletRequest request,@RequestParam String title,@RequestParam String code) {
		service.manageCode(request,title,code);
		starService.selectStarValueOneAVG(request,code);
		//댓글목록을 가지고오는 서비스 실행
		toonService.getToonCommentList(request,code);
		return new ModelAndView("admin/manageCode");
	}
	@RequestMapping("/admin/deleteCode")
	public ModelAndView authdeleteCode(HttpServletRequest request,@RequestParam String code,@RequestParam String title) throws UnsupportedEncodingException {
		boolean check=service.deleteCode(request,code);
		
		if(check) {
			return new ModelAndView("redirect:/admin/manageToon.do");
		}else {
			String Encode=URLEncoder.encode(title,"UTF-8");
			return new ModelAndView("redirect:/admin/manageDetail.do?title="+Encode);
		}
		
	}
	
	//댓글목록 보는 페이지 처리
	@RequestMapping("/users/comment_select")
	public ModelAndView commentList(HttpServletRequest request,@RequestParam String id) {
		service.GetUserCommentList(request, id);
		
		return new ModelAndView("users/comment_select");
	}
}












