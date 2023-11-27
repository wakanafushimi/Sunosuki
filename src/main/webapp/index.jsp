<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Sunosuki</title>
        <meta name="keywords" content="スノボ、スノーボード、スキー、ゲレンデ、グラトリ">
        <meta name="description" content="スキー、スノーボードの仲間を作るサイトです">
        <script src="https://kit.fontawesome.com/5235b688ad.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    	<link rel="stylesheet" href="style01.css">
    </head>

    <body>
        <nav class="navbar bg-body-tertiary bg-light fixed-top">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1">Sunosuki</span>
  </div>
</nav>
        
        <div class="container">
        <div class="row">
      
            <form action="LoginServlet" method="post" class="col-8 col-lg-4 mx-auto p-4 index_buttons loginform">
         
                <div class="buttons_item">
                        <label class="form-label">ID</label>
                        <input type="text" name="id" class="form-control">
                    
                </div> 

                <div class="buttons_item">
                        <label class="form-label">PASSWORD</label>
                        <input type="password" name="password" class="form-control">
                     
                </div>

				<div class="d-flex mt-3">
                    <div class="register_item">
                        <button type="submit" class="btn btn-success">Log In</button>
                    </div>
                    <div class="register_item ms-3 mt-2">
                        <a href="signin.jsp">Sign In</a>
                    </div>
                </div>
                
            </form>
            
         
        </div>
        </div>
		
		<jsp:include page="footer.jsp"/>
	
        
    </body>
</html>