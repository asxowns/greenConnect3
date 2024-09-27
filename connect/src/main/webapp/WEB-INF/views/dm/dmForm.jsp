<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
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

.reciveUser{
	height:40px;
	display:flex;
	align-items:center;
	border-bottom:1px solid #eee;
	gap:20px;
}
.reciveUser h3{
	font-size:14px;
	color:#333;
	margin-left:20px;
	font-weight:500;
}
.reciveUser input[type="text"]{
	height:25px;
	font-size:14px;
	color:#666;
	font-weight:300;
	border:0px;
	border-bottom:1px solid #ccc;
	padding-left:5px;
	box-sizing:border-box;
}

.msgArea{
	width:100%;
	text-align:center;
	margin-top:20px;
}
.msgArea textarea{
	width:360px;
	height:200px;
	border:1px solid #ccc;
	resize:none;
	padding:5px;
	box-sizing:border-box;
}
.msgArea input[type="submit"]{
	width:70px;
	height:30px;
	background:#0091DB;
	border:0px;
	border-radius:5px;
	color:#fff;
	font-family: "Pretendard Variable", Pretendard;
	cursor:pointer;
	margin-top:20px;
}
.msgArea button{
	width:50px;
	height:30px;
	background:#eee;
	border:1px solid #ccc;
	border-radius:5px;
	color:#333;
	font-family: "Pretendard Variable", Pretendard;
}
</style>
</head>
<body>
<div id="dmHead">
		<ul>
			<li>
				<h1>쪽지</h1>
			</li>
			<li><a href="dmWindow"> <img src="../resource/img/dm_back.png">
			</a></li>
		</ul>
	</div>

	<form action="sendDm" method="POST">
		<div class="reciveUser">
			<h3>받는 사람</h3>
			<p><input type="text" name="reciveUser"></p>
		</div>

		<div class="msgArea">
			<textarea name="content"></textarea>
			<input type="submit" value="보내기">
			<button>취소</button>
	</form>
	</div>
	
	
	
	
	
</body>
</html>