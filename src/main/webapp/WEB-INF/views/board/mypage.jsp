<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link
   href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link
   href="${pageContext.request.contextPath}/resources/css/blog-post.css"
   rel="stylesheet" type="text/css">
<link
   href="${pageContext.request.contextPath}/resources/css/shop-homepage.css"
   rel="stylesheet" type="text/css">
<link
   href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free-5.7.2-web/css/all.css"
   rel="stylesheet" type="text/css">
   
   <style>
@import url(//fonts.googleapis.com/earlyaccess/nanumgathic.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
  
body{
 background-color: rgb(244, 244, 244);
}

.listyle
{
margin-bottom:15px

}

div.section{
    margin: 0 0 10px 0;
    padding: 25px 0 25px 0;

}

div.hero{
    padding: 0 30px;
}
div.hero-inner{
margin: 0 auto;
    max-width: 1100px;
    height:180px;
    padding: 18px 0 60px 0;
    position: relative
}

div.hero.hero-blog{
    background: #dac494 url(http://cdn.dribbble.com/assets/blog/courtside-bg-f9bd6eac7c7d96cf5404cd4db175a8826063826cceac905bf8902529b1e1b373.jpg) repeat fixed;
}
div.hero-title{
float:left;
}
span.pre-head{
color: rgba(0,0,0,0.5);
    display: block;
    font-size: 15px;
    font-weight: 500;
    letter-spacing: .03em;
    line-height: 1;
    margin: 0 0 5px 0;
    text-transform: uppercase;
}
span.blog-name{
    color: #fff;
    font-size: 78px;
    font-weight: bold;
    letter-spacing: -.02em;
    line-height: 1;
    margin: -5px 0 6px 0;
}

.at-header .header-logo a
{
    font-size: 60px;
    line-height: 45px;
    font-family: 'Georgia', sans-serif;
    font-weight: bold;
    letter-spacing: 0px;
    color: #000;
    -webkit-font-smoothing: antialiased;
}
.at-header .header-desc {
    font-size: 13px;
    font-weight: normal;
    letter-spacing: -1px;
    color: #5f2d2d;
}
.at-header .header-logo {
    padding: 0px 20px;
}
#contents-tag
{
border-bottom: 3px solid #3F3737;
margin-bottom: 10px
}
.header-bar
{
    height: 45px;
    line-height: 45px;
    border-top: 2px solid #3F3737;
    background: #fff;
    padding: 0 15px;
    
    width: 100%;
    margin-bottom: 10px;

}
</style>

<script  type="text/javascript">
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
  }
  
</script>

</head>

<body style="padding-top:0px">
        
 
<header>
 <div class="at-header">
 <div class="header-container" >
 <div class="header-logo text-center">
 <a href="/board/listAll" style="text-decoration: none !important;" >
       INSSA
 </a>
 <div class="header-desc">
대한민국 대표 인디문화 커뮤니티

 </div>
 </div>

 </div>

 </div>
 </header>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="/board/listAll">InSSa</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
     <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                  <li class="nav-item "><a class="nav-link"
                     href="/board/listAll">Contents
                  </a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="/board/coronation">대관모집</a></li>
                  <li class="nav-item "><a class="nav-link"
                     href="/board/perpormence">공연일정</a></li>
                  <c:choose>
                     <c:when test="${login.a_name == null }">
                        <li class="nav-item"><a class="nav-link"
                           href="/board/login">Login</a></li>
                     </c:when>
                     <c:otherwise>
                        <li class="nav-item active"><a class="nav-link"
                            href="/board/mypage/${login.a_id}">MyPage</a></li>
                     </c:otherwise>
                  </c:choose>
                     <c:if test="${login.a_name != null }">
                  <li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
                  </li>
                      </c:if>

                  <c:if test="${login.a_name != null }">
                     <li class="nav-item"><a class="nav-link"
                        href="" style="color: rgb(234, 76, 137)">${login.a_name}님 </a></li>
                  </c:if>
                  
                  <c:if test="${login.a_id eq 'admin'}">
                     <li class="nav-item"><a class="nav-link"
                        href="/board/admin/page" style="color: rgb(234, 76, 137)">관리자 페이지 </a></li>
                  </c:if>
                  
               </ul>
   </div>
    </nav>
    
    <div class="hero hero-blog">
    <div class="hero-inner group">
      <div class="hero-title">
        <span class="pre-head">my contents & edit</span>
        <span class="blog-name">My page</span>
        
     </div>
     </div>
   </div>
    
   <!-- Page Content -->
   <div class="container">

      <div class="row">

         <!-- Blog Entries Column -->
         <div class="col-md-8" style="margin-top: -40px; border: solid 2px fffff;" >


            
   
             <c:forEach items="${list }" var="board">
             <c:if test="${login.a_id eq board.b_writer }">
            <!-- Blog Post -->
            <div class="card mb-4">
             <iframe src="/board/picture/${board.b_no}" height="300" width="100%" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" onload="resizeIframe(this)"
></iframe>
               <div class="card-body">
                  <h2 class="card-title">${board.b_title}</h2>
                  <p class="card-text">${board.b_detail }</p>
                  <a href="/board/${board.b_no}" class="btn" style="background-color: #403838; color:white;">해당게시물로 이동 &rarr;</a>
               </div>
               <div class="card-footer text-muted">
                  게시한 날짜: Posted on ${board.b_date} by <a href="#">${board.b_writer}</a> <span
                     class="icon-pencil"></span>
               </div>
            </div>
            </c:if>
            </c:forEach>
         

            

           

         </div>

         <!-- Sidebar Widgets Column -->
         <div class="col-md-4">
         
         <div class="secondary">
  <!-- 
<div class="section "  >
<div id="contents-tag">
  <h3>
    <span class="cat-desc" >프로필 사진</span></br>

  </h3>
  </div>
 
<div>
        <a >
          <img class="photo" src="/resources/img/이력서사진.jpg" width=160px height=160px >
          
</a>
</div>

</div> -->
  <div class="section">
  <div id="contents-tag">
    <h3  style= "font-family: 'Nanum Gothic', sans-serif;">개인정보      <span><button class="btn btn-link" 
                      onclick='location.href="/board/updateUser/${login.a_id}"'>
                     <i style="color:#3F3737" class="fas fa-edit">수정</i>
                  </button></span></h3>
   </div>
         <ul class="list-unstyled" >
            <li class="listyle"><span class="text-muted">이름: </span>${login.a_name}</li>   
                        <li class="listyle"><span class="text-muted">아이디: </span>${login.a_nick }</li>
                        <li class="listyle"><span class="text-muted">전화번호: </span>${login.a_phone }</li>
                        <li class="listyle"><span class="text-muted">생년월일: </span>${login.a_birth }</li>
                        <li class="listyle"><span class="text-muted">메일주소: </span>${login.a_email}</li>
                     </ul>

  </div>
</div>
           
            
            
            </div>   
                 <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">INSSA</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/board/logout">Logout</a>
                </div>
            </div>
        </div>
    </div>
            
            
            <!-- /.row -->

      
      </div>
   </div>



   <footer class="py-5 bg-dark">
   <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your
         Website 2019</p>
   </div>
   <!-- /.container --> </footer>
   <!-- Bootstrap core JavaScript-->
   <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/> "> </script>

   <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"> </script>
   
</body>
</html>