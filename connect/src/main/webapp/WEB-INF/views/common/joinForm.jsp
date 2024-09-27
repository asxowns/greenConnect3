<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	min-height: 1000px;
}

main h1 {
	width: 360px;
	margin: 0px auto 25px;
	font-size: 26px;
	font-weight: 400;
}

.join-info1 {
	width: 360px;
	margin: 0 auto;
	border-bottom: 1px solid #eee;
}

.join-info1 ul li input {
	width: 360px;
	height: 40px;
	box-sizing: border-box;
	background: #fcfcfc;
	border: 1px solid #ececec;
	border-radius: 5px;
	padding-left: 10px;
	margin-bottom: 15px;
}

.join-info1 ul li input::placeholder {
	color: #afafaf;
	font-size: 14px;
}

.join-info2 {
	width: 360px;
	margin: 0 auto;
}

.join-info2 input {
	width: 280px;
	height: 40px;
	box-sizing: border-box;
	background: #fcfcfc;
	border: 1px solid #ececec;
	border-radius: 5px;
	padding-left: 10px;
}

.join-info2 input::placeholder {
	color: #afafaf;
	font-size: 14px;
}

.join-info2 .info2-box1 {
	display: flex;
	justify-content: space-between;
	margin-top: 15px;
}

.join-info2 .info2-box1 button {
	width: 70px;
	border: 1px solid #0091DB;
	border-radius: 5px;
	background: #fff;
	color: #0091DB;
	font-size: 14px;
	font-family: "Pretendard Variable", Pretendard;
	cursor: pointer;
}

.join-info2 .info2-box2 {
	display: flex;
	justify-content: space-between;
	margin-top: 15px;
}

.join-info2 .info2-box2 button {
	width: 70px;
	border: 1px solid #ececec;
	border-radius: 5px;
	background: #fcfcfc;
	color: #afafaf;
	font-family: "Pretendard Variable", Pretendard;
}

.buttonActive {
	border: 1px solid #0091DB !important;
	background: #fff !important;
	color: #0091DB !important;
	cursor:pointer;
}

.submit-btn {
	width: 360px;
	margin: 0 auto;
}

.submit-btn input {
	width: 360px;
	height: 40px;
	color: #fff;
	font-size: 14px;
	background: #0091DB;
	border: none;
	border-radius: 5px;
	box-sizing: border-box;
	box-shadow: 0px 4px 12px rgb(0, 145, 219, 0.2);
	font-family: "Pretendard Variable", Pretendard;
	margin: 20px 0 30px;
	cursor: pointer;
}

.gologin {
	width: 1100px;
	text-align: center;
	color: #B8B8B8;
	font-size: 13px;
}

.gologin a {
	color: #0091DB;
	font-weight: bold;
}

#duplicateMsg {
	text-align: left;
	font-size: 14px;
	margin-bottom: 10px;
	display: none;
	padding-left: 5px;
}
</style>
</head>
<body>
	<header>
		<%@include file="../about/header.jsp"%>
	</header>

	<main>
		<h1>회원가입</h1>
		<form>
			<div class="join-info1">
				<ul>
					<li><input type="text" name="username" placeholder="아이디">
						<div id="duplicateMsg"></div></li>
					<li><input type="text" name="password" placeholder="비밀번호"></li>
					<li><input type="text" name="name" placeholder="이름"></li>
					<li><input type="text" name="tel" placeholder="휴대폰번호"></li>
					<li><input type="text" name="birth" placeholder="생년월일"></li>
				</ul>
			</div>
			<div class="join-info2">
				<div class="info2-box1">
					<input type="text" name="email" placeholder="이메일">
					<button>인증 요청</button>
				</div>
				<div class="info2-box2">
					<input type="text" name="email-certi" placeholder="인증번호">
					<button>인증 확인</button>
				</div>
			</div>
			<div class="submit-btn">
				<input type="submit" value="회원 가입">
			</div>
		</form>

		<p class="gologin">
			이미 가입하셧나요? <a href="loginForm">로그인</a>
		</p>
	</main>

	<footer>
		<%@include file="../about/footer.jsp"%>
	</footer>


	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    const verifyRequestBtn = document.querySelector('.info2-box1 button');
	    
	    verifyRequestBtn.addEventListener('click', function(e) {
	        e.preventDefault();
	        const email = document.querySelector('input[name="email"]').value;
	        const username = document.querySelector('input[name="username"]').value;
	        fetch('/sendVerification', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/x-www-form-urlencoded',
	            },
	            body: 'email=' + encodeURIComponent(email) + '&username=' + encodeURIComponent(username)
	        })
	        .then(response => response.text())
	        .then(data => {
	            alert(data);
	            console.log(data);
	        })
	        .catch(error => {
	            console.error('Error:', error);
	            alert('인증 요청 중 오류가 발생했습니다.');
	        });
	    });

	    // 이메일 인증 확인 부분
	    const verifyConfirmBtn = document.querySelector('.info2-box2 button');
	    const emailCertiInput = document.querySelector('input[name="email-certi"]');
	    
	    function updateButtonState(){
		    if(emailCertiInput.value.trim() !== ""){
	    		verifyConfirmBtn.classList.add("buttonActive");
	    	}else{
	    		verifyConfirmBtn.classList.remove("buttonActive");
	    	}
	    }
	    
	    emailCertiInput.addEventListener("input", updateButtonState);
	    
	    
	    verifyConfirmBtn.addEventListener('click', function(e) {
	        e.preventDefault();
	        const email = document.querySelector('input[name="email"]').value;
	        const code = document.querySelector('input[name="email-certi"]').value;
	        
	        fetch('/verifyEmail', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/x-www-form-urlencoded',
	            },
	            body: 'email=' + encodeURIComponent(email) + '&code=' + encodeURIComponent(code)
	        })
	        .then(response => response.text())
	        .then(data => {
	            alert(data);
	            console.log(data);
	        })
	        .catch(error => {
	            console.error('Error:', error);
	            alert('인증 확인 중 오류가 발생했습니다.');
	        });
	    });
	    
	    
	    const usernameInput = document.querySelector('input[name="username"]');
	    let isDuplicate = false;
	    
	    usernameInput.addEventListener("input", ()=>{
	    	const inputUsername = usernameInput.value.trim();
	    	
	    	fetch("/getUsername")
	    	.then((response)=>response.json())
	    	.then((data)=>{
	    		isDuplicate = data.some(item => item.username == inputUsername);
	    		const msg = document.getElementById("duplicateMsg");
	    		console.log(data);
	    		
	    		if(isDuplicate){
	    			msg.style.display = "block";
	    			msg.innerHTML = "중복된 아이디 입니다.";
	    			msg.style.color = "red";
	    		}else{
	    			msg.style.display = "block";
	    			msg.innerHTML = "사용 가능한 아이디 입니다."
	    			msg.style.color = "blue";
	    		}
	    	})
	    });

	    // 회원가입 폼 제출 처리
	    const form = document.querySelector('form');
	    form.addEventListener('submit', function(e) {
	        e.preventDefault();
	        const formData = new FormData(form);
	        fetch('/join', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json',
	            },
	            body: JSON.stringify(Object.fromEntries(formData))
	        })
	        .then(response => response.text())
	        .then(data => {
	            alert(data);
	            console.log(data);
	            if (data === '회원가입이 완료되었습니다.') {
	                window.location.href = '/loginForm';
	            }
	        })
	        .catch(error => {
	            console.error('Error:', error);
	            alert('회원가입 중 오류가 발생했습니다.');
	        });
	    });
	});
</script>

</body>
</html>