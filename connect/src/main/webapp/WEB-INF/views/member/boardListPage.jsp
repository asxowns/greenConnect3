<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main {
	width: 1100px;
	margin: 0 auto;
	display: flex;
	justify-content:space-between;
}

aside {
	width: 200px;
	border: 1px solid #ccc;
}

section {
	width: 880px;
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
		<aside>
			<p>사이드바</p>
		</aside>

		<section>
			<table border="1px">
				<thead>
					<tr><td></td><td>제목</td><td>작성자</td><td>작성일</td><td>조회수</td><td>좋아요</td></tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${boardList }">
						<tr>
							<td>${list.bno}</td>
							<td><a href="${pageContext.request.contextPath}/member/boardDetail?bno=${list.bno }">${list.title}</a></td>
							<td>${list.username}</td>
							<td>${list.regDate}</td>
							<td>${list.view}</td>
							<td>0</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</section>
	</main>

	<footer>
		<%@include file="../about/footer.jsp"%>
	</footer>

</body>
</html>