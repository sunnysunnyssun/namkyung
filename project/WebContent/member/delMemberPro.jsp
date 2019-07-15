<%@page import="member.PMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");

// String id = request.getParameter("id");
String pass = request.getParameter("pass");

if(id==null){
    %> 
    <script type="text/javascript">         
    alert('회원 정보가 없습니다.');
    location.href='../main/main.jsp';
    </script>   
    <% 
}

PMemberDAO mdao = new PMemberDAO();
int check = mdao.userCheck(id, pass);

if(check==1){
    

    int result = mdao.deleteMember(id, pass);

    if (result==1){
    %>  
            <script type="text/javascript">         
                alert('탈퇴되었습니다.');    

               
                location.href='../main/main.jsp';
                <%
                session.invalidate();
                %>
            </script>       
    <%}
    else{
    %>  
            <script type="text/javascript">         
                alert('오류 발생'); 
                history.back();
            </script>       
    <%} 
    }

else if(check==0){  // 비밀번호 틀림
%> 
    <script type="text/javascript">         
    alert('비밀번호가 틀렸습니다.');
    history.back();
    </script>   
<%
}
else{
%> 
    <script type="text/javascript">         
    alert('해당 아이디가 없습니다.');
    location.href='../main/main.jsp';
    <%
    session.invalidate();
    %>
    </script>   
<%
}
%>


</body>
</html>