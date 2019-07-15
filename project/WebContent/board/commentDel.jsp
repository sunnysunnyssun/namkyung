<%@page import="java.sql.Timestamp"%>
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

<script type="text/javascript">

 var delOk = confirm("댓글을 지우시겠습니까?");
 if (delOk==false){
	 history.back();
 }


</script>



<%
request.setCharacterEncoding("utf-8");
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
int num = Integer.parseInt(request.getParameter("num"));
int cnum = Integer.parseInt(request.getParameter("cnum"));

PCommentDAO cdao = new PCommentDAO();
int result = cdao.deleteComment(cnum, num);

if(result==1){
    
    %>
    <script type="text/javascript">     
    alert('댓글 삭제');
    location.href="content.jsp?pageNum=<%=pageNum%>&num=<%=num%>";
    </script>

<%}else{
%>
<script type="text/javascript">  
alert('댓글 삭제 오류 발생');

    history.back();
</script>
    <% 
    }
    %>








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



