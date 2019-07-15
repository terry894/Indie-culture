<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
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
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}css/blog-post.css"
	rel="stylesheet" type="text/css">

<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);


body{background-color: #bdbaba;

}
textarea{
width:100%
}
#button-color
{
background-color:#3F3737;
color:white;
}
th
{
background-color:#F7F7F7;
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
	<br>



	<!-- 추가 -->
	<div class="container">

					<form name="BoardWriteForm" action="/board/create" method="POST"
						enctype="multipart/form-data">
		<div class="py-5 ">
		
     	<div id="contents-tag" style="margin-bottom:0px">
         <h2 style="font-family: 'Hanna', fantasy; color:#3F3737">글쓰기</h2>
       </div>
			<table class="table table-bordered" style="backgorund-color: #bdbaba">
		
				<tbody>

						<br>
						<form>
							<tr>
								<th>장르:</th>
								<td colspan="2"><select name="b_category">
										<option value="1">music</option>
										<option value="2">movie</option>
										<option value="3">act</option>
										<option value="4">game</option>
								</select>
								
								
				</td>

							</tr>
							
							<tr>
													<th>작성자:</th>
						<td colspan="2"><input type=text name="b_writer" class="from-control"
							value="${login.a_id}" ></td>
							</tr>
						</form>
			

					<tr>
						<th>제 목:</th>
						<td colspan="2"><input type=text name="b_title" class="from-control"
							placeholder="게시판 제목" ></td>
					</tr>
					<tr>
					<tr>
						<th>내 용:</th>
						<td	colspan="2"><textarea name="b_detail" class="from-control"
								placeholder="게시판 내용" rows="10" cols="100"></textarea></td>
					</tr>
					<tr>
						<th>파일등록:</th>
						<td>첨부파일<input type="file" name="files" class="from-control">
						</td>
						<td>썸네일<input type="file" name="files2" class="from-control">
						</td>
					<tr>

						<td colspan="3"><div align="center">
								<input class="btn" id="button-color" data-target="#assginmodal" data-toggle="modal" type="button" value="등록" >
								<input class="btn" id="button-color" type="button" value="뒤로" onclick="history.back(-1);">
								
													
	
							</div></td>
					</tr>
					

					
					
				
				</tbody>
			</table>
			
				<!-- 팝업창 -->	
			
			     <div class="modal fade" id="assginmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">INSSA</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">장르를 확인해 주세요, 등록 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">close</button>
                    <button class="btn btn-primary" type="submit">assgin</button>
                </div>
            </div>
        </div>
    </div>
			
	</form>
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
		<!-- /.row -->

	</div>


	<!-- /.container -->

	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/jquery/jquery-3.3.1.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>

