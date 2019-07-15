<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
      <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/signin.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template -->
    
    <style>
    body{
     background: url(/resources/img/violin-music-notes-music-notes-vintage-old-1418876-pxhere.com.jpg) repeat fixed ;
     background-size:cover;
}
    #main{
    
    margin: 0 auto;
    width:500px;
    max-width: 600px;
    padding: 60px 20px;
}
.header-logo{
 font-size: 75px;
    line-height: 45px;
    font-family: 'Georgia', sans-serif;
    font-weight: bold;
    letter-spacing: 0px;
    color: #000;
    -webkit-font-smoothing: antialiased;
    text-align:center
    }
    h2{
        font: normal 2.8em "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial, sans-serif;
    text-align: center;
    color:#610b0b;
     font-size: 45px;
    }
    
    .login-form{
        margin: 38px 0 10px 0;
        padding: 20px 20px 10px;
    }
    .form-fieldset{
        margin: 0 0 15px 0;
    }
    
 label{
 
     font-family: 'Georgia', sans-serif;
        display: block;
    margin: 0 0 4px 0;
    font-size: 1.4em;
    line-height: 1;
    color: black
}
.text-input
{
    width: 100%;
    height:40px;
    box-sizing: border-box;
    border: none;
    border-radius: 6px;
    font: 18px "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial, sans-serif;"
    padding: .375rem .75rem;
    margin-right: 8px;
    color: #444;
    outline: none;
}
button.btn{
    display: block;
    width: 100%;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    font: normal 16px "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial, sans-serif;
    background: #584848;
    border-radius: 4px;
    border: none;
    padding: 10px 12px;
    color: #fff;
    cursor: pointer;
}


    
    </style>
    
  </head>
  
  <body>
  
  <div id="main">
   <form class="form-signin" method="post" action="/board/login">
   </form>
   
  <form method="post" action="/board/loginProcess" > 
  <h1 class=header-logo>
  INSSA
  </h1>
  <h2>Sign in</h2>

  
 <div class="login-form">
 <div class="form-fieldset">
 <label for="login">Username</label>
 <input type="text" name="a_id" id="login" tabindex="1" class="text-input"  class="form-control">
 
 </div>

  <div class="form-fieldset" style="margin-bottom:20px;">
   <label for="password">Password</label>
    <input type="password" name="a_pw"  tabindex="1" class="form-control" class="text-input" >
 </div>
    <button class="btn " type="submit" style="margin-bottom:10px">로그인</button>
   </form>    
      <form class="signup" method="get" action="/board/signup">
         <button type ="submit" class="btn" style="background-color:#7b4343">회원가입</button> 
           </form>
 </div>

  </div>
      
 <script type="text/javascript"> 

var result = '${msg}';
if(result ==1 ){

   swal({title: "good"});
}


</script>
      

 

      </body>
</html>
