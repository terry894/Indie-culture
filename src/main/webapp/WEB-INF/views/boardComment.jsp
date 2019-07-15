<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
    
    <script>


    var b_no = '${board.b_no}'; 

    
function commentList(){
	$.ajax({

	 	url : '/board/commentList',
	 	type : 'GET',
	 	data : {'b_no': b_no},
	 	success : function(data){
	        var a =''; 
	       
	        $.each(data, function(key, value){ 
	            a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	            a += '<div class="commentInfo'+value.c_no+'">'+'댓글번호 : '+value.c_no+' / 작성자 : '+value.b_writer;    
	            a += '<c:if test="${login.a_id != null}"><a onclick="commentUpdate('+value.c_no+',\''+value.comment+'\');"> 수정 </a>';
	            a += '<a onclick="commentDelete('+value.c_no+');"> 삭제 </a> </div></c:if>';
	            a += '<div class="commentContent'+value.c_no+'"> <p> 내용 : '+value.comment +'</p>';
	            a += '</div></div>';
	        });
	        $(".commentList").html(a);
	    }
	});
}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(c_no, comment){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="comment_'+c_no+'" value="'+comment+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+c_no+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+c_no).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(c_no){
    var updateContent = $('[name=comment_'+c_no+']').val();
    
    $.ajax({
        url : '/board/commentUpdate',
        type : 'post',
        data : {'comment' : updateContent, 'c_no' : c_no},
        success : function(data){
            if(data == 1) commentList(b_no); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(c_no){
    $.ajax({
        url : '/board/commentDelete/'+c_no,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(b_no); //댓글 삭제후 목록 출력 
        }
    });
}
 
 

        $(document).ready(function() {
        	  commentList(); 

        });


</script>