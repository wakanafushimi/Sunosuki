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
		<div class="col-md-6 showbottom showtop">
			<ul class="peerstop list-group gap-3">
			
			<c:forEach var="coach" items="${coaches}">
			<c:forEach var="peer" items="${peers}">
			<c:if test="${coach==peer[0] }">
				<div class="peer bg-light">
				<li class="list-group-item">
					<div class="row">
						<div class="col-5 m-2 ms-3 imgcontainerPeers"><img src="uploads/${peer[1]}"  class="rounded-circle img-fluid"></div>
						<div class="col-4 peername pt-4"><p>${peer[2]}</p></div>
						<div class="col-2 mt-4">
							<i class="fa-regular fa-heart"></i>
							<i class="fa-regular fa-calendar-days calender"></i>
							<i class="fa-regular fa-message"></i>
						</div>
					</div>
					<hr class="peerhr">
					
					<div class="row mb-1">
					
						<div class="col-12 col-md-2 mini">教えられる</div>
						<div class="col-10">
							<c:forEach var="trick_aArray" items="${peersTrick_a}">
								<c:if test="${trick_aArray[0]==peer[0]}">
									<div class="d-inline-block pe-2">
										<c:out value="${trick_aArray[1]}"/>
									</div>
								</c:if>
							</c:forEach>
						</div>
					
					</div>
						
					<hr class="peerhr">
					
					<div class="row mb-1">
						<div class="col-12 col-md-2 mini">練習中</div>
						<div class="col-10">
							<c:forEach var="trick_bArray" items="${peersTrick_b}">
								<c:if test="${trick_bArray[0]==peer[0]}">
									<div class="d-inline-block pe-2">
										<c:out value="${trick_bArray[1]}"/>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					
				</li>
				</div>
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