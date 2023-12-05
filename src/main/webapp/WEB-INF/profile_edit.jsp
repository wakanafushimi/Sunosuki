<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sunosuki</title>
<link rel="stylesheet" href="style01.css">
<script src="https://kit.fontawesome.com/5235b688ad.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>

<body>
<jsp:include page="header.jsp"/>
		

<form action="ProfileServlet" method="post" enctype="multipart/form-data">
<div class="container">
	<div class="row">
    	<div class="col-lg-4 mx-auto mb-3">		
    		<div class="card imginput">
    			<div class="card-body">
					プロフィール画像<input type="file" name="img">
				</div>
			</div>
      	</div>

      	<div class="col-lg-8 showtop">
        	<div class="card mb-4">
          		<div class="card-body">
          
            		<div class="row">
              			<div class="col-sm-3">
                			<p class="mb-0">ユーザネーム</p>
              			</div>
              			<div class="col-sm-9">
                			<p class="text-muted mb-0"><input type="text" name="username" placeholder="${newprofileModel.username}" class="form-control"></p>
              			</div>
            		</div><!-- row -->
            		<hr>
            
            		<div class="row">
              			<div class="col-sm-3">
                			<p class="mb-0">都道府県</p>
              			</div>
              			<div class="col-sm-9">
                			<p class="text-muted mb-0">
                				<select name="pref" class="form-select">
					              <option value="">${newprofileModel.pref }</option>
					              <option value="tokyo">tokyo</option>
								  <option value="北海道">北海道</option>
								  <option value="青森県">青森県</option>
								  <option value="岩手県">岩手県</option>
								  <option value="宮城県">宮城県</option>
								  <option value="秋田県">秋田県</option>
								  <option value="山形県">山形県</option>
								  <option value="福島県">福島県</option>
								  <option value="茨城県">茨城県</option>
								  <option value="栃木県">栃木県</option>
								  <option value="群馬県">群馬県</option>
								  <option value="埼玉県">埼玉県</option>
								  <option value="千葉県">千葉県</option>
								  <option value="東京都">東京都</option>
								  <option value="神奈川県">神奈川県</option>
								  <option value="新潟県">新潟県</option>
								  <option value="富山県">富山県</option>
								  <option value="石川県">石川県</option>
								  <option value="福井県">福井県</option>
								  <option value="山梨県">山梨県</option>
								  <option value="長野県">長野県</option>
								  <option value="岐阜県">岐阜県</option>
								  <option value="静岡県">静岡県</option>
								  <option value="愛知県">愛知県</option>
								  <option value="三重県">三重県</option>
								  <option value="滋賀県">滋賀県</option>
								  <option value="京都府">京都府</option>
								  <option value="大阪府">大阪府</option>
								  <option value="兵庫県">兵庫県</option>
								  <option value="奈良県">奈良県</option>
								  <option value="和歌山県">和歌山県</option>
								  <option value="鳥取県">鳥取県</option>
								  <option value="島根県">島根県</option>
								  <option value="岡山県">岡山県</option>
								  <option value="広島県">広島県</option>
								  <option value="山口県">山口県</option>
								  <option value="徳島県">徳島県</option>
								  <option value="香川県">香川県</option>
								  <option value="愛媛県">愛媛県</option>
								  <option value="高知県">高知県</option>
								  <option value="福岡県">福岡県</option>
								  <option value="佐賀県">佐賀県</option>
								  <option value="長崎県">長崎県</option>
								  <option value="熊本県">熊本県</option>
								  <option value="大分県">大分県</option>
								  <option value="宮崎県">宮崎県</option>
								  <option value="鹿児島県">鹿児島県</option>
								  <option value="沖縄県">沖縄県</option>
								</select></p>
              			</div>
            		</div><!-- row -->
            		<hr>
            
            		<div class="row">
              			<div class="col-sm-3">
                			<p class="mb-0">車の有無</p>
              			</div>
              			<div class="col-sm-9">
                			<p class="text-muted mb-0">
                				<input type="radio" name="car" id="yes" value="ari" class="form-check-input">あり<input type="radio" name="car" id="no" value="no" class="form-check-input">なし
                            </p>
              			</div>
            		</div><!-- row -->
            		<hr>
            		
            		<div class="row">
              			<div class="col-sm-3">
                			<p class="mb-0">滑りのスタイル</p>
              			</div>
              			<div class="col-sm-9">
                			<p class="text-muted mb-0">
                				<input type="text" name="style" class="form-control" placeholder="${newprofileModel.style}">
                            </p>
              			</div>
            		</div><!-- row -->
            		<hr>
            		
            		<div class="row">
              			<div class="col-sm-3">
                			<p class="mb-0">ギア</p>
              			</div>
              			<div class="col-sm-9">
                			<p class="text-muted mb-0">
                				<textarea name="geer" class="form-control" placeholder="${newprofileModel.geer}"></textarea>
                            </p>
              			</div>
            		</div><!-- row -->
            		<hr>
            
            		<div class="row">
              			<div class="col-sm-3">
                			<p class="mb-0">メッセージ</p>
              			</div>
              			<div class="col-sm-9">
                			<p class="text-muted mb-0">
                				<textarea name="selfintro" placeholder="${newprofileModel.selfintro }" class="form-control"></textarea>
                			</p>
              			</div>
            		</div><!-- row -->
          		
       			</div><!-- card-body -->
        	</div><!-- card mb-4 -->
        
        </div><!-- col-lg-8 profile -->
        
        <div class="editbutton col-12"> 
        	<input type="submit" class="center showbottom" value="更新">
        </div>
	</div><!-- row -->

</div><!-- container -->
</form>
        
        
        
	<jsp:include page="menu.jsp"/>

</body>
</html>