<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
	<div class="row justify-content-center">
		<div class="col-lg-6 col-12 showbottom showtop">
			<ul class="list-group">
			
			<c:forEach var="specificItem" items="${sessionArray}">
			<c:forEach var="sessiondetail" items="${sessionList}">
			<c:if test="${specificItem==sessiondetail[0]}">
				<li class="list-group-item bg-light mt-3">
				<div class="row">
					<div class="col-9">
					 	<div class="row mb-1">
							<div class="col-lg-5"><c:out value="${sessiondetail[1]}"/></div>
							<div class="col-lg-6"><c:out value="${sessiondetail[2]}"/></div>
						</div>
						<hr class="peerhr">
						<div class="row">
							<div><i class="fa-regular fa-message"></i><c:out value="${sessiondetail[3]}"/></div>
						</div>
					<div class="row">
						<div class="col-lg-5"><span class="small">作成者：</span><c:out value="${sessiondetail[4]}"/></div>
						<div class="col-lg-2 col-5"><i class="fa-solid fa-user"></i><c:out value="${sessiondetail[5]}"/></div>
						<div class="col-lg-2 col-5"><i class="fa-solid fa-car"></i><c:out value="${sessiondetail[6]}"/></div>
					</div>
					</div>
					<div class="col-2">
					<button class="btn btn-primary btn-sm">Join</button>
					</div>
				</div>
				</li>
			</c:if>
			</c:forEach>
			</c:forEach>
			</ul>
		</div>
	</div>
</div>


<jsp:include page="menu.jsp"/>
</body>
</html>