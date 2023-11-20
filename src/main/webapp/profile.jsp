<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <div class="row align-items-center">
      <div class="col-lg-4 mx-auto mb-3 imgcontainer">		
		<img src="uploads/${newprofileModel.img}" class="rounded-circle img-fluid">  
      </div>

      <div class="col-lg-8 profile">
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
            
            
          </div>
        </div>
        </div>
        </div>
        </div>
        
        <div class="editbutton"> 
        <a href="profile_edit.jsp" class="center"><span class="btn btn-success">編集</span></a>
        </div>
        
	
	<jsp:include page="menu.jsp"/>


</body>
</html>