<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sunosuki</title>
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
	<nav class="navbar navbar-expand-lg bg-body-tertiary bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="top.jsp">Sunosuki</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a
						class="nav-link headermenu semi"
						href="SessionListServlet?date=datenull">Look For Sessions</a></li>
					<li class="nav-item"><a class="nav-link headermenu menuhere semi"
						href="PeersServlet">Look For Peers</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row justify-content-center showtop">
			<div class="row col-lg-6">
				<div class="col-lg-5 col-12">
					<a href="SessionListServlet?date=datenull"><i
						class="fa-solid fa-arrow-left"></i>View all Sessions</a>
				</div>
			</div>
		</div>

		<div class="row justify-content-center">
			<div class="col-lg-6 col-12 showbottom">
				<ul class="list-group">

					<%
					int count = 0;
					pageContext.setAttribute("count", count);
					%>

					<c:forEach var="specificItem"
						items="${forSessionModel.spesessionidList}">
						<c:forEach var="sessiondetail"
							items="${sessionListModel.sessiondetailList}">
							<c:if test="${specificItem==sessiondetail[0]}">
								<li class="list-group-item bg-light mt-3 peerslist">
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

										<c:if test="${loginModel.id!= sessiondetail[7]}">
											<%
											boolean ismember = false;
											pageContext.setAttribute("ismember", ismember);
											%>

											<c:forEach var="memberid"
												items="${forSessionModel.spememberList.get(count)}">
												<c:if test="${memberid==loginModel.id}">
													<div class="col-2 center">
														<a href="NotjoinServlet?action=${sessiondetail[0]}"
															class="btn btn-success btn-sm" id="joined">Joined</a>
													</div>
													<%
													ismember = true;
													%>
													<%
													pageContext.setAttribute("ismember", ismember);
													%>
												</c:if>
											</c:forEach>

											<c:if test="${ismember!=true}">
												<div class="col-2 center">
													<a href="JoinServlet?action=${sessiondetail[0]}"
														class="btn btn-primary btn-sm" id="join">Join</a>
												</div>
											</c:if>
										</c:if>
									</div>
								</li>

								<%count=count+1; %>
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