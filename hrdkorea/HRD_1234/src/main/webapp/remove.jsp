<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="dbpkg.util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remove</title>
</head>
<body>
<%
	String del_custno = request.getParameter("del_custno");

	Connection con = null;
	PreparedStatement psmt = null;	
	
	try {
		System.out.println(del_custno);
		con = util.getConnection();
		
		String query = "DELETE FROM MEMBER_TBL_02 WHERE CUSTNO=?";
		
		psmt = con.prepareStatement(query);
		psmt.setString(1, del_custno);
		System.out.println(del_custno);
		psmt.executeUpdate();
		
		response.sendRedirect("list.jsp");		
	} catch (Exception e) {
		System.out.println("회원정보 삭제 중 예외 발생" + e);
		e.printStackTrace();
	}
%>
</body>
</html>