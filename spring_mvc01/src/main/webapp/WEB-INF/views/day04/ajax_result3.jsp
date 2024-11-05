<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	span {width: 150px; color: red;}
	input{border: 1px solid red;}
	table{width: 80%; margin: 0 auto;}
	table, th, td{ border: 1px solid lightgray; text-align: center;}
	h2{text-align: center;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h2>Ajax를 활용한 DB처리</h2>
	<h2>회원 정보 입력하기</h2>
	<form  method="post" id="myForm">
		<table>
			<thead>
				<tr><th>아이디</th><th>패스워드</th><th>이름</th><th>나이</th></tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="text" size="14" name="m_id" id="m_id"><br><span>중복여부</span>
					</td>
					<td><input type="password" size="10" name="m_pw"></td>
					<td><input type="text" size="14" name="m_name"></td>
					<td><input type="number" size="14" name="m_age"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center"><input type="button" value="가입하기" id="btn_join" disabled></td>
				</tr>
			</tfoot>
		</table>
	</form>
	<br><br><br><br>
	<h2>회원 정보 보기</h2>
	<div>
		<table id="list">
			<thead>
				<tr><th>번호</th><th>아이디</th><th>패스워드</th><th>이름</th><th>나이</th><th>가입일</th><th>삭제</th></tr>
			</thead>
			<tbody id="tbody"></tbody>
		</table>
	</div>
	
	<script type="text/javascript">
		// ajax를 이용해서 DB정보 가져오기 (처음 접속, 삭제, 삽입)
		function getList() {
			$.ajax({
				url : "/ajax_db_list",
				method : "post",
				dataType : "xml",
				success : function(data) {
					// console.log(data);
					let tbody = "";
					
					// $.each($(data).find("member"),function(index, obj) {
					$(data).find("member").each(function() {
						tbody +="<tr>";
						tbody +="<td>"+ $(this).find("m_idx").text() +"</td>";
						tbody +="<td>"+ $(this).find("m_id").text() +"</td>";
						tbody +="<td>"+ $(this).find("m_pw").text() +"</td>";
						tbody +="<td>"+ $(this).find("m_name").text() +"</td>";
						tbody +="<td>"+ $(this).find("m_age").text() +"</td>";
						tbody +="<td>"+ $(this).find("m_reg").text() +"</td>";
						tbody +="<td><input type='button' value='삭제' id='member_del' name='"+  $(this).find("m_idx").text() +"'></td>";
						tbody +="</tr>";
					});
					$("#tbody").append(tbody);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		}
		
		function getList2() {
			$.ajax({
				url : "/ajax_db_list2",
				method : "post",
				dataType : "json",
				success : function(data) {
				 // console.log(data);
					let tbody = "";
					$.each(data, function(index, obj) {
						tbody +="<tr>";
						tbody +="<td>"+ obj.m_idx +"</td>";
						tbody +="<td>"+ obj.m_id +"</td>";
						tbody +="<td>"+ obj.m_pw +"</td>";
						tbody +="<td>"+ obj.m_name +"님 </td>";
						tbody +="<td>"+ obj.m_age +"살 </td>";
						tbody +="<td>"+ obj.m_reg +"</td>";
						tbody +="<td>삭제</td>";
						tbody +="</tr>";
					});
					$("#tbody").append(tbody);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		}
		
		function getList3() {
			$.ajax({
				url : "/ajax_db_list3",
				method : "post",
				dataType : "text",
				success : function(data) {
				 // console.log(data);
				 	let rows = data.split("\n");
				 	let tbody = "";
				 	
				 	$.each(rows, function(index, row) {
						// 헤더가 있으면 제외
						if(index == 0 || row.trim() === ""){
							return true;
						}
						
						let cols = row.split(",");
						
						tbody += "<tr>";
						$.each(cols, function(i, col) {
							tbody += "<td>" + col + "</td>";
						});
						tbody +="<td>삭제</td>";
						tbody += "<tr>";
					});
					
					$("#tbody").append(tbody);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		}
		let isInputChk = false;
		
		function toggleJoinButton() {
			const passwordFiled = $("#m_pw").val() !== "";
			const nameFiled = $("#m_name").val() !== "";
			const ageFiled = $("#m_age").val() !== ""; && parseInt($("#m_age").val()) > 0;
			if(isInputChk && passwordFiled && nameFiled && ageFiled){
				$("#btn_join").prop("disabled", false);
			}else{
				$("#btn_join").prop("disabled", true);
			}
		}
		
		$("#m_id").keyup(function() {
			$.ajax({
				url : "/ajax_id_chk",
				data : "m_id=" + $("#m_id").val(), // 파라미터(한개일때 사용)
				method : "post",
				dataType : "text",
				success : function(data) {
					if(data == '1'){
						// 사용 불가
						$("span").text("사용불가");
						isInputChk = false;
						
					}else if(data == '0'){
						// 사용가능
						$("span").text("사용가능");
						isInputChk = true;
					}
					toggleJoinButton();
				},
				error : function() {
					alert("읽기실패");
				}
			});
		});
		$("#m_pw, #m_name").keyup(toggleJoinButton);
		$("#m_age").on('change keyup', toggleJoinButton);
		
		// 파라미터가 여러개일때
		$("#btn_join").click(function() {
			
		});
		
		// 동적바인딩 변수 (click 안됨, on)
		$("#list").on("click", "#member_del", function() {
			let m_id = $(this).attr("name");
			//alert(m_id);
			
		});
		
		getList();
	</script>
</body>
</html>