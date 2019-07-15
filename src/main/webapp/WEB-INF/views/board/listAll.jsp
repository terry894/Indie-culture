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
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/> ">
   
</script>
<script
   src="<c:url value="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"/>">
</script>
<script
   src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js?v=<%=System.currentTimeMillis()%>"/>">
   
</script>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
   integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
   crossorigin="anonymous">
<link
   href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css?after"
   rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link
   href="${pageContext.request.contextPath}/resources/css/blog-post.css"
   rel="stylesheet" type="text/css">




<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
body {
   background-color: #bdbaba;
}

p.card-text {
   
}

#target {
   display: inline-block;
   width: 200px;
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
   color: black
}

#event_td {
   display: inline-block;
   width: 400px;
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
   color: black;
   text-align: center;
}

#head_tr {
   background-color: #F7F7F7;
   text-align: center;
   font-size: larger;
   font-family: 'Hanna', fantasy;
   
}

#table_td {
   border-right: 1px solid #dee2e6;
   text-align: center;
}

.table td {
   border-top: 0px solid;
}

p.card-text {
   display: inline-block;
   width: 100%;
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis; 
   white-space: normal;
   line-height: 1.2;
   height: 3.6em;
   text-align: left;
   word-wrap: break-word;
   display: -webkit-box;
   -webkit-line-clamp: 3;
   -webkit-box-orient: vertical;
}
/*
.block {border:2px solid #d81f25; padding:0 5px; height:20px; overflow:hidden; background:#fff; width:100px; font-family:Gulim; font-size:12px;}
.block ul,

.block li span {padding:2px 5px; background:#d81f25; color:#fff; font-weight:bold; margin-right:3px;}
*/
.header-bar {
   overflow: hidden;
   height: 45px;
   line-height: 45px;
   border-top: 2px solid #3F3737;
   background: #fff;
   padding: 0 15px;
   width: 100%;
   margin-bottom: 10px;
}

.header-bar li {
   margin: 0;
   padding: 0;
   list-style: none;
}

.header-bar li a {
   display: block;
   height: 45px;
   line-height: 45px;
}

#carouselExampleIndicators {
   width: 100%;
   max-width: 100%;
   margin-bottom: 1rem;
}

#table {
   border: 3px solid #3F3737;
}

.at-header .header-logo a {
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

#contents-tag {
   border-bottom: 3px solid #3F3737;
   margin-bottom: 10px;
   font-size: x-large;
}
</style>

<script type="text/javascript">
   $(function() {
      var ticker = function() {
         setTimeout(function() {
            $('#ticker li:first').animate({
               marginTop : '-45px'
            }, 400, function() {
               $(this).detach().appendTo('ul#ticker').removeAttr('style');
            });
            ticker();
         }, 3000);
      };
      ticker();
   });
</script>


</head>

<body style="padding-top: 0px">


   <header>
   <div class="at-header">
      <div class="header-container">
         <div class="header-logo text-center">
            <a href="/board/listAll" style="text-decoration: none !important;">
               INSSA </a>
            <div class="header-desc">대한민국 대표 인디문화 커뮤니티</div>
         </div>

      </div>

   </div>
   </header>

   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
   <div class="container">
      <a class="navbar-brand" href="/board/listAll">InSSa</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#navbarResponsive" aria-controls="navbarResponsive"
         aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
         <ul class="navbar-nav ml-auto">
            <li class="nav-item active"><a class="nav-link"
               href="/board/listAll">Contents <span class="sr-only">(current)</span>
            </a></li>
            <li class="nav-item"><a class="nav-link"
               href="/board/coronation">대관모집</a></li>
            <li class="nav-item"><a class="nav-link"
               href="/board/perpormence">공연일정</a></li>
            <c:choose>
               <c:when test="${login.a_name == null }">
                  <li class="nav-item"><a class="nav-link" href="/board/login">Login</a></li>
               </c:when>
               <c:otherwise>
                  <li class="nav-item"><a class="nav-link"
                     href="/board/mypage/${login.a_id}">MyPage</a></li>
               </c:otherwise>
            </c:choose>
            <c:if test="${login.a_name != null }">
               <li class="nav-item"><a class="nav-link" href="#"
                  data-toggle="modal" data-target="#logoutModal">Logout</a></li>
            </c:if>

            <c:if test="${login.a_name != null }">
               <li class="nav-item"><a class="nav-link" href=""
                  style="color: rgb(234, 76, 137)">${login.a_name}님 </a></li>
            </c:if>

            <c:if test="${login.a_id eq 'admin'}">
               <li class="nav-item"><a class="nav-link"
                  href="/board/admin/page" style="color: rgb(234, 76, 137)">관리자
                     페이지 </a></li>
            </c:if>

         </ul>
      </div>
      </div>
   </nav>
   <form method="post" action="/board/listAll">

      <br>
      <div class="container">

         <div class="row">

            <br>

            <div class="col-lg-3 col-md-6 mb-2">


               <div id="contents-tag" style="font-family: 'Hanna', fantasy;" >조회수
                  Top 5</div>
               <table class="table ">

                  <tr id="head_tr">
                     <th style="width: 5%">top</th>
                     <th style="width: 55%">제목</th>

                  </tr>

                  <c:forEach items="${see}" begin="0" end="4" step="1" var="board"
                     varStatus="status">
                     <tbody id="table_td">
                        <tr>
                           <td>${status.count}</td>
                           <td id="target"><a href="/board/${board.b_no}">${board.b_title}</a></td>


                        </tr>
                     </tbody>

                  </c:forEach>
               </table>
            </div>

            <div class="col-lg-6 col-md-6 mb-2 my-4"
               style="margin-bottom: 1rem;">
               <div id="carouselExampleIndicators" class="carousel slide"
                  data-ride="carousel">
                  <ol class="carousel-indicators ">
                     <li data-target="#carouselExampleIndicators" data-slide-to="0"
                        class="active"></li>
                     <c:forEach items="${event}" var="board" varStatus="status">
                        <li data-target="#carouselExampleIndicators"
                           data-slide-to="status" class=""></li>
                     </c:forEach>
                  </ol>
                  <div class="carousel-inner" role="listbox ">


                     <div class="carousel-item active">
                        <a href="/board/39"> <img class="d-block img-fluid"
                           src="/resources/img/event.jpg" alt="First slide"
                           style="height: 300px;">
                        </a>
                     </div>

                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleIndicators"
                     role="button" data-slide="prev"> <span
                     class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                     class="sr-only">Previous</span>
                  </a> <a class="carousel-control-next"
                     href="#carouselExampleIndicators" role="button" data-slide="next">
                     <span class="carousel-control-next-icon" aria-hidden="true"></span>
                     <span class="sr-only">Next</span>
                  </a>
               </div>
            </div>


            <div class="col-lg-3 col-md-6 mb-2">
               <div id="contents-tag"  style="font-family: 'Hanna', fantasy;" >좋아요
                  Top 5</div>
               <table class="table">
                  <tr id="head_tr">
                     <th style="width: 5%">top</th>
                     <th style="width: 55%">제목</th>
                  </tr>

                  <c:forEach items="${like}" begin="0" end="4" step="1" var="board"
                     varStatus="status">
                     <tbody id="table_td">
                        <tr>
                           <td>${status.count}</td>
                           <td id="target"><a href="/board/${board.b_no}">${board.b_title}</a></td>
                        </tr>
                     </tbody>

                  </c:forEach>
               </table>

            </div>

         </div>


         <div>




            <div class="header-bar">

               <ul id="ticker" style="padding-inline-start: 0px">
                  <c:forEach items="${notice}" var="board">
                     <li><a href="/board/${board.b_no}">공지 >
                           ${board.b_title}</a></li>
                  </c:forEach>
               </ul>

            </div>


            <!-- 
            <table class="header-bar"  >
      
                    <c:forEach items="${notice}" var="board">
                    <tbody>
                        <tr>
                        <td style="width:5%;"></td>
                        <td style="width:5%;" > 공지 ><td/>
                            <td style="width:20%; "><a href="/board/${board.b_no}">${board.b_title}</a></td>  
                            <td id="event_td" style=""><a  href="/board/${board.b_no}"> ${board.b_detail}</a></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.b_date }" /></td>
                            <td>${board.b_count}</td>
                        </tr>
               
                    </tbody>
                    
                    </c:forEach>
       </table> -->

         </div>

         <div id="contents-tag">
            <a
               style="color: #3f3737; font-family: 'Georgia', sans-serif; font-size: 25px"
               role="button1" href="/board/music">Music More..</a>
         </div>
         <div class="row">
            <c:forEach items="${music }" begin="0" end="3" step="1" var="board">


               <div class="col-lg-3 col-md-6 mb-4">

                  <div class="card h-100">
                     <iframe src="/board/picture/${board.b_no}" height="205"
                        width="100%" frameborder="0" marginwidth="0" marginheight="0"></iframe>

                     <!--  <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a> -->
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="#"><td><a href="/board/${board.b_no}">${board.b_title}</a></td></a>
                        </h4>
                        <h5>Music</h5>
                        <p class="card-text">
                           <td>${board.b_detail }</td>
                        </p>
                     </div>
                     <div class="card-footer">
                        <small class="text-muted"><fmt:formatDate
                              pattern="yyyy-MM-dd HH:mm" value="${board.b_date }" /></small>
                     </div>
                  </div>
               </div>

            </c:forEach>
         </div>




         <div id="contents-tag">
            <a
               style="color: #3f3737; font-family: 'Georgia', sans-serif; font-size: 25px"
               role="button2" href="/board/movie">Movie More..</a>
         </div>

         <div class="row">
            <c:forEach items="${movie }" begin="0" end="3" step="1" var="board">


               <div class="col-lg-3 col-md-6 mb-4">

                  <div class="card h-100">
                     <iframe src="/board/picture/${board.b_no}" height="205"
                        width="100%" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                  
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="#"><td><a href="/board/${board.b_no}">${board.b_title}</a></td></a>
                        </h4>
                        <h5>Movie</h5>
                        <p class="card-text">
                           <td>${board.b_detail }</td>
                        </p>
                     </div>
                     <div class="card-footer">
                        <small class="text-muted"><fmt:formatDate
                              pattern="yyyy-MM-dd HH:mm" value="${board.b_date }" /></small>
                     </div>
                  </div>
               </div>

            </c:forEach>
         </div>


         <div id="contents-tag">
            <a
               style="color: #3f3737; font-family: 'Georgia', sans-serif; font-size: 25px"
               role="button3" href="/board/act">Act More..</a>
         </div>
         <div class="row">
            <c:forEach items="${act}" begin="0" end="3" step="1" var="board">


               <div class="col-lg-3 col-md-6 mb-4">

                  <div class="card h-100">
                     <iframe src="/board/picture/${board.b_no}" height="205"
                        width="100%" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                     <!--    <a href="#"><img class="card-img-top" src="http://placehold.it/700x400"  alt=""></a> -->
                     <div class="card-body">
                        <h4 class="card-title">
                           <a  href="/board/${board.b_no}">${board.b_title}</a>
                        </h4>
                        <h5>Act</h5>
                        <p class="card-text">
                           ${board.b_detail }
                        </p>
                     </div>
                     <div class="card-footer">
                        <small class="text-muted"><fmt:formatDate
                              pattern="yyyy-MM-dd HH:mm" value="${board.b_date }" /></small>
                     </div>
                  </div>
               </div>

            </c:forEach>
         </div>



         <div id="contents-tag">
            <a
               style="color: #3f3737; font-family: 'Georgia', sans-serif; font-size: 25px"
               role="button4" href="/board/game">Game More..</a>
         </div>
         <div class="row">
            <c:forEach items="${game }" begin="0" end="3" step="1" var="board">


               <div class="col-lg-3 col-md-6 mb-4">

                  <div class="card h-100">
                     <iframe src="/board/picture/${board.b_no}" height="205"
                        width="100%" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                     <!--   <a href="#"><img class="card-img-top" src="http://placehold.it/700x400"  alt=""></a> -->
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="/board/${board.b_no}">${board.b_title}</a>
                        </h4>
                        <h5>Game</h5>
                        <p class="card-text">
                           <td>${board.b_detail }</td>
                        </p>
                     </div>
                     <div class="card-footer">
                        <small class="text-muted"><fmt:formatDate
                              pattern="yyyy-MM-dd HH:mm" value="${board.b_date }" /></small>
                     </div>
                  </div>
               </div>

            </c:forEach>
         </div>

         <!-- 팝업창 -->

         <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="exampleModalLabel">INSSA</h5>
                     <button class="close" type="button" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">×</span>
                     </button>
                  </div>
                  <div class="modal-body">로그아웃 하시겠습니까?</div>
                  <div class="modal-footer">
                     <button class="btn btn-secondary" type="button"
                        data-dismiss="modal">Cancel</button>
                     <a class="btn btn-primary" href="/board/logout">Logout</a>
                  </div>
               </div>
            </div>
         </div>


      </div>

      <footer class="py-5 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white">Copyright &copy; Your
            Website 2019</p>
      </div> </footer>

   </form>
</body>
</html>