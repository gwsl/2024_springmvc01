<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h2>카카오 로그인 성공</h2>
	<div id="result"></div>
	
	<!-- 계정과 함계 로그 아웃 -->
	<a href="https://kauth.kakao.com/oauth/logout?client_id=0f4c18f9b6e3e329653c135cc79a1fad&logout_redirect_uri=http://localhost:8080/kakaologout">로그아웃</a>
	
	<script type="text/javascript">
		// $(document).ready(function() {});
		$(function() {
			$("#result").empty();
			$.ajax({
				url : "/kakaoUserInfo",
				method : "post",
				dataType : "json",
				success : function(data) {
					//let str  = "<li>닉네임 : ${nickname} </li>";
                    //str += "<li>이미지 : <img src= ${profileImage}> </li>";
                    
                    
					const name = data.properties.nickname;
					const img = data.properties.profile_image;
					const email = data.kakao_account.email;
					
					let str = "<li>닉네임 : " + name + " </li>";
					   str += "<li>이메일 : " + email + " </li>";
					   str += "<li>이미지 : <img src="+ img +"> </li>"; 
					$('#result').append(str);

				},
				error : function() {
					alert("읽기실패");
				}
			});
		});
	</script>
	
</body>
</html>