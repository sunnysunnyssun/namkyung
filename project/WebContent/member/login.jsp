<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- PAGE settings -->
  <link rel="icon" href="https://templates.pingendo.com/assets/Pingendo_favicon.ico">
  <title>남경콘크리트</title>

  <!-- CSS dependencies -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="../assets/css/custom.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="../assets/css/signin.css" rel="stylesheet">



 </head>

<body class="text-center bg-light">
<div class="p-3 h-100 d-flex flex-column">


<!--  네비메뉴 -->
<jsp:include page="../inc/top.jsp" />


<!-- main.jsp 메인 이미지, 콘텐츠  -->
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-12 mx-auto">

			<form class="form-signin" action="loginPro.jsp" method="post" name="fr">
			  <div class="text-center mb-4 mt-2">
			    <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
			    <img class="mb-4" src="../assets/img/logo/logo_login.png" alt="" width="100" height="100">
			  </div>
			
			  <div class="form-label-group">
                <label for="loginId" class="sr-only">id</label>
			    <input type="text" name="id" id="loginId" class="form-control" placeholder="아이디" required="" autofocus="">
			  </div>
			
			  <div class="form-label-group">
                <label for="loginPassword" class="sr-only">Password</label>
			    <input type="password" name="pass" id="loginPassword" class="form-control" placeholder="비밀번호" required="">
			  </div>
<!-- 			    <label> -->
<!-- 			      <input type="checkbox" value="remember-me"> Remember me -->
<!-- 			    </label> -->
<!-- 			  </div> -->
		
			  <button class="btn btn-lg btn-primary btn-block mb-3" type="submit">로그인</button>
			    <p>남경콘크리트 회원이 아니십니까? 
			    <a href="join.jsp">회원가입</a></p>
			</form>        
          
          
        </div>

      </div>
    </div>
    
<!-- main.jsp 게시판 및 갤러리 노출 -->





<!--  푸터 -->   
<jsp:include page="../inc/bottom.jsp" />


  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>



