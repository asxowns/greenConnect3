<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
ul {
	list-style: none;
}

a {
	text-decoration: none;
	color: #333;
}

footer {
	width: 100%;
	height: 150px;
	border-top: 1px solid #eee;
}

#foot {
	width: 1100px;
	margin:0 auto;
	height: 100%;
	align-content:center;
}

#foot ul {
	display: flex;
	justify-content:center;
	gap:25px;
	padding:10px 0;
}
#foot ul li{
	color:#767676;
	font-size:14px;
}
#foot ul li a{
	color:#767676;
	font-size:14px;
}
</style>
</head>
<body>
	<footer>
		<div id="foot">
			<ul>
				<li><a href="#">고객센터</a></li>
				<li><a href="#">이용약관</a></li>
				<li><a href="#">광고문의</a></li>
				<li><a href="#">기업소개</a></li>
				<li><a href="#">공지사항</a></li>
			</ul>
			<ul>
				<li>고객센터 : 1588-9350</li>
				<li>FAX : 051-565-9351</li>
				<li>Email : greenconnect@gmail.com</li>
			</ul>
			<ul>
				<li>ⓒ GreenConnect. All rights reserved.</li>
			</ul>
		</div>
	</footer>
</body>
</html>