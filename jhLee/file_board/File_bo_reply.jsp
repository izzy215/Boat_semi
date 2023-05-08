<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
  <jsp:include page="/sjKim/boat/header.jsp" />
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- include summernote css/js -->
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

  <link rel="stylesheet" href="jhLee/css/writeform.css">

    
<script src="${pageContext.request.contextPath}/jhLee/js/writeform.js"></script>


<style>

</style>

</head>
<body>
<div class="container">
<%-- <hr class = "writehr">--%>
 <form action="FileBoardReplyAction.filebo" method="post" enctype = "multipart/form-data" name ="fileboardform">
 	<input type="hidden" value ="${boarddata.FILE_RE_REF}" name="board_re_ref">
	<input type="hidden" value ="${boarddata.FILE_RE_LEV}" name="board_re_lev">
	<input type="hidden" value ="${boarddata.FILE_RE_SEQ}" name="board_re_seq">
 	<h1>boat_ 답글쓰기</h1>
     <input type ="hidden" name = "empno" value="${empno}">
    <div class="form-group">
        <label for="board_subject">제목</label>
        <input name="board_subject" id="board_subject" type="text" maxlength="100"
        class="form-control" placeholder="제목을 입력하세요" value="Re:${boarddata.FILE_SUBJECT}">
    </div>
 	


 	<div class="form-group">
         <label for="board_pass">비밀번호</label>
 		<input name="board_pass" id="fileboard_pass" type="password" maxlength="30"
 		class="form-control" placeholder="비밀번호를 입력하세요">
    </div>

 
         <div class="form-group ">
        <label for = "board_name">글쓴이</label><br>
        <div class="btn-group">
            <button type="button" class="btn btn-secondary" id = "deptsel">${member.dept}</button>
            <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" id = "deptbutton">
            </button>
              <div class="dropdown-menu" >
                <a class="dropdown-item" href="#">홍보팀</a>
                <a class="dropdown-item" href="#">개발팀</a>
                <a class="dropdown-item" href="#">인사팀</a>
                <a class="dropdown-item" href="#">기획팀</a>
                <a class="dropdown-item" href="#">영업팀</a>
              </div>
            </div>
            <input type="hidden" name = "dept" id = "dept">
       		<input name="board_name" id="board_name" value="${member.name}" type="text"  class="form-control writer"
       			placeholder="이름을 입력하세요" >
  	  </div>
        
    

 	
 		<label for="board_content">내용</label>
 		<textarea name="board_content" id="summernote"  class="form-control"></textarea>
 	
 	<div class="form-group file1">
 		<label>
 		<img alt="파일첨부" src="${pageContext.request.contextPath}/jhLee/image/file.png"> 
 		&nbsp;파일첨부
 		<input name="board_file" id="upfile" type="file">
		 </label>
	 	
 		<span id ="filevalue"></span>
 	</div>
 	<div class="form-group file2">
 		<label>
 		<img alt="파일첨부2" src="${pageContext.request.contextPath}/jhLee/image/file.png">
 		 &nbsp;파일첨부2
 		<input name="board_file2" id="upfile2" type="file">
		 </label>
	 	
 		<span id ="filevalue2"></span>
 	</div>
 	
 	<div class="form-group btn-group2">
 		<button type="submit" class="btn btn-primary" style="background-color :  rgb(0, 173, 238)!important;border-color:rgb(0, 173, 238)!important">등록</button>
 		<button type="reset" class="btn btn-danger" onclick="history.go(-1)">취소</button>
 	</div>
 </form>
</div><!-- container끝 -->
<script>
$(function(){
$("deptsel+div a").text(${boarddata.DEPT})

	
})//ready끝

</script>

</body>
</html>