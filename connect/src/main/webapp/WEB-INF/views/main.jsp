<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	justify-content: space-between;
}

aside {
	width: 200px;
	height:100%;
}

section {
	width: 880px;
	min-height: 800px;
	border: 1px solid #ccc;
}

.aboutUser {
	border-top: 2px solid #000;
	border-bottom: 2px solid #000;
}

.myPage{
	text-align:center;
}
.myPage a {
	width: 187px;
	height: 40px;
	background: #0091DB;
	text-align: center;
	border-radius: 5px;
	align-content: center;
	display: inline-block;
	color: #fff;
	font-size: 14px;
}

.sendDm{
	text-align:center;
}

.sendDm a {
	width: 187px;
	height: 40px;
	background: #EEEEEE;
	border: 1px solid #ccc;
	text-align: center;
	border-radius: 5px;
	align-content: center;
	display: inline-block;
	color: #000;
	font-size: 14px;
	margin:15px 0;
}


.boardList{
	padding:20px;
}
.boardList ul li{
	margin-bottom:20px;
}

.searchBox{
	margin-bottom:20px;
}
.searchBox form{
	display:flex;
	justify-content:center;
	margin:0;
	padding:0;
}
.searchBox input[type="text"]{
	width:140px;
	height:35px;
	border:1px solid #ccc;
	border-radius:5px 0 0 5px;
	box-sizing:border-box;
	padding-left:5px;
}
.searchBox input[type="text"]:focus{
	outline:none;
	border:1px solid #0091DB;
}
.searchBox input[type="submit"]{
	width:47px;
	height:35px;
	border:none;
	border-radius:0 5px 5px 0;
	background:#0091DB;
	color:#fff;
	cursor:pointer;
}

#calendar {
	margin: 50px;
}

.boardSections {
	display: flex;
	flex-wrap: wrap; /* flex 요소들이 여러 줄로 배치되도록 설정 */
	justify-content: center;
	margin-top: 50px;
}

.boardSection {
	width: 45%; 
	border: 1px solid #ccc;
	padding: 20px;
	margin: 10px 20px 10px 20px; /* 각 섹션 간의 세로 여백 */
	box-sizing: border-box;
}

.boardSection h3 {
	font-size: 18px;
	color: #333;
	margin-bottom: 15px;
}

.boardSection ul {
	list-style: none;
	padding: 0;
}

.boardSection ul li {
	margin-bottom: 10px;
}

.boardSection ul li a {
	color: #0091DB;
	text-decoration: none;
}

.boardSection ul li a:hover {
	text-decoration: underline;
}

</style>
</head>
<body>

	<header>
		<%@include file="./about/header.jsp"%>
	</header>

	<main>
		<aside>
			<div class="aboutUser">
				<div class="userInfo">
					<sec:authorize access="isAnonymous()">

						<p>
							<a href="joinForm">회원가입</a>
						</p>
						<p>
							<a href="loginForm">로그인</a>
						</p>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">

						<p>
							반갑습니다, <strong id="myname">${principal.username}</strong>님🙂
						</p>
						<p>
							<a href="/logout">로그아웃</a>
						</p>
					</sec:authorize>
				</div>
				<div class="funcInfo">
					<div class="myPage">
						<a href="/my/myPageMain">마이 페이지</a>
					</div>
					<div class="sendDm">
						<a href="#" onclick="return openDmWindow();">쪽지 보내기</a>
					</div>
					<div class="searchBox">
						<form>
							<input type="text">
							<input type="submit" value="검색" id="submitBtn">
						</form>
					</div>
				</div>
			</div>
			
			<div class="boardList">
				<ul>
					<li><a href="#">자유게시판</a></li>
					<li><a href="#">취업/면접 후기</a></li>
					<li><a href="#">직장 후기</a></li>
					<li><a href="#">꿀팁 게시판</a></li>
				</ul>
			</div>
		</aside>

		<section>
			<div id='calendar'></div>
			
			<div class="boardSections">
				<div class="boardSection" id="freeBoard">
					<h3>자유게시판</h3>
					<ul id="freeBoardList">
						<!-- 자유게시판 글 목록이 동적으로 추가됩니다 -->
					</ul>
				</div>
				<div class="boardSection" id="jobReviewBoard">
					<h3>취업/면접 후기</h3>
					<ul id="jobReviewBoardList">
						<!-- 취업/면접 후기 게시판 글 목록이 동적으로 추가됩니다 -->
					</ul>
				</div>
				<div class="boardSection" id="workReviewBoard">
					<h3>직장 후기</h3>
					<ul id="workReviewBoardList">
						<!-- 직장 후기 게시판 글 목록이 동적으로 추가됩니다 -->
					</ul>
				</div>
				<div class="boardSection" id="tipBoard">
					<h3>꿀팁 게시판</h3>
					<ul id="tipBoardList">
						<!-- 꿀팁 게시판 글 목록이 동적으로 추가됩니다 -->
					</ul>
				</div>
			</div>
			
		</section>
		
		
		
		
	</main>

	<footer>
		<%@include file="./about/footer.jsp"%>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
	
	<!-- 알림창 스크립트 -->
	<c:if test="${not empty msg}">
	    <script>
	        alert("${msg}"); // 알림창 표시
	    </script>
	</c:if>

	<script>
		function openDmWindow() {
			// 새 창을 엽니다. 'dmWindow'는 창의 이름입니다.
			// 'width=400,height=600'는 창의 크기를 지정합니다. 필요에 따라 조절하세요.
			window.open('dmWindow', 'dmWindow',
					'width=416,height=600,resizable=yes,scrollbars=yes');
			return false; // 기본 링크 동작을 방지합니다.
		}
		
		
		document.addEventListener("DOMContentLoaded", () => {
	        fetch("/getusername")
	        .then(response => response.text())
	        .then(data => {
	            if (data !== null && data.trim() !== '') {
	                document.getElementById("myname").innerHTML = data;
	                console.log(data);
	            }
	        });
	    
		
	        const calendarEl = document.getElementById('calendar');
	        const calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth',
	            headerToolbar: {
	                left: 'prev',
	                center: 'title',
	                right: 'next'
	            },
	            editable: true,
	            dayMaxEvents: true,
	            events: [],
	        });
			
	     // 생일 데이터 가져오기
	        fetch('/birthdays')
	            .then(response => response.json()) // JSON으로 변환
	            .then(data => {
	                // 받아온 생일 데이터를 반복문으로 처리하여 이벤트 추가
	                data.forEach(event => {
	                    calendar.addEvent({
	                        title: event.title, // 사용자 이름
	                        start: event.start, // 생일 날짜
	                        allDay: true // 하루 종일 이벤트로 설정
	                    });
	                });
	            })
	            .catch(error => console.error('Error fetching birthdays:', error));
	     	
	     // FullCalendar가 렌더링된 후, 이벤트를 콘솔에 출력합니다.
	        calendar.on('eventsSet', function(events) {
	            console.log("Events loaded:", events);
	        });
	        
	        calendar.render(); // 캘린더 렌더링
	        
	        
	        //게시판 데이터
	        fetch("/getBoardPosts")
	        	.then(response => response.json())
	        	.then(data => {
	        		console.log(data);
	        		//자유게시판
	        		const freeBoardList = document.getElementById("freeBoardList");
	        		data.freeBoard.forEach(board => {
	        			console.log(board.bno);
	        			const li = document.createElement("li");
	        			li.innerHTML = "<a href='/member/boardDetail?bno=" + board.bno + "'>" + board.title + "</a>";
	        			freeBoardList.appendChild(li);
	        		});
	        		
	        		//취업면접게시판
	        		const jobReviewBoardList = document.getElementById("jobReviewBoardList");
	        		data.jobBoard.forEach(board => {
	        			console.log(board);
	        			const li = document.createElement("li");
	                    li.innerHTML = "<a href='/member/boardDetail?bno=" + board.bno + "'>" + board.title + "</a>";
	                    jobReviewBoardList.appendChild(li);
	        		});
	        		
	        		//직장후기게시판
	        		const workReviewBoardList = document.getElementById("workReviewBoardList");
	        		data.workBoard.forEach(board => {
	        			console.log(board);
	        			const li = document.createElement("li");
	                    li.innerHTML = "<a href='/member/boardDetail?bno=" + board.bno + "'>" + board.title + "</a>";
	                    workReviewBoardList.appendChild(li);
	        		});
	        		
	        		//꿀팁게시판
	        		const tipBoardList = document.getElementById("tipBoardList");
	        		data.tipBoard.forEach(board => {
	        			console.log(board);
	        			const li = document.createElement("li");
	                    li.innerHTML = "<a href='/member/boardDetail?bno=" + board.bno + "'>" + board.title + "</a>";
	                    tipBoardList.appendChild(li);
	        		});
	        	})
	        	.catch(error => console.error('Error fetching board posts:', error));
	    });
		
	
		
		
	       

	</script>
</body>
</html>