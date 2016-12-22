<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<%@ page import="java.util.List" %>
<%@ page import="cn.edu.bjfu.im.UserVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
		<title>Insert title here</title>
	</head>
	<%!List<UserVO> arr; %>
	<% if(request.getAttribute("ROWS") != null) {
		arr = (List<UserVO>)request.getAttribute("ROWS") ;
	}%>

		<table border="1">
		<tr><th>name</th><th>pwd</th></tr>
		<% for(UserVO vo:arr) {%>
		<tr>
			<td><%=vo.getName() %></td>
			<td><%=vo.getPwd() %></td>
		</tr>
		<%}%>
	</table>

</html>