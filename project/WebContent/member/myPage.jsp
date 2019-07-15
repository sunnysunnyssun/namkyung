<%@page import="member.PMemberBean"%>
<%@page import="member.PMemberDAO"%>
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

 </head>
 

<body class="text-center bg-light">
<div class="p-3 h-100 d-flex flex-column">
<%
request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");
String pass = (String)session.getAttribute("pass");


PMemberDAO mdao = new PMemberDAO();
PMemberBean mb = mdao.select(id);

if(id==null){
    %> 
    <script type="text/javascript">         
    alert('회원 정보가 없습니다.');
    location.href='../main/main.jsp';
    </script>   
    <% 
}
/* 
Integer postCode = mb.getPostCode();    
// 데이터베이스에서는 postCode값이 필수입력 값이 아니라 null값이 있는데
// postCode가 인트형이라 null값인식이 되지 않음.
// Interger 형으로 인트값을 받으면 null처리가 가능하다.  
// 안됨... -_-;; 
*/
// 그냥 postCode르르 스트링형으로 바꾸껫다...






%>

<!--  네비메뉴 -->
<jsp:include page="../inc/top.jsp" />


<!-- main.jsp 메인 이미지, 콘텐츠  -->
    <div class="container">
    
      <div class="text-center mt-5">
        <h1 class="h3 mb-3 font-weight-normal">회원 정보  수정</h1>
        <img src="../assets/img/logo/logo.png" alt="" width="120" height="120">
      </div>
    
            <hr class="mb-5">


      <div class="col-md-8 mx-auto text-left">
          <form class="needs-validation form-horizontal" novalidate="" name="fr" action="myPagePro.jsp" method="post">
             <div class="form-group row">
               <div class="col-md-2 d-none d-md-block">
                   <label for="joinId">아이디</label>
               </div>
               <div class="col-md-6 mb-2 mb-md-0">
                  <input type="text" name="id" class="form-control" id="joinId"  value="<%=id %>" disabled  maxlength="7" >
                  
               </div>
            
             </div>

             <div class="form-group row">
               <div class="col-md-2 d-none d-md-block">
                   <label for="joinPassword">비밀번호</label>
                </div>
                <div class="col-md-10">
                    <input type="password" name="pass" class="form-control" id="joinPassword" placeholder="비밀번호 " value="" maxlength="7" required>
                    <div class="invalid-feedback"> 비밀번호는 필수 입력 사항입니다. </div>
                </div>
             </div>
<!--                 
             <div class="form-group row">
               <div class="col-md-2 d-none d-md-block">
                </div>
                <div class="col-md-10">
                    <input type="text" name="pass2" class="form-control" id="joinPassword2" placeholder="비밀번호확인" value="" maxlength="7" required>
                    <div class="invalid-feedback"> 비밀번호를 확인해주세요 </div>
                </div>
             </div>
             -->
            
             <div class="form-group row">
               <div class="col-md-2 d-none d-md-block">
                   <label for="joinName">이름</label>
                </div>
                <div class="col-md-10">
                    <input type="text" name="name" class="form-control" id="joinName" value="<%=mb.getName() %>" disabled>
                </div>
             </div>
   
   
             <div class="form-group row">
               <div class="col-md-2 d-none d-md-block">
                   <label for="joinEmail">이메일</label>
                </div>
                <div class="col-md-10">
                    <input type="email" name="email" class="form-control" id="joinEmail" value="<%=mb.getEmail() %>" maxlength="40" required>
                    <div class="invalid-feedback"> 이메일은 필수 입력 사항입니다. </div>
                </div>
             </div>
   
            <hr class="my-4">
            
             <div class="form-group row">
               <div class="col-md-2 d-none d-md-block">
                   <label for="postCode">우편번호</label>
               </div>
               <div class="col-md-6 mb-2 mb-md-0">
                  <input type="text" name="postCode" class="form-control" id="postCode" placeholder="우편번호" 
                  <% if(mb.getPostCode()==null){}else{%>value="<%=mb.getPostCode()%>"<% }%> maxlength="6" >
                  
               </div>
               <div class="col-md-4">
               <input type="button" class="form-control btn btn-outline-primary" id="joinIdCheck" value="주소검색" onClick="post()">
               </div>             
             </div>
   
   
             <div class="form-group row">
               <div class="col-md-2 d-none d-md-block">
                   <label for="roadAddress">주소</label>
                </div>
                <div class="col-md-10">
                    <input type="text" name="roadAddress" class="form-control" id="roadAddress" placeholder="도로명주소" 
                     <% if(mb.getRoadAddr()==null){}else{%>value="<%=mb.getRoadAddr()%>"<% }%>>
                </div>
             </div>
   
             <div class="form-group row">
               <div class="col-md-2 d-none d-md-block">
                   <label for="detailAddress">상세주소</label>
                </div>
                <div class="col-md-10">
                    <input type="text" name="detailAddress" class="form-control" id="detailAddress" placeholder="상세주소"
                     <% if(mb.getDetailAddr()==null){}else{%>value="<%=mb.getDetailAddr()%>"<% }%>>

                </div>
             </div>
     
     
             <div class="form-group row">
             
               <div class="col-md-2 d-none d-md-block">
                   <label for="joinMobile">휴대폰</label>
                </div>
                <div class="col-md-10">
                    <input type="text" name="mobile" class="form-control" id="joinMobile" placeholder="휴대폰 ***-****-****" 
                    <% if(mb.getMobile()==null){}else{%>value="<%=mb.getMobile()%>"<% }%>>

                </div>
             </div>
   
   
            <hr class="my-4">
            
             <div class="form-group row">
             
              <div class="col-md-2 d-none d-md-block">
                   <label for="delMember">회원탈퇴</label>
                </div>
             
               <div class="col-md-3">
               <input type="button" class="form-control btn btn-outline-secondary" id="delMember" value="탈퇴하기" onClick="location.href='delMember.jsp'">
               </div>             
             </div>
            
            
            
            <hr class="my-4">
            
            
            <div class="from-group row">
                <div class="col-md mb-2 mb-md-0">
                    <input class="btn btn-primary btn-lg btn-block" type="submit" value="수정하기">
                </div>
                <div class="col-md">
                    <input class="btn btn-outline-secondary btn-lg btn-block" type="reset" value="취소">
                </div>
            </div>
        

        
  
      </form>
          
  
    </div>
    
<!-- main.jsp 게시판 및 갤러리 노출 -->


</div>



<!--  푸터 -->   
<jsp:include page="../inc/bottom.jsp" />


  </div>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
  <script src="../assets/js/form-validation.js"></script>


</body>

</html>



