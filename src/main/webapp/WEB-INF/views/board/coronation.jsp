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
<title>게시판</title>
<!-- Bootstrap core CSS -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet" type="text/css">
    
<style>
 @import url(//fonts.googleapis.com/earlyaccess/hanna.css);    

 
   table { 

      border-collapse: collapse; 

      border-spacing: 0;      

      width: 100%; 

      table-layout: fixed;

   }



   td { 

      vertical-align: middle; 

      padding:5px;

      border: 1px solid white;

      overflow:hidden;

      white-space : nowrap;

      text-overflow: ellipsis;

    }



   td.textOverDefault {

      white-space : normal; /*기본값*/

      text-overflow: clip; /*기본값*/

   }
    
body{background-color:  #fbede9;
}

#target { display: inline-block; width: 150px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }


    .container-heading{
line-height: 1;
    font-size: 3rem;
    margin: 1rem 0;
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

@media screen and (max-width: 700px) {
  #hide{
  display:none;
  }
}


</style>
    
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
                  <li class="nav-item active"><a class="nav-link"
                     href="/board/coronation">대관모집</a></li>
                  <li class="nav-item "><a class="nav-link"
                     href="/board/perpormence">공연일정</a></li>
                  <c:choose>
                     <c:when test="${login.a_name == null }">
                        <li class="nav-item"><a class="nav-link"
                           href="/board/login">Login</a></li>
                     </c:when>
                     <c:otherwise>
                        <li class="nav-item"><a class="nav-link"
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
   <div class="container">

    <div class="jumbotron my-4" style="background: #fbede9 ; ">
    <div  style= "flex-basis: 50%; width: 50%;"  >
      <h1 class="container-heading" style=" font-family: 'Hanna', fantasy; color:  #3E598E">대관모집 게시판 입니다.</h1>
      <p style="font-size: 1.5rem; color:#e35c5a  ; font-family: 'Hanna', fantasy;">공연날짜, 공연장소, 모집팀에 대한 정보를 공유하여  같이 대관할 팀을 구합니다.</p> 
      <a  href="/board/create2" class="btn" style="background-color: #ea4c89; color:white">등록하기</a>
      <a  id="hide" data-toggle="modal" data-target="#myModal" href="#" class="btn" style="background-color: #ea4c89; color:white">대관시설 보기</a>         
    </div>
<img class="enrique-image" width="400" height="300" style="color:#fbede9; flex-basis: 45%; width:45%;"" data-loaded="yes" alt="Art by Justin Mezzell" 
 data-src="https://cdn.dribbble.com/assets/art-banners/jmezz-7d6e1362b18d3fc9abd87b5ca7b112bb2b725f349f3bd44d7e3b4de937064547.png" src="https://cdn.dribbble.com/assets/art-banners/jmezz-7d6e1362b18d3fc9abd87b5ca7b112bb2b725f349f3bd44d7e3b4de937064547.png">
    </div>

      <!-- Post Content Column -->
      <div class="py-5 ">

         <h1 class="mt-4" style="color:#3E598E">대관모집 게시판</h1>

         <!-- Author -->
         <hr style="border:solid 2px #3E598E;" >

         <table class="table table-hover" >
            <thead id="thead1">
               <tr>
                  <th style="width: 10%">작성자</th>
                  <th style="width: 20%">제목</th>
                  <th style="width: 40%">내용</th>
                  <th id="date" style="width: 20%">날짜</th>
                  <th style="width: 10%">조회수</th>
               </tr>
            </thead>

            <c:forEach items="${rent}" var="board">
            
               <tbody>
                  <tr>
                     <td>${board.b_writer}</td>
                     <td><a href="/board/${board.b_no}">${board.b_title}</a></td>
                     <td ><a href="/board/${board.b_no}">${board.b_detail }</a></td>
                     <td ><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                           value="${board.b_date }" /></td>
                     <td>${board.b_count}</td>
                  </tr>
               </tbody>

            </c:forEach>

         </table>

   <ul class="pagination justify-content-center" >
    <c:if test="${pageMaker.prev }">
    <li>
        <a href='<c:url value="/board/coronation?page=${pageMaker.startPage-1 }"/>'><i class="fas fa-chevron-left"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li class="page-item">
        <a  class="page-link" href='<c:url value="/board/coronation?page=${idx }"/>'>${idx }</a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a href='<c:url value="/board/coronation?page=${pageMaker.endPage+1 }"/>'><i class="fas fa-chevron-right"></i></a>
    </li>
    </c:if>
</ul>
         <hr>

         
         <!-- 팝업창 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="max-width: 1100px;">
    <div class="modal-content">
      <div class="modal-header">
              <h4 class="modal-title" id="myModalLabel">대관시설 정보</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <div class="modal-body"  style=>
        
     <c:forEach items="${hall }" var="board">
            <div class="col-lg-3 col-md-6 mb-4" style="display:inline-block; padding-left:5px; padding-right:5px;  flex: 0 0 24.5%; max-width:24.5%;box-sizing: border-box" ;
">
               
              <div class="card h-100" >
   <iframe src="/board/picture/${board.b_no}" height="205" width="100%" frameborder="0" marginwidth="0" marginheight="0"
></iframe>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#"><td id="target"><a href="/board/${board.b_no}">${board.b_title}</a></td></a>
                  </h4>
                  <h5>대관시설</h5>
                  <p class="card-text" id="target"> <td>${board.b_detail }</td></p>
                </div>
                <div class="card-footer">
                  <small class="text-muted"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.b_date }" /></small>
                </div>
              </div>
            </div>
     </c:forEach>
</div>

<ul class="pagination justify-content-center" >
    <c:if test="${pageMaker.prev }">
    <li>
        <a href='<c:url value="/board/coronation?page=${pageMaker.startPage-1 }"/>'><i class="fas fa-chevron-left"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li class="page-item">
        <a  class="page-link" href='<c:url value="/board/coronation?page=${idx }"/>'>${idx }</a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a href='<c:url value="/board/coronation?page=${pageMaker.endPage+1 }"/>'><i class="fas fa-chevron-right"></i></a>
    </li>
    </c:if>
</ul>
      
      <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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




      </div>
   </div>
   </div>

   <footer class="py-5 bg-dark">
   <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your   Website 2019</p>
      
   </div>
   <!-- /.container --> </footer>

   <!-- Bootstrap core JavaScript-->
   <script src="/resources/vendor/jquery/jquery.min.js"></script>
   <script src="/resources/vendor/jquery/jquery-3.3.1.js"></script>
   <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>