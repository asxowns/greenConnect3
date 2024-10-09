<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	gap: 15px;
	padding: 20px;
	border-bottom: 1px solid #eee;
}

.userInfo .userIcon {
	width: 50px;
	height: 50px;
	background: #d9d9d9;
	border-radius: 50%;
}

.userInfo .nameBirth h3 {
	font-size: 16px;
	font-weight: 300;
	padding-bottom: 2px;
}

.userInfo .nameBirth p {
	font-size: 12px;
	color: #9d9d9d;
	font-weight: 300;
}

.userState {
	padding: 15px;
}

.userState p {
	display: flex;
	justify-content: space-between;
	font-size: 12px;
	margin-bottom: 8px;
}

.userState #levelZone {
	justify-content: flex-start;
	align-items: center;
	gap: 5px;
}

.userState #levelZone img {
	width: 13px;
}

.userState p span {
	color: #a7a7a7;
}

.myPage {
	text-align: center;
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

.sendDm {
	text-align: center;
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
	margin: 15px 0;
}

.boardList {
	padding: 20px;
}

.boardList ul li {
	margin-bottom: 20px;
}

.searchBox {
	margin-bottom: 20px;
}

.searchBox form {
	display: flex;
	justify-content: center;
	margin: 0;
	padding: 0;
}

.searchBox input[type="text"] {
	width: 140px;
	height: 35px;
	border: 1px solid #ccc;
	border-radius: 5px 0 0 5px;
	box-sizing: border-box;
	padding-left: 5px;
}

.searchBox input[type="text"]:focus {
	outline: none;
	border: 1px solid #0091DB;
}

.searchBox input[type="submit"] {
	width: 47px;
	height: 35px;
	border: none;
	border-radius: 0 5px 5px 0;
	background: #0091DB;
	color: #fff;
	cursor: pointer;
}

#calendar {
	width: 100%; /* 너비 설정 */
    height: auto; /* 높이 자동 */
}

.boardSections {
	display: flex;
	flex-wrap: wrap; /* flex 요소들이 여러 줄로 배치되도록 설정 */
	justify-content: space-between;
	margin-top: 50px;
	margin-bottom: 30px;
	gap: 50px;
}

.boardSection {
	width: 47%;
	height: 200px;
	border: 1px solid #ccc;
	padding: 20px;
	box-sizing: border-box;
	overflow-y: auto; /* 내용이 넘칠 경우 스크롤 생성 */
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

#logout {
	text-align: center;
	margin-bottom: 15px;
}

#logout a {
	width: 187px;
	height: 40px;
	text-align: center;
	border-radius: 5px;
	align-content: center;
	display: inline-block;
	font-size: 14px;
	border: 1px solid #ccc;
}

.hr {
	width: 187px;
	margin: 0 auto;
	margin-bottom: 15px;
	color: #ccc;
}

/* 로그인 폼 스타일 */
.aboutUser form {
	display: flex;
	flex-direction: column; /* 세로로 쌓이도록 설정 */
	padding: 20px;
	margin-top: 10px;
}

.aboutUser form input[type="text"], .aboutUser form input[type="password"]
	{
	width: 100%; /* 가로폭을 100%로 설정 */
	height: 35px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box; /* 패딩과 테두리를 포함한 총 폭 계산 */
	padding-left: 10px; /* 패딩 추가 */
}

#by-submit, .aboutUser form input[type="button"] {
	width: 100%; /* 버튼도 가로폭 100%로 설정 */
	height: 36px;
	background: #0091DB; /* 기본 버튼 배경색 */
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 10px; /* 버튼 사이 여백 추가 */
}

.aboutUser form input[type="button"] {
	background: #EEEEEE; /* 회원가입 버튼 배경색 */
	color: #000; /* 회원가입 버튼 글자색 */
	border: 1px solid #ccc; /* 테두리 추가 */
}

.aboutUser form input[type="submit"]:hover, .aboutUser form input[type="button"]:hover
	{
	opacity: 0.9; /* 마우스 오버 시 약간 투명해지도록 설정 */
}

.searchBox form {
	display: flex;
	justify-content: center;
	flex-direction: row;
	margin: 0;
	padding: 0;
}

.searchBox input[type="text"] {
	width: 140px !important;
	height: 35px;
	border: 1px solid #ccc;
	border-right: none;
	border-radius: 5px 0 0 5px;
	box-sizing: border-box;
	padding-left: 5px;
}

.searchBox input[type="text"]:focus {
	outline: none;
	border: 1px solid #0091DB;
}

.searchBox input[type="submit"] {
	width: 47px;
	height: 35px;
	border: none;
	border-radius: 0 5px 5px 0;
	background: #0091DB;
	color: #fff;
	cursor: pointer;
}

.alert {
    padding: 15px; /* 여백 설정 */
    margin: 20px auto; /* 위 아래 여백을 설정하고, 좌우는 자동으로 설정하여 가운데 정렬 */
    border: 1px solid transparent; /* 테두리 초기화 */
    border-radius: 5px; /* 모서리 둥글게 */
    background-color: #fff3cd; /* 배경 색상 */
    color: #856404; /* 글자 색상 */
    text-align: center; /* 텍스트 중앙 정렬 */
    max-width: 600px; /* 최대 너비 설정 */
}

.alert p {
    margin: 0; /* 기본 여백 제거 */
}

.alert a {
    color: #0c5460; /* 링크 색상 */
    text-decoration: underline; /* 링크에 밑줄 추가 */
}

.alert a:hover {
    color: #0056b3; /* 마우스 오버 시 링크 색상 */
    text-decoration: none; /* 마우스 오버 시 밑줄 제거 */
}

section article{
	border: 1px solid #ccc;
	padding: 50px;
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
				<sec:authorize access="isAnonymous()">
					<!-- 비회원 로그인 폼 -->
					<form action="loginDo" method="post">
						<input type="text" name="username" placeholder="ID"><br>
						<input type="password" name="password" placeholder="PW"><br>
						<input id="by-submit" type="submit" value="로그인"> <a
							href="joinForm"><input id="by-join" type="button"
							value="회원가입"></a>
					</form>
				</sec:authorize>


				<sec:authorize access="isAuthenticated()">
					<!-- 회원 정보 표시 -->
					<div class="userInfo">
						<p class="userIcon">
							<img src="">
						</p>
						<div class="nameBirth">
							<h3 id="myname">${principal.username}</h3>
							<p>${user.birth}</p>
						</div>
					</div>
					<div class="userState">
						<p id="levelZone"></p>
						<p>
							방문<span>0</span>
						</p>
						<p>
							내가 쓴 게시글<span>${myBoardCount }</span>
						</p>
						<p>
							내가 쓴 댓글<span>${myReplyCount }</span>
						</p>
					</div>

					<p id="logout">
						<a href="/logout">로그아웃</a>
						<hr class="hr">
					</p>


					<div class="funcInfo">
						<div class="myPage">
							<a href="/my/myPageMain">마이 페이지</a>
						</div>
						<div class="sendDm">
							<a href="#" onclick="return openDmWindow();">쪽지 보내기</a>
						</div>
					</div>	
				</sec:authorize>
				
				<div class="searchBox">
					<form>
						<input type="text"> <input type="submit" value="검색"
							id="submitBtn">
					</form>
				</div>
			</div>

			<div class="boardList">
				<ul>
					<li><a href="/member/boardList?categoryNo=1">자유게시판</a></li>
					<li><a href="/member/boardList?categoryNo=2">취업/면접 후기</a></li>
					<li><a href="/member/boardList?categoryNo=3">직장 후기</a></li>
					<li><a href="/member/boardList?categoryNo=4">꿀팁 게시판</a></li>
				</ul>
			</div>
		</aside>

		<section>
		<sec:authorize access="isAuthenticated()">
			<article>
				<div id='calendar'></div>			
			</article>

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
		</sec:authorize>
		
		<sec:authorize access="isAnonymous()">
        <div class="alert alert-warning">
            <p>비회원입니다. 로그인 또는 <a href="joinForm">회원가입</a> 후 이용해 주세요.</p>
        </div>
    	</sec:authorize>

		</section>
	</main>

	<footer>
		<%@include file="./about/footer.jsp"%>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>

	<!-- 알림창 스크립트 -->
	<c:if test="${not empty sessionScope.loginError}">
		<script>
	        alert("${sessionScope.loginError}"); // 로그인 실패 메시지 표시
	        console.log(loginError);
	    </script>
		<c:remove var="loginError" scope="session" />
		<!-- 메시지를 세션에서 제거 -->
	</c:if>

	<script>
    // 등급존 변수 선언
    let levelno = ${user.levelno}; // 숫자 타입이므로 따옴표 불필요
    let username = "${user.username}"; // 문자열 타입이므로 따옴표 필요
    console.log("levelno: " + levelno);
    console.log("username: " + username);
    
    // 등급 번호에 따라 이름 주기
    function displayLevel() {
        const levelZone = document.getElementById("levelZone");
        const levelImg = document.createElement("img");
        
        if (levelno == 1) {
            levelZone.innerHTML = "새싹";
            levelImg.src = "../resource/img/rank1.png";
        } else if (levelno == 2) {
            levelZone.innerHTML = "나무";
            levelImg.src = "../resource/img/rank2.png";
        } else if (levelno == 3) {
            levelZone.innerHTML = "꽃나무";
            levelImg.src = "../resource/img/rank2.png";
        }
        
        levelZone.appendChild(levelImg);
    }

    document.addEventListener("DOMContentLoaded", () => {
        // 로그인한 username 가져오기
        fetch("/getusername")
            .then(response => response.text())
            .then(data => {
                if (data !== null && data.trim() !== '') {
                    document.getElementById("myname").innerHTML = data;
                    console.log(data);
                }
            })
            .catch(error => console.error('Error fetching username:', error));

        // 달력
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
            .then(response => response.json())
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
        
        // 게시판 데이터
        fetch("/getBoardPosts")
            .then(response => response.json())
            .then(data => {
                console.log(data);
                // 자유게시판
                const freeBoardList = document.getElementById("freeBoardList");
                data.freeBoard.forEach(board => {
                    console.log(board.bno);
                    const li = document.createElement("li");
                    li.innerHTML = "<a href='/member/boardDetail?bno=" + board.bno + "'>" + board.title + "</a>";
                    freeBoardList.appendChild(li);
                });
                
                // 취업면접게시판
                const jobReviewBoardList = document.getElementById("jobReviewBoardList");
                data.jobBoard.forEach(board => {
                    console.log(board);
                    const li = document.createElement("li");
                    li.innerHTML = "<a href='/member/boardDetail?bno=" + board.bno + "'>" + board.title + "</a>";
                    jobReviewBoardList.appendChild(li);
                });
                
                // 직장후기게시판
                const workReviewBoardList = document.getElementById("workReviewBoardList");
                data.workBoard.forEach(board => {
                    console.log(board);
                    const li = document.createElement("li");
                    li.innerHTML = "<a href='/member/boardDetail?bno=" + board.bno + "'>" + board.title + "</a>";
                    workReviewBoardList.appendChild(li);
                });
                
                // 꿀팁게시판
                const tipBoardList = document.getElementById("tipBoardList");
                data.tipBoard.forEach(board => {
                    console.log(board);
                    const li = document.createElement("li");
                    li.innerHTML = "<a href='/member/boardDetail?bno=" + board.bno + "'>" + board.title + "</a>";
                    tipBoardList.appendChild(li);
                });
            })
            .catch(error => console.error('Error fetching board posts:', error));
        
        // 레벨 표시 함수 호출
        displayLevel();
    });

    function openDmWindow() {
        // 새 창을 엽니다. 'dmWindow'는 창의 이름입니다.
        // 'width=400,height=600'는 창의 크기를 지정합니다. 필요에 따라 조절하세요.
        window.open('dmWindow', 'dmWindow',
            'width=416,height=600,resizable=yes,scrollbars=yes');
        return false; // 기본 링크 동작을 방지합니다.
    }
</script>
</body>
</html>