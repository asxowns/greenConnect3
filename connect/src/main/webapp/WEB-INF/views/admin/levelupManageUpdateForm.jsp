<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급 수정 페이지</title>
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

.boardList ul li:nth-child(3) a {
	color: #0091DB;
}

table, tr, th, td {
	border-collapse: collapse;
	border: 1px solid #ccc;
	padding: 10px;
}

table {
	width: 100%;
	margin: 0 auto;
}

.levelupTitle {
	display: flex;
	gap: 10px;
	margin-bottom: 15px;
	align-items: center;
}

.levelupTitle h1 {
	font-weight: 400;
}

.levelupTitle p {
	font-size: 14px;
	color: #555;
	font-weight: 300;
}

table input[type="text"] {
	height: 25px;
	padding-left: 5px;
	box-sizing: border-box;
	border: none;
	border-bottom: 1px solid #ccc;
}
table input[name="description"]{
	width:100%;
}

table input[type="text"]:focus {
	outline: none;
	border-bottom: 1px solid #0091DB;
}

.levelIconArea{
	display:flex;
	align-items:center;
}
.levelIconArea img{
	padding-right:10px;
}

table input[type="submit"]{
	width:200px;
	height:30px;
	border:1px solid #ccc;
	border-radius:5px;
	background:#f7f7f7;
	cursor:pointer;
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
			<div class="levelupTitle">
				<h1>등급 관리</h1>
				<p>- 수정</p>
			</div>
			<form enctype="multipart/form-data" method="post"
				action="/updateLevelUp">
				<table>
					<tr>
						<th>등급 이름</th>
						<td><input type="text" name="levelName"
							value="${levelup.levelName }"></td>
					</tr>
					<tr>
						<th>등급 아이콘</th>
						<td>
							<div class="levelIconArea">
								<img id="imagePreview"
									src="${pageContext.request.contextPath}/images/${levelup.levelIcon}">
								<input type="file" id="levelIcon" name="levelIconFile"
									accept="image/*">
								<input type="hidden" name="levelno" value="${levelup.levelno}">
							</div>

						</td>
					</tr>
					<tr>
						<th>등급 번호</th>
						<td><input type="text" name="rank" value="${levelup.rank }"></td>
					</tr>
					<tr>
						<th>등급 설명</th>
						<td><input type="text" name="description"
							value="${levelup.description }"></td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="수정"></th>
					</tr>
				</table>
			</form>
		</section>

	</main>

	<footer>
		<%@include file="../about/footer.jsp"%>
	</footer>


	<script>
		document.getElementById('levelIcon').addEventListener(
				'change',
				function(event) {
					const file = event.target.files[0];
					const imagePreview = document
							.getElementById('imagePreview');

					if (file) {
						const reader = new FileReader();
						reader.onload = function(e) {
							imagePreview.src = e.target.result;
						};
						reader.readAsDataURL(file);
					} else {
						imagePreview.src = "${levelup.levelIcon}";
					}
				});
	</script>




</body>
</html>