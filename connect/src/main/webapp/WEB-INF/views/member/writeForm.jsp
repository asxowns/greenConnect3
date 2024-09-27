<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글작성</title>
<style>
main {
	width: 1100px;
	margin: 0 auto;
	display: flex;
	justify-content:space-between;
}

section {
	width: 100%;
	min-height: 800px;
	border: 1px solid #ccc;
}
</style>
</head>
<body>

	<header>
		<%@include file="../about/header.jsp"%>
	</header>

	<main>
		<section>
			<p>카페 글쓰기</p>
			<hr>
			<form action="../member/registBoard" name="boardWriteForm" method="post" enctype="multipart/form-data">
				<select name="categoryNo">
					<option value="none">게시판을 선택해 주세요.</option>
					<c:forEach var="list" items="${categoryList }">
						<option value="${list.categoryNo }">${list.categoryName }</option>
					</c:forEach>
				</select><br>
				<input type="text" name="title" id="title" placeholder="제목을 입력해 주세요."><br>
				<input type="text" name="content" id="content" placeholder="내용을 입력해 주세요."><br>
				<input type="file" name="etc" id="etc">
				
				<input type="submit" value="등록">
			</form>
			<script type="text/javascript">
				var message = "${msg}";
				if(message){
					alter(message);
				}
			</script>
		</section>
	</main>

	<footer>
		<%@include file="../about/footer.jsp"%>
	</footer>

</body>
</html>