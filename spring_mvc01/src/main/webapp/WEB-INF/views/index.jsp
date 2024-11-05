<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	<c:if test="${empty loginchk == '1'}">
		alert("로그인 성공");
	</c:if>
</script>
</head>
<body>
	<h1>Non-Annotation</h1>
	<h2><a href="/start1">start1</a></h2>
	<h2><a href="/start2">start2</a></h2>
	<hr>
	
	<h1>Annotation</h1>
	<h2><a href="/start3">start3</a></h2>
	<h2>
		<form method="post" action="/start4">
			<input type="submit" value="전송하기1">
			<button type="submit">전송하기2</button>
		</form>
	</h2>
	<h2><a href="/start5">start5</a></h2>
	<h2><a href="/start6">start6</a></h2>
	<h2><a href="/start7">start7</a></h2>
	<hr>
	
	<h2>서버에게 정보 보내기</h2>
    <form action="/start8" method="post" autocomplete="on">
        <p>
           <label> 이름 : <input type="text" name="username" placeholder="이름 입력" required> </label></p>
        <p>   
            <label> 나이 : <input type="number" name="userage" placeholder="나이 입력" required> </label>
        </p>
        <input type="submit" value="서버에게 보내기">
        <input type="reset" value="취소">
    </form>
    <br>
    <hr>
    <br>
    <form action="/start9" method="post" autocomplete="on">
        <fieldset>
            <legend>계산기</legend>
            <p>    <label> 수1 : <input type="number" name="s1" required> </label></p>
            <p>    <label> 수2 : <input type="number" name="s2" required> </label></p>
            <p>    <label> 연산자 : <input type="radio" name="op" value="+" checked> + </label>
                     <input type="radio" name="op" value="-" ><label>-</label>
                     <input type="radio" name="op" value="*" ><label>*</label>
                     <input type="radio" name="op" value="/" ><label>/</label>
            </p>
            <input type="submit" value="계산하기">
        </fieldset>
    </form>
    <hr>
    <!-- 이미지는 무조건 webapp-resources 안에 넣어주세요 -->
    <h2>이미지 보기</h2>
    <img alt="" src="/resources/images/tree-4.jpg" style="width: 100px;"><br>
    <img alt="" src="resources/images/tree-4.jpg" style="width: 100px;"><br>
    
    <!-- 추천: 어플리케이션 컨택스트 경로가 변경되어도 이미지 경로를 올바르게 참조 -->
    <img alt="" src='<c:url value="/resources/images/tree-4.jpg" />' style="width: 100px;"><br>
    <img alt="" src='<c:url value="resources/images/tree-4.jpg" />' style="width: 100px;"><br>
	<hr>
	
	<!-- cos 라이브러리 등록 : pom.xml -->
	<h2>파일 업로드-1</h2>
	<form action="/f_up1" method="post" enctype="multipart/form-data">
		<p>올린 사람 : <input type="text" name="name"></p>
		<p>파일 : <input type="file" name="f_name"></p>
		<p><input type="submit" name="파일업로드"></p>
	</form>
	
	<!-- commons-fileupload, commons-io 라이브러리 등록 : pom.xml
	     servlet-context.xml 에서 파일업로드용 클래스 등록
	     파일업로드용 클래스 등록 사용하면 cos 라이브러리를 활용한 업/다운로드 불가
	-->
	<h2>파일 업로드-2</h2>
	<form action="/f_up2" method="post" enctype="multipart/form-data">
		<p>올린 사람 : <input type="text" name="name"></p>
		<p>파일 : <input type="file" name="f_name"></p>
		<p><input type="submit" name="파일업로드"></p>
	</form>
	<hr>
	
	<!-- vo를 사용해서 파라미터 -->
	<h2>파일 업로드-3</h2>
	<form action="/f_up3" method="post" enctype="multipart/form-data">
		<p>올린 사람 : <input type="text" name="name"></p>
		<p>파일 : <input type="file" name="f_name"></p>
		<p><input type="submit" name="파일업로드"></p>
	</form>
	<hr>
	
	<h2><a href="/ajax_test_xml">Ajax XML 연습하는 장소로 이동</a></h2>
	<h2><a href="/ajax_test_json">Ajax JSON 연습하는 장소로 이동</a></h2>
	<h2><a href="/ajax_test_DB">Ajax DB 연습하는 장소로 이동</a></h2>
	<h2><a href="/emp">동적 쿼리 연습 장소로 이동</a></h2>
	<h2><a href="/email">이메일 연습 장소로 이동</a></h2>
	<h2><a href="/loginForm">로그인창으로 이동</a></h2>
	
</body>
</html>