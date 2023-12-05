<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sunosuki</title>
<script src="https://kit.fontawesome.com/5235b688ad.js" crossorigin="anonymous"></script>      
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="style01.css">
</head>

<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="top.jsp">Sunosuki</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link headermenu text-black-50"  href="SessionListServlet">Look For Sessions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link headermenu" href="PeersServlet">Look For Peers</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

		
<div class="container">
	<form action="ForCoachServlet" method="get">
		<div class="row justify-content-center showtop">
		<div class="row col-lg-6">
			<div class="col-lg-5 col-12">
				Look for a coach?
			</div>
			<div class="col-lg-5 col-9">
				<input type="text" name="trick" class="form-control inline-block">
			</div>
			<div class="col-1">
				<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
		</div>
		</div>
	</form>
		
	<div class="row justify-content-center">
		<div class="col-lg-6 showbottom"><!-- card本体 -->
			<ul class="peerstop list-group">
			
			<c:forEach var="peer" items="${peers}">
				<li class="list-group-item peer bg-light mt-3">
				<div class="row justify-content-center">
					<div class="col-5 col-lg-3">
						<div class="m-2 imgcontainerPeers">
							<img src="uploads/${peer[1]}"  class="rounded-circle img-fluid">
						</div>
						<div class="peersicon ps-2">
							<i class="fa-regular fa-heart"></i>
							<i class="fa-regular fa-calendar-days calender"></i>
							<i class="fa-regular fa-message"></i>
						</div>
					</div>
					
					<div class="col-6 col-lg-8">
						<div class="col-lg-6 col-8 peername mb-1">${peer[2]}</div>
						
						<hr class="peerhr">
					
						<c:forEach var="id" items="${existinguser}">
						<c:if test="${peer[0]==id}">
						<div class="row mb-1">
							<div class="col-lg-4 col-12 mini">教えられる</div>
							<div class="col-lg-8">
								<c:forEach var="trick_aArray" items="${peersTrick_a}">
									<c:if test="${trick_aArray[0]==peer[0]}">
										<div class="d-inline-block pe-2 semi">
											<c:out value="${trick_aArray[1]}"/>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						</c:if>
						</c:forEach>
					
					
					
						<hr class="peerhr">
						
						<div class="row mb-1">
							<div class="col-lg-4 col-12 mini">練習中</div>
							<div class="col-lg-8">
								<c:forEach var="trick_bArray" items="${peersTrick_b}">
									<c:if test="${trick_bArray[0]==peer[0]}">
										<div class="d-inline-block pe-2 semi">
											<c:out value="${trick_bArray[1]}"/>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				</li>
				
			</c:forEach>
			
			</ul>
		</div><!-- col-md-6 -->
	</div><!-- row -->
	
</div>
<jsp:include page="menu.jsp"/>

</body>
</html>