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
<nav class="navbar navbar-expand-lg bg-body-tertiary bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="top.jsp">Sunosuki</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link headermenu"  href="SessionListServlet">Look For Sessions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link headermenu text-black-50" href="PeersServlet">Look For Peers</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
	<form action="ForSessionServlet" method="get">
		<div class="row justify-content-center showtop">
		<div class="row col-lg-6">
			<div class="col-lg-5 col-12">
				<p>Search by date?</p>
			</div>
			<div class="col-lg-5 col-9">
				<input type="date" name="date" class="form-control inline-block">
			</div>
			<div class="col-1">
				<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
		</div>
		</div>
	</form>
		
	<div class="row justify-content-center">
		<div class="col-lg-6 col-12 showbottom">
			<ul class="list-group">
			
			<c:forEach var="sessiondetail" items="${sessionList}">
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
			</c:forEach>
		</ul>
	</div>
	
</div>


<jsp:include page="menu.jsp"/>
</body>
</html>