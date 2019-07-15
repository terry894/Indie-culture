<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html lang ="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
       <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet" type="text/css">
    
    <link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free-5.7.2-web/css/all.css"
	rel="stylesheet" type="text/css">
 <style>
 @import url(//fonts.googleapis.com/earlyaccess/hanna.css);
body{background-color: #bdbaba;

}
.assgin{

font-size:25px;
 font-family: 'Hanna', fantasy;
}
.cate-list{
margin-top:-20px;

}

#contents-tag span{
    font-size: 60px;
    line-height: 45px;
    font-family: 'Georgia', sans-serif;
    font-weight: bold;
    letter-spacing: 0px;
    color: #000;
    -webkit-font-smoothing: antialiased;
    text-align:center;
    margin-bottom:-10px
}

.cate-list{
margin-top:-15px;
float:right;
}
a.cate {
margin-right:10px;
color: 3f3737;
font-size:  26px;
font-family: 'Georgia', sans-serif;
}
#target { /* 한 줄 자르기 */ display: inline-block; width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; 
/* 여러 줄 자르기 추가 스타일 */ white-space: normal; line-height: 1.2; height: 3.6em; text-align: left; word-wrap: break-word; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; }

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
margin-bottom: 10px;

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
						<li class="nav-item active"><a class="nav-link"
							href="/board/listAll">Contents <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/board/coronation">대관모집</a></li>
						<li class="nav-item"><a class="nav-link"
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

    <!-- Page Content -->
    <div class="container">

      <div class="row">


        <!-- /.col-lg-3 -->

        <div class="col-lg-12">
<br>
<div id="contents-tag">
<span>MOVIE  
</span>
 <a href="/board/create" class="assgin">등록하기</a>  
</div>
<div class=cate-list>
          <a href="/board/listAll" class="cate">Main</a>
            <a href="/board/movie" class="cate">Movie</a>
            <a href="/board/music" class="cate">Music</a>
            <a href="/board/game" class="cate">Game</a>
              <a href="/board/act" class="cate">Act</a>
        </div>     
          <br>
 
    <div class="row"   style="margin-top:40px">
     <c:forEach items="${movie }" var="board">
            <div class="col-lg-3 col-md-6 mb-4" >
            	
              <div class="card h-100" >
    <iframe src="/board/picture/${board.b_no}" height="205" width="100%" frameborder="0" marginwidth="0" marginheight="0"
></iframe>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#"><td><a href="/board/${board.b_no}">${board.b_title}</a></td></a>
                  </h4>
                  <h5>Movie</h5>
                  <p class="card-text" id="target"> <td>${board.b_detail }</td></p>
                </div>
                <div class="card-footer">
                  <small class="text-muted"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.b_date }" /></small>
                </div>
              </div>
            </div>
     </c:forEach>

          </div>
          
          <!-- /.row -->
               
                  
      <ul class="pagination justify-content-center" >
    <c:if test="${pageMaker.prev }">
    <li>
        <a href='<c:url value="/board/music?page=${pageMaker.startPage-1 }"/>'><i class="fas fa-chevron-left"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li class="page-item">
        <a  class="page-link" href='<c:url value="/board/music?page=${idx }"/>'>${idx }</a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a href='<c:url value="/board/music?page=${pageMaker.endPage+1 }"/>'><i class="fas fa-chevron-right"></i></a>
    </li>
    </c:if>
</ul>



        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->


<!-- 팝업창 -->
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
    <!-- /.container -->






    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>
    <!-- Bootstrap core JavaScript-->
    	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/> "> </script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"> </script>

</body>
</html>

