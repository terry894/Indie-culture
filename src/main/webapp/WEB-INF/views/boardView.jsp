<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
     pageContext.setAttribute("br", "<br/>");
     pageContext.setAttribute("cn","\n");
%>
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
<meta property="og:type" content="website" />
<meta property="og:title" content="${board.b_title}" />
<meta property="og:url" content="http://hwangij.iptime.org:8090/board/${board.b_no}" />
<meta property="og:description" content="/Thumnail/${files2.filename}" />   
<meta property="og:image" content="이미지 경로" />
<!-- Bootstrap core CSS -->
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet" type="text/css">
    
<link
   href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free-5.7.2-web/css/all.css"
   rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->


<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

.btn-color{
    background-color: #3f3737;
    color:white;
}

#like
{
margin-right: 30px
}

.text{
    margin-left: 0;
    font-size: 20px;
    line-height: 1.4;
    color: #444;
   font-weight: 500;
}

img{  
max-width: 100%;
    border-radius: 3px;
    /* -webkit-box-shadow: 0 0 1px rgba(0,0,0,0.4); */
    box-shadow: 0 0 1px rgba(0,0,0,0.4);
}
.section.img{
max-width: 100%;
    border-radius: 5px;
    /* -webkit-box-shadow: 0 0 1px rgba(0,0,0,0.4); */
    box-shadow: 0 0 1px rgba(0,0,0,0.4);

}
teaser{
position: static;
    top: auto;
    left: auto;
    width: auto;
    margin: 15px 0;

}

span.date{
margin: 0 0 10px 0;
    font-size: 14px;
    font-weight: 500;
    line-height: 1;
    text-transform: uppercase;
    letter-spacing: .03em;
    color: #bbb;
  
}
h3{
    margin: 0 0 15px 0;
    font-size: 30px;
    font-weight: 500;
    line-height: 1

}

h2{
margin: 10px 0 0 0px;
    font-size: 36px;
    font-weight: 600;
    line-height: 1.2;
    color: #444;
}




.framed{
    height: auto;
    margin: 0 0 30px 0;
    padding: 50px;
    background: #fff;
    border-radius: 10px;
    -webkit-box-shadow: 0 0 2px rgba(0,0,0,0.2);
    box-shadow: 0 0 2px rgba(0,0,0,0.2)
    }
    
.section-framed{
    width: 350px;
    margin: 0 0 20px 0;
    padding: 10px;
    background: #fff;
    border-radius: 10px;
    -webkit-box-shadow: 0 0 2px rgba(0,0,0,0.2);
    box-shadow: 0 0 2px rgba(0,0,0,0.2)

}    
    

.listyle
{
margin-bottom:15px

}

div.section{
    margin: 0 0 20px 0;
    padding: 25px 0 70px 0;

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
     background: url(/resources/img/violin-music-notes-music-notes-vintage-old-1418876-pxhere.com.jpg) repeat fixed ;
     background-size:cover;
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
span.section-blog-name{
    color: #fff;
    font-size: 78px;
    font-weight: bold;
    letter-spacing: -.02em;
}

span.blog-name{
    color: #fff;
    font-size: 78px;
    font-weight: bold;
    letter-spacing: -.02em;
    line-height: 1;
    margin: -5px 0 6px 0;
}
body {
   background-color:  #bdbaba;
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


<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
  }

function sharefacebook(url){
   window.open("http://www.facebook.com/sharer/sharer.php?u=" + url);
   }


function Like(){
   var sendData= {'boardId' : '${login.a_id}','boardno' : '${board.b_no}'}
     $.ajax({
        url :'/board/like',
          type :'GET',
          data : sendData,
          success : function(data){
           console.log(data);
          }
      });
   
}


function Cancel(){
   var sendData= {'boardId' : '${login.a_id}','boardno' : '${board.b_no}'}
     $.ajax({
          url :'/board/likecancel',
          type :'GET',
          data : sendData,
          success : function(data){
           console.log(data);
          }
      });
}

        $(document).ready(function() {


            
            $(".likebtn").show(); //region 영역 보이기

            $(".likecancel").hide(); //more...숨기기
            

         

            $(".likebtn").click(function() {
                //3000 : 3초, 'slow', 'normal', 'fast'
                
                $(".likecancel").show('fast'); 
                $(".likebtn").hide('fast');//more버튼 숨기기
                Like();
               
            });

           
            
            $(".likecancel").click(function() {
                //3000 : 3초, 'slow', 'normal', 'fast'
                $(".likebtn").show('fast'); 
                $(".likecancel").hide('fast');//more버튼 숨기기
               Cancel();
              
            });



            $(".commentPost").click(function(){

               var sendDatas = {'comment' : $('.comment').val(),'b_no': '${board.b_no}' ,'b_writer':'${login.a_id}'};
        
         
               $.ajax({

                   url : '/board/commentInsert',
                   type : 'POST',
                   data : sendDatas,
                   success : function(data){
                       console.log(data);
                       }

                   });

                });

 
        });

    </script>




<body style="padding-top:0px">
        <form>
 
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
        <div class="hero hero-blog">
    <div class="hero-inner group">
      <div class="hero-title">
         <span class="pre-head">Indie Culture Contents </span>
        <span class="blog-name">posts</span>
        
     </div>
     </div>
   </div>
    
    

      <!-- Page Content -->
   <div class="container">

      <div class="row" >

         <!-- Blog Entries Column -->
         <div class="col-md-8">

      <div class="framed" style="margin-top: -40px; border: solid 2px fffff; ">
      
      <div>
      <span class="date">post on <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.b_date }" />  
      </span>
          
                  </div>
                  <div id="contents-tag">
       <h2 style="display:inline-block">${board.b_title}  
                
                  <c:if test="${login.a_id != null}">
                  
               
                     <button type="button" class="likebtn btn btn-color btn-sm"  onclick="like()" >
                              <i class="fas fa-thumbs-up"></i>   
                     </button>
                  
                     <button type="button" class="likecancel btn btn-color btn-sm"  onclick="like()"  >
                  <i class="fas fa-thumbs-down"></i>
                     </button>
                        
                  
                        
                  </c:if>
                  
         </h2>
          <div>
          <a style=" font-family: 'Hanna', fantasy ; font-size: x-large; color:blue ;  float: right ; "  href ="javascript:sharefacebook('http://hwangij.iptime.org:8090/board/${board.b_no}')"><i class="fab fa-facebook-square" ></i>공유하기</a>
          </div>
         </div>
   
      <div class="teaser">
      
      <c:choose>
  <c:when test="${files2.filename != null }">
<img src="/Thumnail/${files2.filename}"  height="350" width="650" />   
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>                <p>
   <h4>첨부파일</h4><a href="/board/fileDown/${files.b_no}">${files.fileOriName}</a> <hr>   
      </p>
      </div>
      <p class="text">   
      ${fn:replace(board.b_detail, cn, br)}</p>

                  <c:if test="${login.a_id eq board.b_writer || login.a_id eq 'admin' }">

                     <button type="button" class="btn btn-color "
                        onclick="location.href='/board/post/${board.b_no}'">
                        <i class="fas fa-edit"></i>
                     </button>

                     <button type="button" class="btn btn-color" data-target ="#deletemodal" data-toggle="modal"   >
               
                        <i class="fas fa-trash-alt"></i>            
                     </button>   
                  </c:if>
                  

      

          </div>
                
                        <div class="card md-4" style="border-radius:10px; font-family: 'Hanna', fantasy;">
                        
                        
                     
                        
                        
          <h5 class="card-header">댓글 등록:</h5>
          <div class="card-body"  >
                     <div class="form-group">
                <input type="hidden" id = "b_no" name="b_no" value="${board.b_no}"/>
                   <input type="hidden" name="b_writer" value="${board.b_writer}"/>
                <input Type="text" class="comment form-control" id = "comment" name="comment">
              </div>
              <c:if test="${login.a_name != null }">
              <button type="submit" class=" commentPost btn btn-dark" onclick="comment()">제출</button>
         </c:if>
          </div>

          <div class="commentList" style="padding-left:20px"></div>           
          </div>
        </div>
          <%@ include file="boardComment.jsp" %>
         

        
            



<div class="col-md-4">
         <div class="secondary">
  
<div class="section "  >
  <h3 style="font-family: 'Hanna', fantasy;">
      작성자
  </h3>
 
<div>
<!--  
        <a >
          <img style ="border-radius: 100px; margin-right:10px ; " align="left" class="photo" src="/resources/img/이력서사진.jpg" width=100px height=100px >
          
</a>-->
    <h3 style="font-family: 'Hanna', fantasy; font-size:30px; margin-bottom:0px;" > ${board.b_writer} </h3>
    <a href="/board/userpage/${board.b_writer}" style="font-family: 'Hanna', fantasy;">구경가기</a> 




</div>



</div>
<hr>
  <div class="section">
  
      <span class="section-blog-name" style="filter: alpha(opacity=100) "> genre</span>
         <div class="list-group">
                  <a href="/board/listAll" class="list-group-item">Main</a> 
                  <a href="/board/music" class="list-group-item">Music</a>
                  <a
                     href="/board/movie" class="list-group-item">Movie</a> <a
                     href="/board/act" class="list-group-item">Act</a> <a
                     href="/board/game" class="list-group-item">Game</a> <a
                     href="/board/create" class="list-group-item">등록하기</a>
               </div>
  </div>
</div>
        
   
               
               </div>
                  </div>
               </div>
               </div>
               
      
        
        
        <!-- 팝업창  -->
                 <div class="modal fade" id="deletemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">INSSA</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">정말 삭제하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">close</button>
                    <a class="btn btn-secondary" style="color:white" onclick="location.href='/board/post/?b_no=${board.b_no}'">delete</a>
                </div>
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
                  
                  










         <!-- /.container -->

         <!-- Footer --

         <!-- Bootstrap core JavaScript -->
         <script src="/resources/vendor/jquery/jquery.min.js"></script>
         <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   </form>
</body>

</html>