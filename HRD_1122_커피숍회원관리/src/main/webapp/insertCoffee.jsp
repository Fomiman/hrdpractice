<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피등록</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<section>
		<h2>커피등록</h2>
		<form action="#" method="post" name="f">
			<table class="ictbl">
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="pcode" value="">4글자내로 입력하세요. ex)A101</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="pname" value=""></td>
				</tr>
				<tr>
					<th>상품단가</th>
					<td><input type="number" name="pcost" value="">가격만 입력하시오. ex)6500</td>
				</tr>
			</table>

			<div class="btndiv" style="text-align: center;">
				<input type="button" value="등록" onclick="insertCoffee();" /> <input
					type="button" value="다시쓰기" onclick="rewrite();">
			</div>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>