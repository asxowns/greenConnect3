<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Direct Message</title>
<style>
* {
	margin: 0;
	padding: 0;
}
body{
	overflow-y: scroll; /* 항상 세로 스크롤바 표시 */
    scrollbar-width: thin; /* Firefox */
    width: 100%; /* 스크롤바 너비(약 20px) 고려 */
    margin: 0 auto; /* 중앙 정렬 */
}
/* WebKit 브라우저 (Chrome, Safari 등)를 위한 스크롤바 스타일 */
body::-webkit-scrollbar {
    width: 2px;
}

body::-webkit-scrollbar-thumb {
    background-color: rgba(0,0,0,0.2);
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

.dmNav {
	width: 100%;
	display: flex;
}

.dmNav button {
	width: 50%;
	height: 40px;
	border: 1px solid #eee;
	background: #fff;
	cursor: pointer;
	font-weight: 400;
	font-family: "Pretendard Variable", Pretendard;
	color: #adadad;
	font-size: 14px;
}

.dmNav button:hover {
	color: #0091DB;
}

.dmNav button:first-child {
	border-right: 0px;
	color: #0091DB;
	font-weight: 500;
}

table, tr, th, td {
	border: 1px solid #ccc;
	padding: 5px;
}

.listBox {
	border-bottom: 1px solid #eee;
	cursor: pointer;
	display:flex;
	align-items:center;
	padding:10px;
}
.listBox img{
	width:40px;
	height:40px;
	background:#ccc;
	border-radius:50%;
	margin-right:15px;
}

.listBox h3 {
	font-size: 14px;
	font-weight: 400;
	color: #333;
}

.listBox p {
	font-size: 13px;
	font-weight: 300;
	color: #333;
	padding:5px 0 2px;
}

.listBox .dmDate {
	font-size: 11px;
	font-weight: 400;
	color: #ccc;
	padding: 0;
}
</style>
</head>
<body>
	<div id="dmHead">
		<ul>
			<li>
				<h1>쪽지</h1>
			</li>
			<li><a href="dmForm"> <img src="../resource/img/dm_icon.png">
			</a></li>
		</ul>
	</div>
	<div class="dmNav">
		<button id="reciveDm-btn">받은 쪽지</button>
		<button id="sendDm-btn">보낸 쪽지</button>
	</div>

	<div id="dmList"></div>

	<script>
		
	document.addEventListener("DOMContentLoaded", ()=>{
		
		let username = "${username}";
		
		const dmList = document.getElementById("dmList");
		const reciveDmBtn = document.getElementById("reciveDm-btn");
		const sendDmBtn = document.getElementById("sendDm-btn");
		
		dmList.innerHTML = "목록 불러 오는중...";
		
		fetch("/myReciveDm?reciveUser=" + username,{
			method:"GET"
		})
		.then(response =>{
			if(!response.ok){
				throw new Error(response.statusText);
			}
			return response.json();	
		})
		.then(data => {
			console.log("data", data);
			displayDmList(data);
		})
		.catch(error => {
			console.error("ERROR", error);
			dmList.innerHTML = "<p>데이터를 불러오는데 실패 하였습니다.</p>";
		})
		
		reciveDmBtn.addEventListener("click", ()=>{
			
			sendDmBtn.style.color = "#adadad";
			sendDmBtn.style.fontWeight = "400";
			
			reciveDmBtn.style.color = "#0091DB";
			reciveDmBtn.style.fontWeight = "500";
			
			/* 받은 쪽지 */
			/* 받은 쪽지 */
			/* 받은 쪽지 */
			dmList.innerHTML = "목록 불러 오는중...";
			
			fetch("/myReciveDm?reciveUser=" + username,{
				method:"GET"
			})
			.then(response =>{
				if(!response.ok){
					throw new Error(response.statusText);
				}
				return response.json();	
			})
			.then(data => {
				console.log("data", data);
				displayDmList(data);
			})
			.catch(error => {
				console.error("ERROR", error);
				dmList.innerHTML = "<p>데이터를 불러오는데 실패 하였습니다.</p>";
			})
			
		});
		
		function displayDmList(lists){
			dmList.innerHTML = "";
				
			lists.forEach(list =>{
				
				// 감싸는 박스
				const divBox = document.createElement('div');
				divBox.classList.add("listBox");
				
				divBox.addEventListener("click", ()=>{
					window.location.href= '/dmDetail?dno=' + list.dno;
				});
				
				
				// 유저 이미지 박스
				const listImg = document.createElement("div");
				const img = document.createElement("img");
				listImg.appendChild(img);
				
				// 유저 텍스트 박스
				const listText = document.createElement("div");
				
				// 보낸 유저 이름
				const tdSendUser = document.createElement("h3");
				tdSendUser.textContent = list.sendUser;
				divBox.appendChild(tdSendUser);
				
				// 쪽지 내용
				const tdContent = document.createElement("p");
				tdContent.textContent = list.content;
				divBox.appendChild(tdContent);
				
				// 쪽지 보낸 날짜
				const tdDate = document.createElement("p");
				const formattedDate = new Date(list.date).toLocaleDateString('ko-KR', {
		            year: 'numeric',
		            month: '2-digit',
		            day: '2-digit'
		        });
				tdDate.textContent = formattedDate;
				tdDate.classList.add("dmDate");
				
				listText.appendChild(tdSendUser);
				listText.appendChild(tdContent);
				listText.appendChild(tdDate);
				
				divBox.appendChild(listImg);
				divBox.appendChild(listText);
				
				dmList.appendChild(divBox);
			});
		}
		
			/* 보낸 쪽지 */
			/* 보낸 쪽지 */
			/* 보낸 쪽지 */
			sendDmBtn.addEventListener("click", ()=>{
				
				reciveDmBtn.style.color = "#adadad";
				reciveDmBtn.style.fontWeight = "400";
				
				sendDmBtn.style.color = "#0091DB";
				sendDmBtn.style.fontWeight = "500";
				
				dmList.innerHTML = "목록 불러 오는중...";
				
				fetch("/mySendDm?sendUser=" + username,{
					method:"GET"
				})
				.then(response =>{
					if(!response.ok){
						throw new Error(response.statusText);
					}
					return response.json();	
				})
				.then(data => {
					console.log("data", data);
					displaySendDmList(data);
				})
				.catch(error => {
					console.error("ERROR", error);
					dmList.innerHTML = "<p>데이터를 불러오는데 실패 하였습니다.</p>";
				})
				
			});
			
			function displaySendDmList(lists){
				dmList.innerHTML = "";
					
				lists.forEach(list =>{
					
					// 감싸는 박스
					const divBox = document.createElement('div');
					divBox.classList.add("listBox");
					
					divBox.addEventListener("click", ()=>{
						window.location.href= '/dmDetail?dno=' + list.dno;
					});
					
					// 유저 이미지 박스
					const listImg = document.createElement("div");
					const img = document.createElement("img");
					listImg.appendChild(img);
					
					// 유저 텍스트 박스
					const listText = document.createElement("div");
					
					// 받은 유저 이름
					const tdReciveUser = document.createElement("h3");
					tdReciveUser.textContent = list.reciveUser;
					divBox.appendChild(tdReciveUser);
					
					// 쪽지 내용
					const tdContent = document.createElement("h3");
					tdContent.textContent = list.content;
					tdContent.style.fontWeight = "300";
					divBox.appendChild(tdContent);
					
					// 쪽지 보낸 날짜
					const tdDate = document.createElement("p");
					const formattedDate = new Date(list.date).toLocaleDateString('ko-KR', {
			            year: 'numeric',
			            month: '2-digit',
			            day: '2-digit'
			        });
					tdDate.textContent = formattedDate;
					tdDate.style.paddingTop = "5px";
					tdDate.classList.add("dmDate");
					
					listText.appendChild(tdReciveUser);
					listText.appendChild(tdContent);
					listText.appendChild(tdDate);
					
					divBox.appendChild(listImg);
					divBox.appendChild(listText);
					
					dmList.appendChild(divBox);
				});
			}
			
			
	});
	
	
	
	
	
	
	
	
	</script>


</body>
</html>