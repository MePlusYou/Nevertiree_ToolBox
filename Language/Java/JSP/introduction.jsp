<%@page language="java" contentType="text/"%>

<!-- import package-->
<%@page import="java.util.ArrayList,java.util.Map"%>

<!-- define global variable using "!" -->
<!-- define expression using "=" -->



<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<!-- Script block -->
	<% !int i=1;%>
	<% for(;i<100;i++){%>
		<b>Hello<%=i%>
		</b><br>
	<%}%>

	<form action="login.do" method="post">
		user:<input type="textfiled" name="usr"><br>
		pwd:<input type="password" name="pwd"><br>
		<input type="submit" name="Login">

	</form>

</body>
</html>