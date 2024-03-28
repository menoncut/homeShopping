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

<!--  	JDBConnect jbc = new JDBConnect(application); -->
<%
 	MemberDAO dao = new MemberDAO();
	
 	List<MemberVO> memberList = dao.selectList();	
 	dao.close();
%> 	
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
</head>
<body> 

<jsp:include page="header.jsp" />
	
<section style="position: fixed;
	top: 80px;
	width: 100%;
	height: 100%;
	background-color: lightgray;">
	
<h2 style="text-align: center">회원목록조회/수정</h2><br>

<form style="display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;">	
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>	
		<%
 			for(MemberVO vo : memberList){%>  
		<tr align="center">
			<td align="center"><%= vo.getCustno() %></td>
			<td align="center"><%= vo.getCustname() %></td>
			<td align="center"><%= vo.getPhone() %></td>
			<td align="center"><%= vo.getAddress() %></td>
			<td align="center"><%= vo.getJoindate() %></td>
			<td align="center"><%= vo.getGrade() %></td>
			<td align="center"><%= vo.getCity() %></td>
		</tr><%
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