<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sunosuki</title>
<script src="https://kit.fontawesome.com/5235b688ad.js" crossorigin="anonymous"></script>      
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="style01.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
	<form action="SessionServlet" method="get">
	<div class="row showtop justify-content-center">
	<div class="col-lg-6 greybox p-4">
		<div class="">
			<label class="form-label">日付</label>
			<input type="date" class="form-control" name="date"></input>
		</div>
		<div class="">
			<label class="form-label">ゲレンデ</label>
			<select name="location" class="form-control">
				<option value="">スキー場を選択してください</option>
				<option value="resort">resort</option>
				<option value="菅平高原スノーリゾート">菅平高原スノーリゾート</option>
				<option value="竜王スキーパーク">竜王スキーパーク</option>
				<option value="戸狩温泉スキー場">戸狩温泉スキー場</option>
				<option value="志賀高原スキー場">志賀高原スキー場</option>
				<option value="白馬八方尾根スキー場">白馬八方尾根スキー場</option>
			</select>
			
		</div>
		<div class="">
			<label class="form-label">メッセージ</label>
			<textarea name="message" class="form-control"></textarea>
		</div>
		
		<div class="">
			<input type="submit" value="作成" class="btn btn-success btn-small"></input>
		</div>
		</div>
	</div>
	</form>
</div>

<jsp:include page="menu.jsp"/>

</body>
</html>