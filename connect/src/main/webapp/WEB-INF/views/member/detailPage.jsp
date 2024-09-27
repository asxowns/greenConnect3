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

 --------- 모달창 --------- 
.modal{
	position:absolute;
	display:none;
	justify-content: center;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background-color: rgba(0,0,0,0.4);
}

.modal_body{
	position:absolute;
	top:50%;
	width:400px;
	height:600px;
	padding:40px;  
	text-align: center;
	background-color: rgb(255,255,255); 
	border-radius:10px; 
	box-shadow:0 2px 3px 0 rgba(34,36,38,0.15); 
	transform:translateY(-50%); 
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
			<div>${categoryName}</div>
			<div>${boardDetail.title }</div>
			<div>
				<div>${user.name }</div>
				<div>${regDate }</div>
				<div>조회 ${boardDetail.view }</div>
			</div>
			<hr>
			<div>${boardDetail.content }</div>
			<div>
				<c:if test="${likeState eq 0 }">
					<a href="../member/updateLikeState?bno=${boardDetail.bno }&likeState=0&username=${loginUser.username}"><img src="${pageContext.request.contextPath}/images/heart-shape.png" alt="Like Off"></a> 좋아요 ${totalLike } 
				</c:if> 
				<c:if test="${likeState eq 1 }">
					<a href="../member/updateLikeState?bno=${boardDetail.bno }&likeState=1&username=${loginUser.username}"><img src="${pageContext.request.contextPath}/images/heart-shape-silhouette.png" alt="Like Off"></a> 좋아요 ${totalLike } 
				</c:if>
				<a href="#" onclick="openHateModal()">싫어요</a>
			</div>
			<hr>
			<!-- 댓글 -->
			<div>
				<c:if test="${replyList == null || empty replyList}">
					<div>첫 댓글을 달아보세요</div>
				</c:if>
				<c:if test="${replyList != null }">
					<c:forEach var="list" items="${replyList }">
					${list.name }
					${list.replyContent }
					${list.formatDate }<br>
				 	</c:forEach>
				</c:if>	
				<form action="../member/regReply" name="replyForm" method="post">
					<div>${loginUser.name }</div>
					<input type="text" name="replyContent" placeholder="댓글을 남겨보세요">
					<input type="hidden" name="username" value="${loginUser.username }">
					<input type="hidden" name="bno" value="${boardDetail.bno }">
					<input type="submit" value="등록">
				</form>
			</div>
			
		</section>
	</main>

	<footer>
		<%@include file="../about/footer.jsp"%>
	</footer>
</body>
</html>