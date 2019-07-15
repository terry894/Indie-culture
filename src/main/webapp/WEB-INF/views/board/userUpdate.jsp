<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true"%>
<!doctype html>
<html lang="en">
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
 
    <title>Checkout example for Bootstrap</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}css/form-validation.css" rel="stylesheet" type="text/css">

<style>

body{background-color:#f4f4f4f4;

}

.btn-color{
    background-color: #3f3737;
    color:white;
}
.listyle
{
margin-bottom:15px

}
.signup-below{
    border-bottom: 1px solid #e0e0e0;
    margin-bottom: 20px;
    padding-bottom: 20px;
    text-align: center;
    color: #999;
}

h3{
    font-size: 20px;
    font-weight: normal;
    color: #757575;
    margin-bottom: 50px;
}
.framed{
    width: 1000px;
    margin: 0 0 30px 0;
    padding: 50px;
    background: #fff;
    border-radius: 10px;
    -webkit-box-shadow: 0 0 2px rgba(0,0,0,0.2);
    box-shadow: 0 0 2px rgba(0,0,0,0.2)
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
    background: #dac494 url(https://unsplash.it/1900/1080?image=1076) repeat fixed ;
}
div.hero-title{
float:left;
}
input[type=text],input[type=password],input[type=email]
{
    width: 100%;
    padding: 10px 12px;
    font-family: "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial, sans-serif;
    color: #333;
    border: none;
    background: rgba(0,0,0,0.07);
    border-radius: 6px;
    -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.15);
    box-shadow: inset 0 1px 2px rgba(0,0,0,0.15);
    -webkit-box-sizing: border-box;
    box-sizing: border-box
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
		
								<li class="nav-item"><a class="nav-link"
									href="/board/login">Login</a></li>

						
					</ul>
	</div>
    </nav>

   
    <div class="hero hero-blog">
    <div class="hero-inner group">
      <div class="hero-title">
        <span class="pre-head">Edit your name, etc. </span>
        <span class="blog-name">Profile</span>
        
     </div>
     </div>
	</div>
    
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="framed" style="margin-top: -40px; border: solid 2px fffff;" >

					<form:form commandName="UserVO"
						action="/board/updateUser/${login.a_id}" method="PATCH">
 	  	<div class="form-group">
      <div class="signup-below">
      정보 수정 양식
      
      </div>
 
 
 
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">이름</label>
              <input type="text" readonly name="a_name"
								value="${login.a_name}" class="form-control">
              </div>
            </div>

            
            <div class="mb-3">
              <label for="ID">Artist ID</label>
              <div class="input-group">
   
              <input type="text"  readonly name="a_nick" value="${login.a_nick}"
								class="form-control">
              </div>
            </div>
            
            <div class="mb-3">
              <label for="PS">PassWord</label>
              <div class="input-group">
                <div class="input-group-prepend">
                </div>
                <input type="text" name="a_pw" value="${login.a_pw}"
								class="form-control">
              </div>
            </div>
            
            <div class="mb-3">
              <label for="email">Email </label>
               <input
								type="text" name="a_email" value="${login.a_email}"
								class="form-control">

            </div>

            <div class="mb-3">
              <label for="address">Address</label>
             <input
								type="text" name="a_address" value="${login.a_address}"
								class="form-control">
            </div>
              <label for="from">생년월일</label>
            <div>
              <input
								type="text" name="a_birth" value="${login.a_birth}"
								class="form-control">
            </div>
            
            <label for="from">전화번호</label>
            <div>
             <input
								type="text" name="a_phone" value="${login.a_phone}"
								class="form-control">
            </div>

            
            <hr class="mb-4">
            
          
            			<input type="button" class="btn btn-color"
							data-toggle="modal" data-target="#myModal" value="수정">
						<input type="button" class="btn btn-color"
							data-toggle="modal" data-target="#deletemodal" value="삭제">
							
							
									<div class="modal fade" id="deletemodal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog ">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">INSSA</h5>
										<button class="close" type="button" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<div class="modal-body">

										계정을 탈퇴하시겠습니까? <br>
										<span class="pull-right text-muted small">(틸퇴할 경우 회원정보는 사라지게 됩니다.)</span>
									</div>

									<div class="modal-footer">
										<button class="btn btn-secondary" type="button"
											data-dismiss="modal">Cancel</button>
										<a class="btn btn-primary" 
											onclick="location.href='/board/userdelete/?a_id=${login.a_id}'">delete</a>
									</div>
								</div>	
							</div>
						</div>





				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog ">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">INSSA</h5>
								<button class="close" type="button" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>

							</div>
							<div class="modal-body">정말 수정하시겠습니까?</div>
							<div class="modal-footer">
								<button class="btn btn-secondary" type="button"
									data-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary" id="delete"
										href="">Update</button>
							</div>

						</div>
					</div>
				</div>


			</form:form>
        </div>
      </div>

      
    </div>
    
   
  </div>
  
  </body>
      
         <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
      </div>
      <!-- /.container -->
    </footer>
    <!-- Bootstrap core JavaScript-->
  	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/> "> </script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js?v=<%=System.currentTimeMillis() %>"/>"> </script>
      
</html>