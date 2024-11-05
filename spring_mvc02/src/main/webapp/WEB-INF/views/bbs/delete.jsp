<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
</style>
</head>
<body>
	<div id="bbs">
	<form method="post">
		<table summary="게시판 삭제">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th style="width: 40%">비밀번호확인 : </th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="삭제" onclick="bbs_delete_ok(this.form)">
						<input type="button" value="목록" onclick="bbs_list(this.form)">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<script type="text/javascript">
		function bbs_delete_ok(f) {
			f.action="/bbs_delete_ok";
			f.submit();	
		}
		
		function bbs_list(f) {
			f.action="/bbs";
			f.submit();
		}
	
	</script>
</body>
</html>

