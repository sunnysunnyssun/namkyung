<%@page import="java.util.ArrayList"%>
<%@page import="comment.PCommentDTO"%>
<%@page import="comment.PCommentDAO"%>
<%@page import="board.PBoardBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.PBoardDAO"%>
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

<!--  네비메뉴 -->
<jsp:include page="../inc/top.jsp" />

<%

String numStr = request.getParameter("num");
String pageNum = request.getParameter("pageNum");
int num = Integer.parseInt(numStr);

String typeStr = request.getParameter("type");
if(typeStr==null){typeStr = "1";}
int type = Integer.parseInt(typeStr);

PBoardDAO bdao = new PBoardDAO();
PBoardBean bb = new PBoardBean();

bb = bdao.getBoard(num);

if(numStr==null){
    response.sendRedirect("list.jsp?type="+type);
}

String id = (String)session.getAttribute("id");
if (id != null){
    if(!id.equals(bb.getName())){
    %>
    <script type="text/javascript">     
        alert('게시글 삭제 권한이 없습니다.');
        location.href='content.jsp?num=<%=num%>&pageNum=<%=pageNum%>&type=<%=type%>';
    </script>
    <% 
    }
}

String content=bb.getContent();

%>


<!-- 상단  -->
    <div class="container">
    
      <div class="my-5">
        <h1 class="h3 font-weight-normal">글삭제</h1>
<!--         <img src="../assets/img/logo/logo.png" alt="" width="120" height="120">
 -->      </div>
    
<!--       <hr class="mb-5"> -->



<!-- 게시판 시작  -->
      <div id="content" class="col-lg-8 table-responsive-sm mx-auto form-group">

        <!--  게시판 리스트 -->
<form action="deletePro.jsp?pageNum=<%=pageNum %>" method="post" name="">
    <%
    // 파일타입이 1이나 2이면 multi 타입으로
    
    %><input type="hidden" name="num" value="<%=num %>">
    
	       <input type="hidden" name="id" value="<%=id%>">
	       <input type="hidden" name="type" value="<%=type %>">
		<table class="table text-center">
	      <colgroup>
	           <col width="10%">
               <col width="40%">
               <col width="10%">
               <col width="40%">
	      </colgroup>
				<tr>
				<th class="">ID</th><td class=""><input type="text" name="name" value="<%=id %>" class="form-control" disabled></td>
				<th class="">PW</th><td class=""><input type="password" name="pass" class="form-control" placeholder="비밀번호를 입력해주세요"></td>
				</tr>
                <tr><th class="">제목</th><td colspan="3"><%=bb.getSubject() %></td></tr>
<!--                 <tr><th colspan="4" class="">글내용</th></tr> -->
<%--                 <tr><td colspan="4" class=""><%=content %></td></tr>   --%>
		  <!-- 파일 유무에 따라   -->
                    <%
				    // 파일타입이 1이나 2이면 multi 인풋 파일
				    // 인풋 파일 파일명 1이면 모든파일 2이면 그림파일만
				    
				    %>

        </table>


        <!-- 목록 버튼 시작 -->
      <hr class="mb-3">

         <div class="float-left ml-3"> 
                <input type="button" value="목록" class="btn btn-outline-primary btn-sm" 
                onclick="location.href='list.jsp?&pageNum=<%=pageNum %>'">
        </div>
        
        <div class="float-right mr-3"> 
        <input type="submit" value="삭제" class="btn btn-primary btn-sm">
        </div>
        
        </form>
        <!-- 목록 버튼 끝 -->
        
        
  
        
        
        
        
        
        
        
      </div> <!--  테이블 감싸는 div? -->

	
<!-- 게시판 끝  -->









	  </div>
<!--  본문 끝 -->


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



