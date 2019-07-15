<%@page import="member.PMemberBean"%>
<%@page import="email.MailSend"%>
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

<script type="text/javascript">
<%-- function mail() {
	<%
	PMemberBean mb = new PMemberBean();
	mb.setId("id");
	mb.setName("노현정");
	mb.setEmail("qwerty1475@naver.com");
	MailSend.Send(mb);
	%>
} --%>

</script>
</head>

<body class="text-center bg-light">
  <div class="p-3 h-100 d-flex flex-column">


<!--  네비메뉴 -->
<jsp:include page="../inc/top.jsp" />


<!-- 메인슬라이더 및 점보트론 -->
<div class="position-relative mx-auto col-12">


<!-- id="main_xl"  -->
        <div class="mx-auto position-static d-block" id="po">
        
		<div id="main_xl" class="jumbotron position-absolute bg-transparent text-white justify-content-center d-none d-xl-block" style="z-index:3;">
		    <h1 class="display-4"> Namkyung Concrete</h1>
		    <p class="lead">남경콘크리트 홈페이지입니다.</p>
		    <hr class="my-2 bg-white">
		    <p>This is a Namkyoung Concrete Homepage. </p>
		</div>
	
      <div id="main_lg" class="jumbotron position-absolute bg-transparent text-white justify-content-center d-none d-lg-block d-xl-none" style="z-index:3;">
            <h1 class="display-4"> Namkyung Concrete</h1>
            <p class="lead">남경콘크리트 홈페이지입니다.</p>
            <hr class="my-2 bg-white">
            <p>This is a Namkyoung Concrete Homepage. </p>
        </div>

	
	   </div>
	
		
		<div class="jumbotron text-black bg-transparent justify-content-center d-block d-lg-none">
	        <h1 class="display-4"> Namkyung Concrete</h1>
	        <p class="lead">남경콘크리트 홈페이지입니다.</p>
	        <hr class="my-2 bg-black">
	        <p>This is a Namkyoung Concrete Homepage. </p>
	    </div>
	
		
		
	    <div id="bg position-absolute">
		<div id="mainSlider" class="carousel slide carousel-fade " data-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active" data-interval="100">
		      <img src="../assets/img/main/01.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item" data-interval="100">
		      <img src="../assets/img/main/02.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item" data-interval="100">
		      <img src="../assets/img/main/03.jpg" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#mainSlider" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#mainSlider" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	    </div>
</div>

<!-- 메인슬라이더 및 점보트론 -->

  



<!--  푸터 -->   
<jsp:include page="../inc/bottom.jsp" />


  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>



