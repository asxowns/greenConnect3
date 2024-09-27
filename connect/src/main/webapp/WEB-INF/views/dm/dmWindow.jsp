<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=400px, initial-scale=1">
<meta charset="UTF-8">
<title>Direct Message</title>
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

.dmNav{
	width:100%;
	display:flex;
}
.dmNav button{
	width:50%;
	height:40px;
	border:1px solid #eee;
	background:#fff;
	cursor:pointer;
	font-weight:400;
	font-family: "Pretendard Variable", Pretendard;
	color:#adadad;
	font-size:14px;
}
.dmNav button:hover{
	color:#0091DB;
}
.dmNav button:first-child{
	border-right:0px;
	color:#0091DB;
	font-weight:500;
}
</style>
</head>
<body>
	<div id="dmHead">
		<ul>
			<li>
				<h1>쪽지</h1>
			</li>
			<li><a href="dmForm"> <img src="../resource/img/dm_icon.png">
			</a></li>
		</ul>
	</div>
	<div class="dmNav">
		<button>받은 쪽지</button>
		<button>보낸 쪽지</button>
	</div>
	
	
</body>
</html>