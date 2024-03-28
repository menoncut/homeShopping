<%@page import="java.util.Date"%>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection con = null;
	Statement stmt = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String custname = "";
	String phone = "";
	String address = "";
	Date joindate = new Date();	
	String grade = "";
	String citycode = "";	
	
	String mod_custno = request.getParameter("mod_custno");
	
	try {
		con = util.getConnection();
		stmt = con.createStatement();
		String sql = "SELECT * FROM MEMBER_TBL_02 WHERE custno=" + mod_custno;				 
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			custname = rs.getString("custname");
			phone = rs.getString("phone");
			address = rs.getString("address");
			joindate = rs.getDate("joindate");
			grade = rs.getString("grade");
			citycode = rs.getString("city");			
		}
	} catch(Exception e){
		System.out.println("회원정보 수정(modify) 중 예외 발생" + e);
			e.printStackTrace();
	}
%>	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body> 

<jsp:include page="header.jsp" />
	
<section style="position: fixed;
	top: 80px;
	width: 100%;
	height: 100%;
	background-color: lightgray;">
	
<h2 style="text-align: center">홈쇼핑 회원 정보 수정</h2><br>

<form method="post" name="form" action="action.jsp" 
     style="display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;">
	
	<input type="hidden" name="mode" value="modify">	
	<table border="1">
		<tr>
			<th width="200px">회원번호(자동발생)</th>
			<td width="380px"><input type="text" name="custno" size="10" style="margin-left:-272px" value="<%=mod_custno%>" readonly></td>
		</tr>	
		<tr>
			<th width="200px">회원성명</th>
			<td width="250px"><input type="text" name="custname" size="10" style="margin-left:-272px" value="<%=custname%>"></td>
		</tr>	
		<tr>
			<th width="200px">회원전화</th>
			<td width="250px"><input type="text" name="phone" style="margin-left:-205px" value="<%=phone%>"></td>
		</tr>	
		<tr>
			<th width="200px">회원주소</th>
			<td width="250px"><input type="text" name="address" size="47" style="margin-left:-25px" value="<%=address%>"></td>
		</tr>	
		<tr>
			<th width="200px">가입일자</th>
			<td width="250px"><input type="text" name="joindate" size="10" style="margin-left:-272px" value="<%= joindate %>" readonly></td>
		</tr>	
		<tr>
			<th width="270px">고객등급[A:VIP,B:일반,C:직원]</th>
			<td width="250px"><input type="text" name="grade" size="10" style="margin-left:-272px" value="<%=grade%>" readonly></td>
		</tr>	
		<tr>
			<th width="200px">도시코드</th>
			<td width="250px"><input type="text" name="city" size="10" style="margin-left:-272px" value="<%=citycode%>"></td>
		</tr>	
		<tr>
			<td colspan="2"><input type="submit" onclick="" value="수정"/>
			<input type="button" onclick="location='remove.jsp?del_custno=<%=mod_custno%>'" value="삭제">
			<input type="button" onclick="location='list.jsp'" value="조회"/>			
			</td>
		</tr>	

</table>
</form>	

<p style="padding-left: 40px">

</p>

</section>
<jsp:include page="footer.jsp" />	
</body>
</html>