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
<script src="script.js"></script>
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
		<div class="col-lg-6 showbottom">
			<ul class="peerstop list-group">
			
			<c:forEach var="peer" items="${peers}">
				<li class="list-group-item peer bg-light mt-3 row">
				<div class="row justify-content-center openmodal"><!-- card本体 -->
					<div class="col-5 col-lg-3"><!-- 左エリア -->
						<div class="m-2 imgcontainerPeers">
							<img src="uploads/${peer[1]}"  class="rounded-circle img-fluid">
						</div>
						<div class="peersicon ps-2">
							<i class="fa-regular fa-heart"></i>
							<i class="fa-regular fa-calendar-days calender"></i>
							<i class="fa-regular fa-message"></i>
						</div>
					</div><!-- 左エリア -->
					
					<div class="col-6 col-lg-8"><!-- 右エリア -->
						<div class="col-lg-6 col-8 peername mb-1">${peer[2]}</div><!-- 名前 -->
						
						<hr class="peerhr">
					
						<c:forEach var="id" items="${existinguser}"><!--教えられる技 -->
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
						
						<div class="row mb-1"><!-- 練習中技 -->
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
						</div><!-- 練習中技 -->
					</div><!-- 右エリア -->
				</div><!-- card本体 -->
				</li>
			</c:forEach>
			</ul>
		</div><!-- col-lg-6 -->
	</div><!-- row -->
</div>

<!-------------------- modal -------------------->
				<div class="row">
				<div class="popup">
					<div class="modal-content">
						<div class="row justify-content-center">
    	
							<div class="showtop col-lg-3 mb-3">	
								<div class="p-3 bg-light imgcontainer">	
									<img src="uploads/${peer[1]}" class="img-fluid">
								</div>
							</div>
							
							<div class="col-lg-6 profiletop">
								<div class="card mb-4">
									<div class="card-body">
										<div class="row mt-2">
											<div class="col-4">
												<p class="mini">ユーザネーム</p>
											</div>
											<div class="col-8">
												<p class="text-muted">${peer[2]}</p>
											</div>
										</div>
										<hr class="peerhr">
										
										<div class="row mt-2">
											<div class="col-4">
												<p class="mini">都道府県</p>
											</div>
											<div class="col-8">
												<p class="text-muted">${peer[3]}</p>
											</div>
										</div>
										<hr class="peerhr">
										
										<div class="row mt-2">
											<div class="col-4">
												<p class="mini">車の有無</p>
											</div>
											<div class="col-8">
												<p class="text-muted">${peer[4]}</p>
											</div>
										</div>
										<hr class="peerhr">
										
										<div class="row mt-2">
											<div class="col-4">
												<p class="mini">滑りのスタイル</p>
											</div>
											<div class="col-8">
												<p class="text-muted">${peer[5]}</p>
											</div>
										</div>
										<hr class="peerhr">
										
										<div class="row mt-2">
											<div class="col-4">
												<p class="mini">ギア</p>
											</div>
											<div class="col-8">
												<p class="text-muted">${peer[6]}</p>
											</div>
										</div>
										<hr class="peerhr">
										
										<div class="row mt-2">
											<div class="col-4">
												<p class="mini">メッセージ</p>
											</div>
											<div class="col-8">
												<p class="text-muted">${peer[7]}</p>
											</div>
										</div>
										<hr class="peerhr">
										
										<div>
											<a href="profile_edit.jsp" class="center"><span class="btn btn-success btn-sm mt-2">編集</span></a>
										</div>
									</div>
								</div>
								
								<div class="card showbottom">
									<div class="card-body">
										<div class="row">
											<div class="col-lg-4">
												<p class="mt-1 mb-2 mini">教えられるトリック</p>
											</div>
											
											<div class="col-lg-8">
												<div class="text-muted mt-1 mb-2">
													<c:forEach var="i" items="${trickModel.getTrick_aList()}">
														<div class="d-inline-block mb-1">
															<c:out value="${i}"/>
															<a href="TrickServlet?deleteValuea=${i}" class="minus ms-1"><i class="fa-solid fa-minus"></i></a>
														</div>
													</c:forEach>
													
													<div class="d-inline-block mb-0">
														<form action="TrickServlet" method="get">
															<div class="d-flex">
																<input type="text" name="trick_a" placeholder="" class="mb-2" size="10">
																<button type="submit" class="plus ms-1"> <i class="fa-solid fa-plus"></i></button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div><!-- row -->
										<hr class="peerhr">
										
										<div class="row">
											<div class="col-lg-4">
												<p class="mt-1 mb-2 mini">練習中トリック</p>
											</div>
											<div class="col-lg-8">
												<div class="text-muted mt-1 mb-2">
													<c:forEach var="i" items="${trickModel.getTrick_bList()}">
														<div class="d-inline-block mb-1">
															<c:out value="${i}"/>
															<a href="TrickServlet?deleteValueb=${i}" class="minus ms-1"><i class="fa-solid fa-minus"></i></a>
														</div>
													</c:forEach>
													
													<div class="d-inline-block mb-0">
														<form action="TrickServlet" method="get">
															<div class="d-flex">
																<input type="text" name="trick_b" placeholder="" class="mb-2" size="10">
																<button type="submit" class="plus ms-1"><i class="fa-solid fa-plus"></i></button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div><!-- row -->
									</div><!-- card-body -->
								</div><!-- card -->
							</div><!-- col-lg-6 -->
						</div><!-- row -->
					</div><!-- modal-content -->
				</div><!-- popup -->
				</div>
				
<jsp:include page="menu.jsp"/>

</body>
</html>