<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Sunosuki</title>
<meta name="keywords" content="スノボ、スノーボード、スキー、ゲレンデ、グラトリ">
<meta name="description" content="スキー、スノーボードの仲間を作るサイトです">
<script src="https://kit.fontawesome.com/5235b688ad.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="style01.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	
	

	<div class="container">
		<div class="pagetitle showtop gapbottom">
			<h3 class="center">Your Schedule</h3>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-6 showbottom">
				<ul class="list-group">
					<c:forEach var="sessiondetail"
						items="${sessionListModel.sessiondetailList}">
						<c:forEach var="yoursession"
							items="${scheduleModel.yoursessionList}">

							<c:if test="${yoursession==sessiondetail[0]}">
								<li class="list-group-item bg-light mt-3">
									<div class="row">
										<div class="col-9">
											<div class="row mb-1">
												<div class="col-lg-5">
													<c:out value="${sessiondetail[1]}" />
												</div>
												<div class="col-lg-6">
													<c:out value="${sessiondetail[2]}" />
												</div>
											</div>
											<div class="row">
												<div class="col-lg-5 semi">
													<span class="small">作成者：</span>
													<c:out value="${sessiondetail[4]}" />
												</div>
												<div class="col-lg-2 col-4 mini">
													<i class="fa-solid fa-user"></i>
													<c:out value="${sessiondetail[5]}" />
												</div>
												<div class="col-lg-2 col-4 mini">
													<i class="fa-solid fa-car"></i>
													<c:out value="${sessiondetail[6]}" />
												</div>
											</div>
										</div>

										<c:choose>
											<c:when test="${sessiondetail[7]==loginModel.id}">
												<div class="col-2 center">
													<a href="EditesessionServlet?action=${sessiondetail[0]}"
														class="mini">edit</a>
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-2 center">
													<a
														href="NotjoinServlet?action=${sessiondetail[0]}&forward=schedule"
														class="mini">cancel</a>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="menu.jsp" />
</body>
</html>