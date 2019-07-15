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
    
       <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/blog-post.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet" type="text/css">
    <link
   href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free-5.7.2-web/css/all.css"
   rel="stylesheet" type="text/css">
 <style>
body{background-color: #bdbaba;

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

         <!-- Blog Entries Column -->
         <div class="col-md-8">

            <h1 class="my-4">Manager Page</h1>

            <!-- Blog Post -->
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

				<c:forEach items="${admin}" var="board">
					<tbody>
						<tr>
							<td>${board.b_writer}</td>
							<td id="target"><a href="/board/${board.b_no}">${board.b_title}</a></td>
							<td ><a href="/board/${board.b_no}">${board.b_detail }</a></td>
							<td id="date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${board.b_date }" /></td>
							<td>${board.b_count}</td>
						</tr>
					</tbody>

				</c:forEach>

			</table>

   <ul class="pagination justify-content-center" >
    <c:if test="${pageMaker.prev }">
    <li>
        <a href='<c:url value="/board/admin/page?page=${pageMaker.startPage-1 }"/>'><i class="fas fa-chevron-left"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li class="page-item">
        <a  class="page-link" href='<c:url value="/board/admin/page?page=${idx }"/>'>${idx }</a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a href='<c:url value="/board/admin/page?page=${pageMaker.endPage+1 }"/>'><i class="fas fa-chevron-right"></i></a>
    </li>
    </c:if>
</ul>
        
        
           </div>
        
        
              <div class="col-md-4">

   
            <!-- Search Widget -->

                   <h1 class="my-4" >관리 목록</h1>

        <div class="list-group">
            <a data-toggle="modal" data-target="#myModal" href="/board/admin/showUser" class="list-group-item" >사용자 관리</a>
            <a href="/board/event" class="list-group-item">대관 시설/공지 작성</a>
            <a href="/board/perpormence" class="list-group-item">공연일정 관리</a>
            <a href="/board/coronation" class="list-group-item">대관문의게시글 관리</a>
          </div>
          </div>
      <!-- modal -->    
          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
              <h4 class="modal-title" id="myModalLabel">회원정보</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <div class="modal-body">
         <table class="table table-hover">
                  <tr>
                     <th style="width: 1%">no</th>
                     <th style="width: 15%">이름</th>
                     <th style="width: 10%">아이디</th>
                     <th style="width: 50%">주소</th>
                     <th style="width: 15%">전화번호</th>
                     <th style="width: 15%">이메일</th>
                     <th class="col-md-2">탈퇴</th>
                  </tr>

<div class="row" >
     <c:forEach items="${user}" var="user" varStatus="status">
     
      <tbody>
                     <tr>
                        <td>${status.count}</td>
                        <td>${user.a_name }</td>
                        <td>${user.a_nick}</td>
                        <td>${user.a_address }</td>
                        <td>${user.a_phone }</td>
                        <td>${user.a_email }</td>
                   
                    <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-dark"
                        onclick="location.href='/board/admin/userdelete/?a_id=${user.a_id}'">
                        <i class="fas fa-trash-alt"></i>
                     </button>
                            </div>
                        </td>
                     </tr>
                  </tbody>
        
            
     </c:forEach>
</div>

               </table>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
          
          
 
            
            
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
        
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
    

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
      </div>
      <!-- /.container -->
    </footer>
    <!-- Bootstrap core JavaScript-->
     <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/> "> </script>
   <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"> </script>
</body>
</html>
