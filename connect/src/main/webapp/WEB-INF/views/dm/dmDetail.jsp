<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


#dmDetail{
	width:100%;
}
#dmDetail h4{
	border-bottom:1px solid #eee;
	padding:15px;
}
#dmDetail h4 strong{
	font-size:14px;
	padding-right:10px;
	font-weight:300;
}
#dmDetail h4 span{
	color:#ccc;
	font-size:12px;
	font-weight:400;
	padding-left:30px;
}

.dmContent{
	width:100%;
	padding:15px;
	box-sizing: border-box;
}
.dmContent p{
	max-width: 100%;
    word-wrap: break-word;
    white-space: pre-wrap;
    font-size: 14px;
    line-height: 1.5;
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

	<div id="dmDetail">
		<h4><strong>보낸 사람 :</strong>${dm.sendUser} <span><fmt:formatDate value="${dm.date}" pattern="yyyy-MM-dd"/></span></h4>
		<div class="dmContent">
			<p>${dm.content }</p>		
		</div>
		
	</div>


</body>
</html>