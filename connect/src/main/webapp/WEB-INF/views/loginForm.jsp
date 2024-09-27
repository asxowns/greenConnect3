<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.by-main {
	border: 2px solid #eee;
	width: 600px;
	height: 450px;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	text-align: center;
}

input {
	margin: 10px 0;
	padding: 12px;
	width: 200px;
	
}
h3{
	margin: 70px;
}
#by-submit{
	margin-top: 20px;
	background-color: #0091DB;
	border : none;
	border-radius: 5px;
	color: white;
	cursor: pointer;
}
#by-submit:hover{
	background-color: #0078b5;
}
</style>
</head>
<body>

	<main class="by-main">
		<h3>로그인</h3>

		<form action="loginDo" method="post">
			<input type="text" name="username" placeholder="ID"><br>
			<input type="password" name="password" placeholder="PW"><br>
			<input id="by-submit" type="submit" value="로그인">
		</form>

		<p style="color: red;">
			<c:if test="${not empty error }">
				${error }
			</c:if>
	</main>
</body>
</html>
