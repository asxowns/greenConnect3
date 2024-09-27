<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

aside {
	width: 200px;
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

.boardList ul li:nth-child(1) a {
	color: #0091DB;
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

table, tr, th, td {
	border: 1px solid #ccc;
	text-align: center;
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
					<div class="nameBirth">
						<h3>변지은</h3>
						<p>1994.09.21</p>
					</div>
				</div>
				<div class="userState">
					<p>
						새싹<img src="">
					</p>
					<p>
						방문<span>0</span>
					</p>
					<p>
						내가 쓴 게시글<span>0</span>
					</p>
					<p>
						내가 쓴 댓글<span>0</span>
					</p>
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
							<input type="text"> <input type="submit" value="검색"
								id="submitBtn">
						</form>
					</div>
				</div>
			</div>

			<div class="boardList">
				<ul>
					<li><a href="/my/myPageMain">마이페이지 홈</a></li>
					<li><a href="#" id="myBoardList">내가 작성한 게시글</a></li>
					<li><a href="#" id="myReplyList">내가 작성한 댓글</a></li>
					<li><a href="#" id="myLikeBoardList">내가 좋아요한 게시글</a></li>
				</ul>
			</div>
		</aside>

		<section>
			<div id="mypageBoard"></div>
		</section>
	</main>

	<footer>
		<%@include file="../about/footer.jsp"%>
	</footer>



	<script>
		document.addEventListener('DOMContentLoaded', () => {
			
			const mypageBoard = document.getElementById('mypageBoard');
			
			const myBoardList = document.getElementById('myBoardList');
			
			const h1 = document.createElement("h1");
			
			h1.innerHTML = "";
			
			/* 내가 작성한 게시글 */
			/* 내가 작성한 게시글 */
			/* 내가 작성한 게시글 */
			/* 내가 작성한 게시글 */
			/* 내가 작성한 게시글 */
			myBoardList.addEventListener('click', ()=>{
				mypageBoard.innerHTML = "<p>데이터를 불러오는 중...</p>";
				
				const section = document.querySelector('section');
				
				h1.innerHTML = "내가 작성한 게시글";
				
				//요소 앞부분에 추가 (h1을 mypageBoard앞에 추가)
				section.insertBefore(h1, mypageBoard);
				
				fetch('/my/myBoardList?username=user1',{
					method: "GET"
				})
				.then(response => {
					if(!response.ok){
						throw new Error('Network response was not ok' + response.statusText);
					}
					return response.json();
				})
				.then(data => {
					console.log("Recived data:", JSON.stringify(data, null, 2));
					
					if(Array.isArray(data)){
						displayBoardList(data);
					}else if(typeof data === 'object' && data !== null){
						displayBoardList([data]);
					}else{
						console.error('Unexpected data format:', data);
						mypageBoard.innerHTML = "<p>데이터를 불러오는데 문제가 발생했습니다.</p>"
					}
				})
				.catch(error => {
					console.error("ERROR: ", error);
					mypageBoard.innerHTML = "<p>데이터를 불러오는데 문제가 발생했습니다!"+ error.message +"</p>"
				})
			});
			
			
			function displayBoardList(boards){
			    console.log("Boards received in displayBoardList:", JSON.stringify(boards, null, 2));
			    console.log("mypageBoard element:", mypageBoard);
			    
			    boards.forEach(board => {
			        console.log("Board item:", board);
			        console.log("bno:", board.bno);
			        console.log("title:", board.title);
			        console.log("username:", board.username);
			        console.log("regDate:", board.regDate);
			    });
			    
			    if(!mypageBoard){
			        console.error("mypageBoard element not found");
			        return;
			    }
			    
			    mypageBoard.innerHTML = "";
			    
			    if(!Array.isArray(boards) || boards.length === 0){
			        mypageBoard.innerHTML = "<p>게시글이 없거나 데이터 형식이 올바르지 않습니다.</p>";
			        return;
			    }
			    
			    const table = document.createElement('table');
			    table.style.width = '100%';
			    table.style.borderCollapse = 'collapse';

			    // 테이블 헤더 생성
			    const thead = document.createElement('thead');
			    const headerRow = document.createElement('tr');
			    const headers = ['번호', '제목', '작성자', '작성일'];
			    headers.forEach(text => {
			        const th = document.createElement('th');
			        th.textContent = text;
			        headerRow.appendChild(th);
			    });
			    thead.appendChild(headerRow);
			    table.appendChild(thead);
			    
			    // 테이블 본문 생성
			    const tbody = document.createElement('tbody');
			    boards.forEach((board, index) => {
			        const tr = document.createElement('tr');

			        // 번호
			        const tdBno = document.createElement('td');
			        tdBno.textContent = board.bno;
			        tr.appendChild(tdBno);

			        // 제목
			        const tdTitle = document.createElement('td');
			        tdTitle.textContent = board.title;
			        tr.appendChild(tdTitle);

			        // 작성자
			        const tdUsername = document.createElement('td');
			        tdUsername.textContent = board.username;
			        tr.appendChild(tdUsername);

			        // 작성일
			        const tdRegDate = document.createElement('td');
			        // 날짜 포맷팅 (옵션)
			        const formattedDate = new Date(board.regDate).toLocaleDateString('ko-KR', {
			            year: 'numeric',
			            month: '2-digit',
			            day: '2-digit'
			        });
			        tdRegDate.textContent = formattedDate;
			        tr.appendChild(tdRegDate);

			        tbody.appendChild(tr);
			    });
			    table.appendChild(tbody);
			    
			    mypageBoard.appendChild(table);
			    console.log("Created table HTML:", table.outerHTML);
			    console.log("mypageBoard content after append:", mypageBoard.innerHTML);
			}
			
			
			/* 내가 작성한 댓글 */
			/* 내가 작성한 댓글 */
			/* 내가 작성한 댓글 */
			/* 내가 작성한 댓글 */
			/* 내가 작성한 댓글 */
			const myReplyList = document.getElementById("myReplyList");
			
			myReplyList.addEventListener('click', ()=>{
				mypageBoard.innerHTML = "<p>데이터를 불러오는 중...</p>";
				
				const section = document.querySelector('section');
				
				h1.innerHTML = "내가 작성한 댓글";
				
				//요소 앞부분에 추가 (h1을 mypageBoard앞에 추가)
				section.insertBefore(h1, mypageBoard);
				
				fetch('/my/myReplyList?username=user1',{
					method: "GET"
				})
				.then(response => {
					if(!response.ok){
						throw new Error('Network response was not ok' + response.statusText);
					}
					return response.json();
				})
				.then(data => {
					console.log("Recived data:", JSON.stringify(data, null, 2));
					
					if(Array.isArray(data)){
						displayReplyList(data);
					}else if(typeof data === 'object' && data !== null){
						displayReplyList([data]);
					}else{
						console.error('Unexpected data format:', data);
						mypageBoard.innerHTML = "<p>데이터를 불러오는데 문제가 발생했습니다.</p>"
					}
				})
				.catch(error => {
					console.error("ERROR: ", error);
					mypageBoard.innerHTML = "<p>데이터를 불러오는데 문제가 발생했습니다!"+ error.message +"</p>"
				})
			});
			
			
			function displayReplyList(replys){
			    console.log("Boards received in displayBoardList:", JSON.stringify(replys, null, 2));
			    console.log("mypageBoard element:", mypageBoard);
			    
			    if(!mypageBoard){
			        console.error("mypageBoard element not found");
			        return;
			    }
			    
			    mypageBoard.innerHTML = "";
			    
			    if(!Array.isArray(replys) || replys.length === 0){
			        mypageBoard.innerHTML = "<p>게시글이 없거나 데이터 형식이 올바르지 않습니다.</p>";
			        return;
			    }
			    
			    const table = document.createElement('table');
			    table.style.width = '100%';
			    table.style.borderCollapse = 'collapse';

			    // 테이블 헤더 생성
			    const thead = document.createElement('thead');
			    const headerRow = document.createElement('tr');
			    const headers = ['번호', '댓글 내용', '작성자', '게시판 번호', '작성일'];
			    headers.forEach(text => {
			        const th = document.createElement('th');
			        th.textContent = text;
			        headerRow.appendChild(th);
			    });
			    thead.appendChild(headerRow);
			    table.appendChild(thead);
			    
			    // 테이블 본문 생성
			    const tbody = document.createElement('tbody');
			    replys.forEach((reply, index) => {
			        const tr = document.createElement('tr');

			        // 번호
			        const tdRcode = document.createElement('td');
			        tdRcode.textContent = reply.rcode;
			        tr.appendChild(tdRcode);

			        // 댓글 내용
			        const tdContent = document.createElement('td');
			        tdContent.textContent = reply.replyContent;
			        tr.appendChild(tdContent);

			        // 작성자
			        const tdUsername = document.createElement('td');
			        tdUsername.textContent = reply.username;
			        tr.appendChild(tdUsername);
			        
			        // 게시판 번호
			        const tdBno = document.createElement('td');
			        tdBno.textContent = reply.bno;
			        tr.appendChild(tdBno);

			        // 작성일
			        const tdReplyDate = document.createElement('td');
			        // 날짜 포맷팅 (옵션)
			        const formattedDate = new Date(reply.replyDate).toLocaleDateString('ko-KR', {
			            year: 'numeric',
			            month: '2-digit',
			            day: '2-digit'
			        });
			        tdReplyDate.textContent = formattedDate;
			        tr.appendChild(tdReplyDate);

			        tbody.appendChild(tr);
			    });
			    table.appendChild(tbody);
			    
			    mypageBoard.appendChild(table);
			    console.log("Created table HTML:", table.outerHTML);
			    console.log("mypageBoard content after append:", mypageBoard.innerHTML);
			}
			
			
			
			
			/* 내가 좋아요한 게시글 */
			/* 내가 좋아요한 게시글 */
			/* 내가 좋아요한 게시글 */
			/* 내가 좋아요한 게시글 */
			/* 내가 좋아요한 게시글 */
			const myLikeBoardList = document.getElementById('myLikeBoardList');
			
			myLikeBoardList.addEventListener('click', ()=>{
				mypageBoard.innerHTML = "<p>데이터를 불러오는 중...</p>";
				
				const section = document.querySelector('section');
				
				h1.innerHTML = "내가 좋아요한 게시글";
				
				//요소 앞부분에 추가 (h1을 mypageBoard앞에 추가)
				section.insertBefore(h1, mypageBoard);
				
				fetch('/my/myLikeBoardList?username=user1',{
					method: "GET"
				})
				.then(response => {
					if(!response.ok){
						throw new Error('Network response was not ok' + response.statusText);
					}
					return response.json();
				})
				.then(data => {
					console.log("Recived data:", JSON.stringify(data, null, 2));
					
					if(Array.isArray(data)){
						displayLikeBoardList(data);
					}else if(typeof data === 'object' && data !== null){
						displayLikeBoardList([data]);
					}else{
						console.error('Unexpected data format:', data);
						mypageBoard.innerHTML = "<p>데이터를 불러오는데 문제가 발생했습니다.</p>"
					}
				})
				.catch(error => {
					console.error("ERROR: ", error);
					mypageBoard.innerHTML = "<p>데이터를 불러오는데 문제가 발생했습니다!"+ error.message +"</p>"
				})
			});
			
			
			function displayLikeBoardList(likeBoards){
			    console.log("Boards received in displayBoardList:", JSON.stringify(likeBoards, null, 2));
			    console.log("mypageBoard element:", mypageBoard);
			    
			    if(!mypageBoard){
			        console.error("mypageBoard element not found");
			        return;
			    }
			    
			    mypageBoard.innerHTML = "";
			    
			    if(!Array.isArray(likeBoards) || likeBoards.length === 0){
			        mypageBoard.innerHTML = "<p>게시글이 없거나 데이터 형식이 올바르지 않습니다.</p>";
			        return;
			    }
			    
			    const table = document.createElement('table');
			    table.style.width = '100%';
			    table.style.borderCollapse = 'collapse';

			    // 테이블 헤더 생성
			    const thead = document.createElement('thead');
			    const headerRow = document.createElement('tr');
			    const headers = ['번호', '게시판 번호', '작성자'];
			    headers.forEach(text => {
			        const th = document.createElement('th');
			        th.textContent = text;
			        headerRow.appendChild(th);
			    });
			    thead.appendChild(headerRow);
			    table.appendChild(thead);
			    
			    // 테이블 본문 생성
			    const tbody = document.createElement('tbody');
			    likeBoards.forEach((like, index) => {
			        const tr = document.createElement('tr');

			        // 번호
			        const tdLikeno = document.createElement('td');
			        tdLikeno.textContent = like.likeno;
			        tr.appendChild(tdLikeno);

			        // 게시판 번호
			        const tdBno = document.createElement('td');
			        tdBno.textContent = like.bno;
			        tr.appendChild(tdBno);

			        // 작성자
			        const tdUsername = document.createElement('td');
			        tdUsername.textContent = like.username;
			        tr.appendChild(tdUsername);

			        tbody.appendChild(tr);
			    });
			    table.appendChild(tbody);
			    
			    mypageBoard.appendChild(table);
			    console.log("Created table HTML:", table.outerHTML);
			    console.log("mypageBoard content after append:", mypageBoard.innerHTML);
			}

		});
		
		
		
		
		
	</script>

</body>
</html>