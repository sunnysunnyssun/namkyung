<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<% String id = (String)session.getAttribute("id"); %>

    <div class="container mb-auto">
      <div class="row">
        <div class="mx-auto col-12 col-md-9">
          <nav class="navbar navbar-expand-md navbar-light">
            <div class="container">
              <a class="navbar-brand" href="../main/main.jsp">NAM KYOUNG</a>
              <button class="navbar-toggler navbar-toggler-right" type="button" 
                      data-toggle="collapse" data-target="#mainNav" 
                      aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span> </button>
              <div class="collapse navbar-collapse text-center justify-content-end" id="mainNav">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link active" href="../main/main.jsp">홈</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="../main/intro.jsp">소개</a>
                  </li>
                   <li class="nav-item">
                    <a class="nav-link" href="../main/map.jsp">위치</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="../board/list.jsp?type=1">공지</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="../board/list.jsp?type=2">제품</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="../board/list.jsp?type=0">문의</a>
                  </li>                  
                  <% if(id!=null){ %>
                  <li class="nav-item">
                    <a class="nav-link" href="../member/myPageIntro.jsp">내 정보</a>
                  </li>
                  <%}%>
                </ul>
                
				<% if(id==null){ %>
                  <a class="btn navbar-btn btn-sm btn-outline-secondary ml-2" href="../member/login.jsp">로그인</a>
				    <%  
				}
				else{
				    %>
                  <a class="btn navbar-btn btn-sm btn-outline-secondary ml-2" href="../member/logout.jsp">로그아웃</a>
				    <%  
				}
				%>
              </div>
            </div>
          </nav>
        </div>
      </div>
    </div>