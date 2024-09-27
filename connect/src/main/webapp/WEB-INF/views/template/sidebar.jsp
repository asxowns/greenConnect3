<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
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
			<p>메인 컨텐츠</p>
		</section>
	</main>

	<footer>
		<%@include file="../about/footer.jsp"%>
	</footer>

</body>
</html>