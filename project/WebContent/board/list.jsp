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

PBoardDAO bdao = new PBoardDAO();
//int count = bdao.getBoardCount(int Type);
String typeStr = request.getParameter("type");
if(typeStr==null){
    typeStr = "1";
}
int type = Integer.parseInt(typeStr);


int count = bdao.getBoardCount(type);

int pageSize = 9;
String pageNum = request.getParameter("pageNum");
// System.out.println(pageNum);
if(pageNum==null){pageNum="1";}
// System.out.println(pageNum);

int currentPage = Integer.parseInt(pageNum);



int startRow = (currentPage-1) * pageSize +1;
int endRow = startRow * pageSize;
List<PBoardBean> boardList = null;
if(count!=0){
boardList = bdao.getBoardList(startRow, pageSize, type);
}
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");  

int num = count-(currentPage-1)*pageSize;
%>

<!-- 상단  -->
    <div class="container">
    
      <div class="my-5">
      
        <h1 class="h3 font-weight-normal">
        <%
        if(type==0){
            out.println("문의사항");
        }else if(type==1){
            out.println("공지사항");

        }else if(type==2){
            out.println("제품소개");
        }
        %>
        </h1>
<!--         <img src="../assets/img/logo/logo.png" alt="" width="120" height="120">
 -->      </div>
    
<!--       <hr class="mb-5"> -->



<!-- 게시판 시작  -->
      <div class="col-lg-9 table-responsive-sm mx-auto">
<!--  게시판 검색 및 정보 -->
    <div id="searchInfo" class="my-5">
   

        <!--  검색버튼 -->
        <div id="table_search" class="float-right"> 
            <form action="listSearch.jsp" method="post">
                <input type="hidden" name="type" value="<%=type%>">
                <input type="hidden" name="searchType" value="subject" class="form-control d-inline">
                <div class="form-group float-left">
                <input type="text" name="search" class="form-control d-inline form-control-sm" placeholder="검색어를 입력하세요">
                </div>
                <div class="form-group float-right">
                <input type="submit" value="검색" class="btn btn-link btn-sm border border-primary">
                </div>
            </form>
        </div>

        <!--  검색끝-->
        
        <!--  총개시글수 -->
        
        <div id="table_count" class="float-left">
            <p> 총 글 수 : <%=count %> </p>
        </div>
    </div>
<!--  게시판 검색 및 정보 -->

        <!--  게시판 리스트 -->
    
    
           <% if(type==1 || type==0){ //  Q&A 0, 공지사항 1, 
               %>
        <table class="table table-hover text-center">
               <colgroup>
               <col width="5%">
               <col width="38%">
               <col width="15%">
               <col width="12%">
               <col width="10%">
          
          </colgroup>
          <thead class="thead-light">
            <tr><th>No</th>
                <th class="text-left">제목</th>
                <th>작성자</th>
                <th>작성날짜</th>
                <th>조회수</th>
            </tr>     
          </thead>
          <!-- 반복문     -->
          <tbody>
    <%
        if(count!=0){
        for(int i=0; i<boardList.size(); i++){  
        PBoardBean bb = boardList.get(i);
    %>
        <tr onclick ="location.href='content.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>&type=<%=type%>'">
            <td><%= num-- %></td>
            <td class="text-left">
            <%
            int wid=0;
            if(bb.getRe_lev()>0){
                wid=bb.getRe_lev()*10;%>
                <img src="../assets/img/board/level.gif" width="<%=wid %>">
<!--                 <img src="../assets/img/board/re.gif"> -->
                <span>&angrt;</span>
            
           <%}%>
       
            
            <%= bb.getSubject()%>
            <%
            if(bb.getFile()!=null){
                %><img src="../assets/img/board/iconFile.png" width="15px"><%
            }
            %>
            </td>
            <td><%= bb.getName()%></td>
            <td><%= sdf.format(bb.getDate())%></td>
            <td><%= bb.getReadcount()%></td>
        </tr>
    <%   }
       } %>
          </tbody>
               
              </table>
           <% }
           
           
           
           // "location.href='content.jsp?num=<%=bb.getNum() >&pageNum=<%=pageNum >&type=<%=type>'" //
           
      
           else if(type==2){   // 갤러리 시작 num, bb.getSubject, <img src="../assets/img/board/iconFile.png" width="15px"> bb.getName() sdf.format(bb.getDate()) bb.getReadcount()
               %>
               <div class="container row mx-auto">
                <%
                    if (count != 0) {
                        
                            for (int i = 0; i < boardList.size(); i++) {
                                PBoardBean bb = boardList.get(i);
                                %>
                            
                                <div class="col-lg-4 col-lg-float-left col-sm-6">
                                     <div class="row">
                                         <figure class="figure">
                                           <a href="content.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>&type=<%=type%>">
                                            <%if(bb.getFile() != null){ %>
                                            <img src="../upload/<%=bb.getFile() %>" class="figure-img rounded-lg" width="225" height="225">
                                            <% }else{%>
                                            <img src="../assets/img/logo.png" class="figure-img rounded-lg" width="225" height="225">
                                            <% }%>
                                            </a>                                        
                                            <figcaption class="figure-caption"><p><%=bb.getSubject() %></p></figcaption>
                                         </figure>
                                     </div>
                            <%--         <div class="row">
                                        <div class="float-left col"><p class="text-left"><%=bb.getName() %></p> </div>
                                        <div class="float-right col"><p class="text-right">조회수: <%=bb.getReadcount()%></p> </div>
                                     </div> --%>
                                </div>
                                
                                <%
                            }
                        }%>

               </div>
                    <%}%>







                <!--  글쓰기 검색 버튼 시작 -->



        <!-- 글쓰기 버튼 -->
        <%  String id = (String)session.getAttribute("id");
        if(id!=null){   // 로그인되어있으면 글쓰기버튼 활성
        %> 
        <div id="btnWrite" class="float-right row mr-2 d-block"> 
        <input type="button" value="글쓰기" class="btn btn-outline-primary btn-sm" 
        onclick="location.href='writeForm.jsp?type=<%=type%>'">
        </div>
<!--  글쓰기 검색 버튼 끝 -->
        <% }%>
<!-- 페이지네이션 시작  -->
        <nav aria-label="Page navigation example">
        <%
        if(count!=0){ // count가 0이 아닐때 페이지네이션 활성
            int pageCount = (count%pageSize)==0? count/pageSize : (count/pageSize)+1;
            int pageBlock = 10; 
            
            /////////////////////////////////// 
            int startPage =(currentPage-1)/pageBlock*pageBlock +1;  
            int endPage = startPage + pageBlock-1;
            
            if(pageCount<endPage){
                endPage=pageCount;
            }
        %>
            <ul class="pagination pagination-sm justify-content-center">
                 
                   
            <!--  이전버튼 -->
             <%if(startPage>pageBlock){  // 이전페이지 버튼 활성 %>
                 <li class="page-item">
                     <a class="page-link" href="list.jsp?pageNum=<%=startPage-pageBlock%>&type=<%=type%>" aria-label="이전">
                        <span aria-hidden="true">&laquo;</span>
                     </a>
                </li>
             <%} 
                 %>    
<!--             else{
                 <li class="page-item disabled">
                     <a class="page-link" href="#"  tabindex="-1" aria-disabled="true" aria-label="이전">
                        <span aria-hidden="true">&laquo;</span>
                     </a>
                </li>
             }           
                  -->
            
            
            <!--  페이징  -->
            <%
            for(int i = startPage; i<=endPage; i++){
                if(i==currentPage){ %> 
                 <li class="page-item active" aria-current="page">
                    <a class="page-link" href="list.jsp?pageNum=<%=i %>&type=<%=type%>"><%=i %>
                    <span class="sr-only">(current)</span></a>
                 </li>
                <%
                }
                else{%>
                    <li class="page-item">
                        <a class="page-link" href="list.jsp?pageNum=<%=i %>&type=<%=type%>"><%=i %></a>
                    </li>
                <%
                }
            }
            %>
            <!--  페이징  끝-->
            
            <!--  다음버튼 -->
             <%if(endPage>pageBlock){  // 다음페이지 버튼 활성 %>
                 <li class="page-item">
                     <a class="page-link" href="list.jsp?pageNum=<%=startPage+pageBlock%>&type=<%=type%> %>" aria-label="다음">
                        <span aria-hidden="true">&raquo;</span>
                     </a>
                </li>
             <%} 
             %> 
                
<!--             else{ 
                 <li class="page-item disabled">
                     <a class="page-link" href="#"  tabindex="-1" aria-disabled="true" aria-label="다음">
                        <span aria-hidden="true">&raquo;</span>
                     </a>
                </li>
             }            
 -->                 
            
            
         </ul>
            
            
         <%} // count가 0이 아닐때 페이지네이션 활성 %> 
        </nav>

<!-- 페이지네이션 끝 -->

      </div>
    
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



