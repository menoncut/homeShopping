<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.swing.SwingUtilities"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="dbpkg.JDBConnect"%>
<%@ page import="dbpkg.util"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body> 

<jsp:include page="header.jsp" />
	
<section style="position: fixed;
	top: 80px;
	width: 100%;
	height: 100%;
	background-color: lightgray;">
	
<%
// 	DateFormat df = new SimpleDateFormat("YYYYMMDD");
// 	Date joindate = new Date();
	
	Connection con = null;
	PreparedStatement psmt = null;
	String query = "";
	
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	String mode = request.getParameter("mode");
	System.out.println(custname);
		
	try
	{
		con = util.getConnection();		
		//stmt = con.createStatement();
		//ResultSet rs = stmt.executeQuery(sql);
		switch(mode){
			case "insert":
				query = "INSERT INTO member_tbl_02 VALUES(?, ?, ?, ?, to_date(?, 'YYYY-MM-DD'), ?, ?)";
				
				psmt = con.prepareStatement(query);				
				psmt.setString(1, custno);
				psmt.setString(2, custname);
				psmt.setString(3, phone);
				psmt.setString(4, address);
				psmt.setString(5, joindate);
				psmt.setString(6, grade);
				psmt.setString(7, city);
				
				psmt.executeUpdate();
				
				response.sendRedirect("list.jsp");
				break;
				
			case "modify":
				query = "UPDATE member_tbl_02 SET " +
					  "custname=?, " +
					  "phone=?, " +
					  "address=?, " +
					  "city=? " +
					  "WHERE custno=?";
				
				psmt = con.prepareStatement(query);
				psmt.setString(1, custname);
				psmt.setString(2, phone);
				psmt.setString(3, address);
				psmt.setString(4, city);
				psmt.setString(5, custno);
				
				psmt.executeUpdate();
				
				response.sendRedirect("list.jsp");
				break;
		}
	}
	catch(Exception e)
	{
		System.out.println("회원정보 수정(action) 중 예외 발생" + e);
		e.printStackTrace();
	}
%>
<p style="padding-left: 40px">

</p>

</section>
<jsp:include page="footer.jsp" />	
</body>
</html>