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
<%-- 
// // 	JDBConnect jbc = new JDBConnect(application);
// 	MemberDAO dao = new MemberDAO(application);
	
// 	List<MemberVO> memberList = dao.selectList(100001);	
// 	dao.close();
// 	//MemberVO vo = new MemberVO();
	
--%>
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
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String grade = "";
	
	try {
		con = util.getConnection();
		stmt = con.createStatement();
		String sql = "SELECT * FROM member_tbl_02 ORDER BY custno";
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
			<td><a href="modify.jsp?mod_custno=<%=rs.getString("custno") %>">
				<%=rs.getString("custno") %></a></td>
			<td><%=rs.getString("custname") %></td>
			<td><%=rs.getString("phone") %></td>
			<td><%=rs.getString("address") %></td>
			<td><%=rs.getDate("joindate") %></td>
			<td><%=grade %></td>
			<td><%=rs.getString("city") %></td>
		</tr>		
		<%			
		}		
	} catch (Exception e){
		System.out.println("회원목록 조회 중 예외 발생" + e);
		e.printStackTrace();
	}	
%>			

<%-- 		<% --%>
<%-- 			for(MemberVO vo : memberList){%>  --%>
<!-- 		<tr align="center"> -->
<%-- 			<td align="center"><%= vo.getCustno() %></td> --%>
<%-- 			<td align="center"><%= vo.getCustname() %></td> --%>
<%-- 			<td align="center"><%= vo.getPhone() %></td> --%>
<%-- 			<td align="center"><%= vo.getAddress() %></td> --%>
<%-- 			<td align="center"><%= vo.getJoindate() %></td> --%>
<%-- 			<td align="center"><%= vo.getGrade() %></td> --%>
<%-- 			<td align="center"><%= vo.getCity() %></td> --%>
<%-- 		</tr><% --%>

<%-- 		%>  --%>
</table>
</form>	

<p style="padding-left: 40px">

</p>

</section>
<jsp:include page="footer.jsp" />	
</body>
</html>