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

//num , pageNum 가져오기 ,//boardDAO 조회수 증가//updateReadcount(num);
//BoardBean bb = getBoard(num); 메서드 호출 
String id = (String)session.getAttribute("id");

String typeStr = request.getParameter("type");
// System.out.println(typeStr);
if(typeStr==null || typeStr.length()==0 ){typeStr = "1";}
int type = Integer.parseInt(typeStr);

// System.out.println(type);


String numStr = request.getParameter("num");
String pageNum = request.getParameter("pageNum");


if(numStr==null){
// 	System.out.println(numStr);
    numStr="0";
 response.sendRedirect("list.jsp?type="+type);
}

int num = Integer.parseInt(numStr);

PBoardDAO bdao = new PBoardDAO();
PBoardBean bb = new PBoardBean();

bb = bdao.getBoard(num);
bdao.updateReadcount(num);

String content=bb.getContent();
if(content!=null){  //  \r\n (자바기반에서 엔터키 입력시 입력되는 문자열) => <br>로 바꿔서 나타나야함.
 content=content.replace("\r\n", "<br>");    
}
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");  

%>

<!-- 상단  -->
    <div class="container">
    
      <div class="my-5">
        <h1 class="h3 font-weight-normal">본문보기</h1>
<!--         <img src="../assets/img/logo/logo.png" alt="" width="120" height="120">
 -->      </div>
    
<!--       <hr class="mb-5"> -->



<!-- 게시판 시작  -->
      <div id="content" class="col-lg-8 table-responsive-sm mx-auto">

        <!--  게시판 리스트 -->
		<table class="table table-hover text-center">
	
	      <colgroup>
	           <col width="10%">
               <col width="40%">
               <col width="10%">
               <col width="40%">
	      </colgroup>
				<tr><th>글번호</th><td  class="table-light"><%=num %></td><th>조회수</th><td  class="table-light"><%=bb.getReadcount()+1 %></td></tr>
				<tr><th>작성자</th><td  class="table-light"><%=bb.getName() %></td><th>작성일</th><td class="table-light"><%=bb.getDate() %></td></tr>
				<tr><th>제목</th><td  class="table-light" colspan="3"><%=bb.getSubject() %></td></tr>
				<tr><th colspan="4">글내용</th></tr>
				<tr><td colspan="4" class="table-light"><%=content %></td></tr>  
		  <!-- 파일 유무에 따라   -->
                
				<%
				if(bb.getFile()!=null && bb.getType()==1){
				    %>
				    <tr><th>파일</th><td colspan="3" class="table-light">
				    <%=bb.getFile() %> <a href="file_down.jsp?file_name=<%=bb.getFile() %>"> 다운</a>   
				    </td></tr>
				    <% 
				}
				
				else if(bb.getFile()!=null && bb.getType()==2){
				    %>
				    <tr><th>그림</th><td colspan="3" class="table-light">
				    <a href="../upload/<%=bb.getFile() %>"><img src="../upload/<%=bb.getFile() %>" width="600"></a><br>
				    <%=bb.getFile() %> <a href="file_down.jsp?file_name=<%=bb.getFile() %>"> 다운 </a>    
				    </td></tr>
				    <% 
				}
				%>
                

        </table>

      <hr class="mb-5">


        <!-- 목록 버튼 시작 -->

         <div class="float-left"> 
                <div class="float-right"> 
                <input type="button" value="목록" class="btn btn-secondary btn-sm" 
                onclick="location.href='list.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum %>&type=<%=type%>'">
                </div>
        </div>
        
        <!-- 목록 버튼 끝 -->
        
        
        <%
        // 아이디 세션이 있으면 글쓰기 버튼 보이고, 세션값과 글의 작성자와 비교하여 일치하면 글수정 글삭제 버튼이 보이기, 
        
        if (id != null){
        	%>
              <div class="float-right mr-2"> 
        	<%
            if(id.equals(bb.getName())){
            %>
	            <input type="button" value="글수정" class="btn btn-outline-primary btn-sm" 
	                    onclick="location.href='updateForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>&type=<%=type%>'">
	            <input type="button" value="글삭제" class="btn btn-outline-primary btn-sm" 
	                   onclick="location.href='deleteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>&type=<%=type%>'">
            <% 
            }
            %>    
                <%
                if(type==0 || type==1){
                %>
                <input type="button" value="답글" class="btn btn-outline-primary btn-sm" 
                       onclick="location.href='rewriteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>&type=<%=type%>&re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev() %>&re_seq=<%=bb.getRe_seq()%>&subject=<%=bb.getSubject()%>'" >
                    <% 
			        }
			        %> 
        <!-- 글쓰기 버튼 -->
	          <input type="button" value="글쓰기" class="btn btn-primary btn-sm" onclick="location.href='writeForm.jsp?type=<%=type%>'">
	          </div>
        <!--  글쓰기 버튼 끝 -->
        <!--  댓글 쓰기 폼 -->
        <br><br>

				    <div class="commetnWrite form-group">
				<form action="contentPro.jsp" method="post" name="fr" >
				        <input type="hidden" name="boardNum" value="<%=num %>">
				        <input type="hidden" name="pageNum" value="<%=pageNum %>">
				        <input type="hidden" name="name" value="<%=id %>">
				        
				        <table class="table">
				            <tr>
				                <td class="border-0" colspan="2"><input type="text" name="id" value="작성자 : <%=id %>" disabled class="form-control"></td>
			                </tr>
					            <tr><td rowspan="2" class="border-0">
					            <textarea rows="4" cols="60" placeholder="댓글 내용을 입력하세요" name="content" 
					                      class="form-control"></textarea>
					            </td>
					            <td class="border-0"><input type="submit" class="form-control btn btn-success" value="작성"></td>
				            </tr>
				            <tr>
				                <td class="border-0"><input type="reset" class="form-control btn btn-secondary" value="취소"></td>
				            </tr>
				        </table>
				</form>
				    </div>  <!--  commentWirte 완료 -->
		 <%} 
        
        else{   // 로그인 안되어 있으면
        %> 
        <br>
        
           <div class="commetnWrite form-group">
                <table class="table">
                    <tr>
                        <td class="border-0" colspan="2"> <input type="text" name="id" value="로그인한 사용자만 댓글을 달 수 있습니다." disabled class="form-control"></td>
                    </tr>
                    <tr>
                        <td rowspan="2" class="border-0">
                        <textarea rows="4" cols="60" placeholder="로그인을 해주세요" name="content" class="form-control"
                                    onclick="location.href='../member/login.jsp'"></textarea></td>
                        <td class="border-0"><input class="form-control btn btn-success" type="button" value="작성" 
                        onclick="location.href='../member/login.jsp'"></td>
                    </tr>
                    <tr><td class="border-0"><input class="form-control btn btn-secondary"  type="reset" value="취소"></td></tr>
                </table>
            </div>  <!--  commentWirte 완료 -->

         <%} %>   
 
     <hr class="mb-2">
    <div class="commentList row mb-3">
        <%
            	PCommentDAO cdao = new PCommentDAO();
                List<PCommentDTO> cList = new ArrayList<>();
                cList = cdao.getCommentList(num);
        	if(cList!=null){ 
                    for(int i=0; i<cList.size(); i++){
                    PCommentDTO cdto = cList.get(i);
        %>      <hr class="color-gray">
        
            <div class="float-left col-lg-2"><img src="../assets/img/board/userIcon.png"><%=cdto.getName() %></div>
            <div class="float-left col-lg-7 text-left col-sm-5"><%=cdto.getContnet() %></div>
            <div class="float-right col-lg-2"><%=sdf.format(cdto.getDate()) %></div>
            
                        <div class="float-right col-lg-1">
                <% if(id!=null){
                	if(id.equals(cdto.getName()) || id.equals(bb.getName())){
%>
                        <img src="../assets/img/board/xicon.png" 
                        onclick="location.href='commentDel.jsp?cnum=<%=cdto.getNum()%>&num=<%=bb.getNum()%>&pageNum=<%=pageNum %>'">
                    <%}
                	else{
                		%>
          
                		
                		<%
                	}
                }%>
                        </div>
            <%}
          } %>  
    </div>  <!--  commentList 완료 -->
        
        
        
        
        
        
        
        
        
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



