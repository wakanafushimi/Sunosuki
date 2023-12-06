<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Sunosuki</title>
<script src="https://kit.fontawesome.com/5235b688ad.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="style01.css">
</head>
<body>
<jsp:include page="header.jsp"/>
		
<div class="container">
<div class="pagetitle">
<h3 class="center">Your Profile</h3>
</div>

    <div class="row justify-content-center">
    	
	      <div class="showtop col-lg-3 mb-3">	
		      <div class="p-3 bg-light imgcontainer">	
				<img src="uploads/${newprofileModel.img}" class="img-fluid">
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
                <p class="text-muted">${newprofileModel.username }</p>
              </div>
            </div>
            <hr class="peerhr">
            
            <div class="row mt-2">
              <div class="col-4">
                <p class="mini">都道府県</p>
              </div>
              <div class="col-8">
                <p class="text-muted">${newprofileModel.pref }</p>
              </div>
            </div>
            <hr class="peerhr">
            
            <div class="row mt-2">
              <div class="col-4">
                <p class="mini">車の有無</p>
              </div>
              <div class="col-8">
                <p class="text-muted">${newprofileModel.car}</p>
              </div>
            </div>
            <hr class="peerhr">
            
            <div class="row mt-2">
              <div class="col-4">
                <p class="mini">滑りのスタイル</p>
              </div>
              <div class="col-8">
                <p class="text-muted">${newprofileModel.style}</p>
              </div>
            </div>
            <hr class="peerhr">
            
            <div class="row mt-2">
              <div class="col-4">
                <p class="mini">ギア</p>
              </div>
              <div class="col-8">
                <p class="text-muted">${newprofileModel.geer}</p>
              </div>
            </div>
            <hr class="peerhr">
            
            <div class="row mt-2">
              <div class="col-4">
                <p class="mini">メッセージ</p>
              </div>
              <div class="col-8">
                <p class="text-muted">${newprofileModel.selfintro}</p>
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
            		
            
            
    </div>
 </div>
</div>
</div>
</div>
        
        
        
	
	<jsp:include page="menu.jsp"/>


</body>
</html>