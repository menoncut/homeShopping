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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body> 

<jsp:include page="header.jsp" />
	
<section style="position: fixed;
	top: 80px;
	width: 100%;
	height: 100%;
	background-color: lightgray;">
	
<h2 style="text-align: center">회원매출조회</h2><br>

<form style="display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;">	
	<table border="1">
		<tr>
			<th width="100px%">회원번호</th>
			<th width="100px%">회원성명</th>
			<th width="100px%">고객등급</th>
			<th width="120px%">매출</th>
		</tr>	
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String grade = "";
	
	try {
		con = util.getConnection();
		stmt = con.createStatement();
		String sql = "SELECT A.custno, A.custname, A.grade, SUM(B.price) as PRICE " + 
				"FROM MEMBER_TBL_02 A, MONEY_TBL_02 B " +
				"WHERE A.custno = B.custno " +
				"GROUP BY A.custno, A.custname, A.grade " +
				"ORDER BY PRICE DESC";
		rs = stmt.executeQuery(sql);
		
			while(rs.next()){
				grade = rs.getString("grade");
					switch(grade){
					case "A":
						grade = "VIP";
						break;
					case "B":
						grade = "일반";
						break;
					case "C":
						grade = "직원";
						break;		
				}
			%>
			<tr>
				<td><%=rs.getString("custno") %></td>
				<td><%=rs.getString("custname") %></td>
				<td><%=grade %></td>
				<td><%=rs.getString("price") %></td>
			</tr>
			<%	
			}		
	} catch (Exception e){
		System.out.println("회원매출 조회 중 예외 발생" + e);
		e.printStackTrace();
	}	
%>			
</table>
</form>	

<p style="padding-left: 40px">

</p>

</section>
<jsp:include page="footer.jsp" />	
</body>
</html>