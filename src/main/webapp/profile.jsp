<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="style01.css">
<title>Sunosuki</title>
<script src="https://kit.fontawesome.com/5235b688ad.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
		
<div class="container">

    <div class="row">
      <div class="col-lg-4 mx-auto mb-3 imgcontainer">		
		<img src="uploads/${newprofileModel.img}" class="rounded-circle img-fluid">  
      </div>

      <div class="col-lg-8 showtop">
        <div class="card mb-4">
          <div class="card-body">
          
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">ユーザネーム</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${newprofileModel.username }</p>
              </div>
            </div>
            <hr>
            
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">都道府県</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${newprofileModel.pref }</p>
              </div>
            </div>
            <hr>
            
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">車の有無</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${newprofileModel.car}</p>
              </div>
            </div>
            <hr>
            
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">メッセージ</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${newprofileModel.selfintro}</p>
              </div>
            </div>
            <hr>
            
            <div> 
        		<a href="profile_edit.jsp" class="center"><span class="btn btn-success">編集</span></a>
       		</div>
          </div>
        </div>
            
        <div class="card trick-card">
        <div class="card-body">
            <div class="row">
            
               <div class="col-sm-3">
               	<p class="mb-0">マスター済みトリック</p>
               </div>
              	<div class="col-sm-9">
              		<div class="text-muted mb-1">
                		<c:forEach var="i" items="${trickModel.getTrick_aList()}">
                			<div class="d-inline-block mb-1">
                				 <c:out value="${i}"/>
                				 <a href="TrickServlet?deleteValuea=${i}" class="minus"><i class="fa-solid fa-minus"></i></a>
                			</div>
                		</c:forEach>
                				
                		<div class="d-inline-block mb-0">
                			<form action="TrickServlet" method="get">
                				<div class="d-flex">
                					<input type="text" name="trick_a" placeholder="" class="" size="10">
                					<button type="submit" class="plus"> <i class="fa-solid fa-plus"></i></button>
                				</div>
                			</form>
                		</div>
                				
					</div>
              	</div>
            </div><!-- row -->
            <hr>
            		
            <div class="row">
              	<div class="col-sm-3">
                	<p class="mb-0">練習中トリック</p>
              	</div>
              	<div class="col-sm-9">
                	<div class="text-muted mb-0">
	                	<c:forEach var="i" items="${trickModel.getTrick_bList()}">
		            		<div class="d-inline-block mb-1">
		            		 	<c:out value="${i}"/>
		            		 	<a href="TrickServlet?deleteValueb=${i}" class="minus"><i class="fa-solid fa-minus"></i></a>
	                	 	</div>
	                	</c:forEach>
	                			
	                	<div class="d-inline-block mb-0">
	                		<form action="TrickServlet" method="get">
	                			<div class="d-flex">
	                				<input type="text" name="trick_b" placeholder="" class="" size="10">
	                				<button type="submit" class="plus"><i class="fa-solid fa-plus"></i></button>
	                			</div>
	                		</form>
	                	</div>														
                	</div>
            	</div>
        	</div><!-- row -->
            		
            
            
    </div>
 </div>
</div>
</div>
</div>
        
        
        
	
	<jsp:include page="menu.jsp"/>


</body>
</html>