<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급 리스트</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

aside {
	width: 200px;
	height: 100%;
}

section {
	width: 880px;
	min-height: 800px;
}

.aboutUser {
	border-top: 2px solid #000;
	border-bottom: 2px solid #000;
}

.userInfo {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 15px;
	padding: 20px 0;
}

.userInfo .userIcon {
	width: 50px;
	height: 50px;
	background: #d9d9d9;
	border-radius: 50%;
}

.searchBox {
	text-align: center;
}

.boardList {
	padding: 20px;
}

.boardList ul li {
	margin-bottom: 20px;
}
.boardList ul li:nth-child(3) a{
	color:#0091DB;
}

.sectionTitle {
	border-bottom: 1px solid #000;
	padding-bottom:15px;
	display:flex;
	justify-content:space-between;
	align-items:center;
}
.sectionTitle h1{
	font-weight:500;
}

.sectionTitle p a{
	display:inline-block;
	background:#f7f7f7;
	border:1px solid #ccc;
	border-radius:5px;
	padding:5px 10px;
	font-size:14px;
}
.sectionTitle p a:hover{
	background:#eee;
}

.levelupTitle {
	display: flex;
	border-bottom: 1px solid #eee;
	padding: 15px 0;
}

.levelupTitle li {
	font-size: 14px;
	color: #7f7f7f;
}

.levelupTitle li:nth-child(1) {
	width: 20%;
	text-align: center;
}

.levelupTitle li:nth-child(2) {
	width: 80%;
	text-align: center;
}

.levelupList {
	display: flex;
	align-items:center;
}
.levelupList:hover{
	background:#f9f9f9;
}

.levelupList li {
	display:flex;
	font-size: 16px;
	color: #000;
	padding:20px 0;
}

.levelupList li:nth-child(1) {
	width: 20%;
	text-align: left;
	padding-left:50px;
}
.levelupList li:nth-child(1) img{
	display:inline-block;
	padding-right:15px;
}

.levelupList li:nth-child(2) {
	width: 80%;
	text-align: left;
	padding-left:100px;
}
.deleteBtn{
	width:70px;
	height:30px;
	display:inline-block;
	font-size:12px;
	border:1px solid #ccc;
	border-radius:5px;
	background:#f7f7f7;
	text-align:center;
	line-height:30px;
	margin-right:10px;
}
</style>
</head>
<body>
	<header>
		<%@include file="../about/header.jsp"%>
	</header>

	<main>
		<aside>
			<div class="aboutUser">
				<div class="userInfo">
					<p class="userIcon">
						<img src="">
					</p>
					<p>관리자</p>
				</div>
				<div class="funcInfo">
					<p class="searchBox">
						<input type="search">
					</p>
				</div>
			</div>

			<div class="boardList">
				<ul>
					<li><a href="#">대시보드</a></li>
					<li><a href="#">회원 관리</a></li>
					<li><a href="#">등급 관리</a></li>
					<li><a href="#">공지 관리</a></li>
				</ul>
			</div>
		</aside>

		<section>
			<div class="sectionTitle">
				<h1>등급 관리</h1>
				<p>
					<a href="levelupManageInsertForm">추가 +</a>
				</p>
			</div>
			<div>
				<ul class="levelupTitle">
					<li>등급명</li>
					<li>등급 설명</li>
				</ul>

				<c:forEach var="level" items="${level }">
					<ul class="levelupList" data-levelno="${level.levelno }">
						<li><img src="${pageContext.request.contextPath}/images/${level.levelIcon}"><span>${level.levelName}</span></li>
						<li>${level.description }</li>
						<a href="deleteLevelup?levelno=${level.levelno }" class="deleteBtn">삭제</a>
					</ul>
				</c:forEach>
			</div>
		</section>
	</main>

	<footer>
		<%@include file="../about/footer.jsp"%>
	</footer>
	
	
	<script>
		const levelnoList = document.querySelectorAll(".levelupList");
		
		levelnoList.forEach((item)=>{
			const levelno = item.dataset.levelno;
			
			item.addEventListener("click", ()=>{
				window.location.href="/levelupManageUpdateForm?levelno=" + levelno;
			});
		});
		
		
	</script>
	
	
	
</body>
</html>