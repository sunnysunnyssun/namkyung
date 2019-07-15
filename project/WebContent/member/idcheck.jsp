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

<script type="text/javascript">
function okok(){
    did=document.fr.id.value;
    opener.document.fr.id.value = did;
    window.close(); 
}
function check(){
    id=document.fr.id;

    if (id.value.length<4 || !id.value.length>7){      
        alert("id는 4~7자로 입력해주세요");
        id.focus();
        return;
    }
    
}   
</script>



 </head>

<body class="text-center bg-light">
<%
 String id = request.getParameter("id");
 PMemberDAO mdao = new PMemberDAO();
%>

    <div class="container">
    
	  <div class="text-center mt-5">
	    <h1 class="h3 mb-3 font-weight-normal">아이디 중복 체크</h1>
	  </div>
	
            <hr class="mb-5">


      <div class="col-md-8 mx-auto text-center">
	      <form name="fr" action="idcheck.jsp" method="get" onsubmit="return check()">
	         <div class="form-group">
	           <div class="col-md-6 mb-2 mb-md-0">
	              <input type="text" name="id" class="form-control" id="id" 
	              placeholder="아이디 4~7자 영문자" value="<%=id %>" required maxlength="7" >
	              
         
	           </div>
               <div class="col-md-4 mb-3">
	           <input type="submit" class="form-control btn btn-outline-primary" value="아이디 중복체크">
               </div>             

	         </div>

            
<%
int check = mdao.userCheck(id, "");
    if(check==0 || check==1){
        %> <span class="text-center">중복된 아이디입니다.</span> <%
    }else if(check==-1){
        %>  <span class="text-center">사용가능한 아이디입니다.</span> <br><br>
           <input type="button" class="btn btn-primary" value="아이디 사용하기" onclick="okok()">
        <%
    }
%>

  
      </form>
          
  
    </div>

</div>



</body>

</html>



