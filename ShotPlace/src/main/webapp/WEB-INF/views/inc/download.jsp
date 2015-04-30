<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.springframework.util.FileCopyUtils" %>
<%@ page import="net.my.commons.WebContants" %>
<%
	//request.setCharacterEncoding("UTF-8");//필터가 이 작업을 대신 해준다.
	String filename = request.getParameter("filename");

	File file = new File(WebContants.BASE_PATH + filename);
	//확장자 찾아서
	String filetype = filename.substring(filename.indexOf(".") + 1, filename.length());
	//왼쪽 오른쪽 공백제거, txt비교(대소문자 무시)
	if (filetype.trim().equalsIgnoreCase("txt")) {
		response.setContentType("text/plain");
	} else {
		response.setContentType("application/octet-stream");
	}

	response.setContentLength((int) file.length());

	boolean ie = request.getHeader("User-Agent").indexOf("MSIE") != -1;
	if (ie) {
		filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ");
	} else {
		filename = new String(filename.getBytes("UTF-8"), "8859_1");
	}
	
	response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
	
	/*jsp에서는 servlet으로 변환될때 내부적으로 out 객체가 자동으로 생성되기 때문에 
	따로 out 객체를 만들면 충돌이 일어나서 저런 메시지가 뜨는 것*/
	out.clear();
	
	//출력스트림 생성
	OutputStream outputStream = response.getOutputStream();
	FileInputStream fis = null;

	try {//전송
		fis = new FileInputStream(file);
		FileCopyUtils.copy(fis, outputStream);
	} finally {
		if (fis != null) {
			try {
				fis.close();
			} catch (IOException e) {}
		}
	}
	
	out.flush();
%>