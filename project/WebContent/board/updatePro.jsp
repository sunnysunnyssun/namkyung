<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

String realPath = request.getRealPath("/upload");
// System.out.println(realPath);   // 가상경로
// 업로드할 파일의 크기 제한
int maxSize = 5*1024*1024; // 5mb가로 파일 크기 제한

// MultipartRequest 객체 생성 하면 업로드 완룝
MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());


String id = (String)session.getAttribute("id");

String typeStr = multi.getParameter("type");
if(typeStr==null){typeStr = "1";}
int type = Integer.parseInt(typeStr);
String numStr = multi.getParameter("num");
String pageNum = multi.getParameter("pageNum");



if(numStr==null){
    //  System.out.println(numStr);
    numStr="0";
    response.sendRedirect("list.jsp?type="+type);
}
int num = Integer.parseInt(numStr);



String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
String file = multi.getFilesystemName("file");
String orifile = multi.getParameter("orifile");


PBoardBean bb = new PBoardBean();
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setFile(file);
bb.setType(type);
PBoardDAO bdao = new PBoardDAO();

int check = bdao.numCheck(num, pass);
// 첨부파일이 있으면 새파일 수정 없으면 원이미지이름 수정
if(file!=null){
    bb.setFile(file);
}
else{
    bb.setFile(orifile);
}

//


if(check==0){
%>  
    <script type="text/javascript">         
    alert('비밀번호가 틀렸습니다.');
    alert('다시 입력해주세요.');    
    history.back();
    </script><%     
}
else if (check==-1){
%>  
    <script type="text/javascript">         
    alert('게시글 수정 오류'); 
    history.back();
    </script><%     
}
else if (check==1){
    int result = bdao.updateBoard(bb);
    if(result>=0){
        %>
        <script type="text/javascript">     
            alert('게시글이 수정되었습니다.');
            location.href="content.jsp?num=<%=num%>&pageNum=<%=pageNum%>&type=<%=type%>";
<%--             alert('"content.jsp?num=<%=num%>&pageNum=<%=pageNum%>&type=<%=type%>"'); --%>
        </script>
        <% 
    }else{
        %>
        <script type="text/javascript">     
            alert('게시글 수정 오류 :<%=result %>');
            history.back();
        </script>
        <% 
    }
}


%>



<!--  푸터 -->   
<jsp:include page="../inc/bottom.jsp" />


  </div>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>


</body>

</html>



