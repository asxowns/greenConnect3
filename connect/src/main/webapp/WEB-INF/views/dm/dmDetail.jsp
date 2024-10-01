<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 상세보기</title>
<style>
* {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
	color: #333;
}

body {
	font-family: "Pretendard Variable", Pretendard;
}

#dmHead {
	width: 100%;
	height: 50px;
	background: #0091DB;
}

#dmHead ul {
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-right: 20px;
	margin-left: 20px;
}

#dmHead ul li h1 {
	font-size: 18px;
	color: #fff;
	font-weight: 500;
}
</style>
</head>
<body>

	<div id="dmHead">
		<ul>
			<li>
				<h1>쪽지</h1>
			</li>
			<li><a href="dmWindow"> <img
					src="../resource/img/dm_back.png">
			</a></li>
		</ul>
	</div>

</body>
</html>