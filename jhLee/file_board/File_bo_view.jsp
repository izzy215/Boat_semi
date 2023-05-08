<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<% %> <jsp:include page="/sjKim/boat/header.jsp" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="jhLee/js/fileview.js"></script>
    <title>자료실 게시판</title>

  <link rel="stylesheet" href="jhLee/css/fileview.css">
  <link rel="stylesheet" href="jhLee/css/fileview2.css"><%--댓글 --%>
  
  
</head>
<body>
<input type="hidden" id ="loginid" value ="${empno }" name="loginid"><%--view.js에서 사용하기 위해 추가합니다. --%>
<%-- <input type="hidden" id ="loginid" value ="${id}" name="loginid"><%--view.js에서 사용하기 위해 추가합니다. --%>
<hr class = "boardviewhr">
    <div class="board_wrap">
        <div class="board_title">
            <strong><a href="${pageContext.request.contextPath}/FileBoardList.filebo" target="_self">자료실 게시판</a></strong>
            <p>자료실 게시판 입니다.</p>


        </div>
        <div class="board_view_wrap">
        <div class="board_view">
           <div class="title">
          <c:out value ="${boarddata.FILE_SUBJECT}"/><%--제목 --%>
           </div>
           <div class="info">
            
            <dl>
                <dt>부서명</dt>
                <dt>${boarddata.DEPT}</dt>

            </dl>
            <dl>
                <dt>글쓴이</dt>
                <dt>${boarddata.FILE_NAME}</dt>

            </dl>
            <dl>
                <dt>작성일</dt>
                <dt>${boarddata.FILE_DATE}</dt>

            </dl>
            <dl>
                <dt>조회</dt>
                <dt>${boarddata.FILE_READCOUNT}</dt>

            </dl>
           </div>
      
           <div class="content">
           <c:out value =" ${boarddata.FILE_CONTENT}" escapeXml="false" />
           </div>
         
        </div>
        
        <!-- css필요 -->
       <%--  <c:if test="${boarddata.FILE_RE_LEV==0}">
		   원문글인 경우에만 첨부파일을 추가 할 수 있습니다. --%>
		   <div class="filedown">
		   첨부파일
		   <br>
		   <br>

         
		  
		  <%--파일을 첨부한 경우 --%>
		 
		  <c:if test="${!empty boarddata.FILE_FILE}" >
		    <dl>
		 		 <dt>  <img alt="파일다운" src="${pageContext.request.contextPath}/jhLee/image/down.png" width="10px">
		 		 &nbsp;&nbsp;
		  		<a href = "FileBoardDownAction.filebo?filename=${boarddata.FILE_FILE}">${boarddata.FILE_FILE}</a>
		 		 </dt></dl>
		   </c:if>
		   <c:if test="${!empty boarddata.FILE_FILE2}">
		   		<dl>
		  		<dt>  <img alt="파일다운2" src="${pageContext.request.contextPath}/jhLee/image/down.png" width="10px">
		  		&nbsp;&nbsp;
		 		 <a href = "FileBoardDownAction.filebo?filename=${boarddata.FILE_FILE2}">${boarddata.FILE_FILE2}</a></dt>
		 		  </dl>
		</c:if>

		  <%--파일을 첨부한 경우 --%>
		  
		  <c:if test ="${empty boarddata.FILE_FILE && boarddata.FILE_FILE2}">

			<dl>
			<dt></dt>
			<dt></dt>
			</dl>
		  </c:if>
		 </div><%--div class filedown끝 --%>
		 <%-- </c:if>--%>
     
     
        <div class="bt_wrap">
        
           
            <a href="FileBoardList.filebo" class="on">목록</a>
            
			  
            <a href ="FileBoardReplyView.filebo?num=${boarddata.FILE_NUM}">답변</a>
             
		<c:if test="${boarddata.FIlE_EMPNO ==empno||empno=='ADMIN'}">
		<div class = "personal">
			 <a href="FileBoardModifyView.filebo?num=${boarddata.FILE_NUM}" class = "update">
		         수정
			  </a>
			  <a id ='delete'>
		  	<button id = 'deletebtn' class="btn btn-danger" data-toggle ="modal"
			  data-target="#myModal">삭제</button>
			</a>
			</div>
		</c:if>
		
		
		<div class = "next">
		 	<c:if test="${!empty Fileprev}">
		 	<a href ="FileBoadDetailAction.filebo?num=${Fileprev.FILE_NUM}"><span class = "nextbtn">&lt; 이전글&nbsp;&nbsp;</span><span id ="pretitle">${Fileprev.FILE_SUBJECT}</span></a>
            </c:if>
            
		 	<c:if test="${!empty Filenext}">
            <a href ="FileBoadDetailAction.filebo?num=${Filenext.FILE_NUM}"><span id ="nexttitle">${Filenext.FILE_SUBJECT}</span><span class = "nextbtn">&nbsp;&nbsp;다음글 &gt;</span></a>
            </c:if>
            
		 </div>
		  
		
</div>
        </div><%--"bt_wrap끝 --%>
<%-- modal 시작 --%>
	  <div class="modal" id="myModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal body -->
	        <div class="modal-body">
			  <form name="deleteForm" action="FileBoardDeleteAction.filebo" method="post">
			  <%-- http://localhost:8088/Board/boardDetailACtion.bo?num=22
			  	주소를 보면 num 을 파라미터로 너미고 있습니다.
			  	이 값을 가져와서 ${param.num}를 사용 또는 ${boarddata.board_num} --%>
			  	
	      <input type="hidden" name ="num"value="${param.num}" id="comment_board_num">
	  
	    <div class="form-group">
	      <label for="pwd">비밀번호</label>
	      <input class="form-control" type="password" id="board_pass" placeholder="Enter password" name="board_pass" >    </div>
		
		<button type="submit" class="btn btn-primary">전송</button>
		<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	    </form>
	    </div>
		</div>
		</div>
		</div>
<%--id="myModal"end --%>
       <div class="commcard">
    
       <div class="comment-area">
		<div class="comment-head">
			<h3 class="comment-count">
			댓글<sup id="count"></sup><%--superscript(윗첨자) --%>
			</h3>
			<div class ="comment-order">
				<ul class="comment-order-list">
				</ul>		
			</div>
		</div><%--comment head 끝 --%>
		
		<ul class="comment-list">
		</ul>
		<div class="comment-write">
			<div class="comment-write-area">
				<b class="comment-write-area-name"> ${DEPT}${NAME}${empno}</b>
				<span class="comment-write-area-count">0/200</span>
				<textarea placeholder="댓글을 남겨보세요" rows="1"
					class="comment-write-area-text form-control" maxlength="200"></textarea>
			</div>	
			<div class="register-box">
				<div class="button btn-cancel">취소</div><%--댓글의 취소는 display:none,등록만 보이도록 합니다. --%>
				<div class="button btn-register">등록</div>
			</div>
		</div><%--comment-write end --%>
		
	</div><%--card-body end --%>		
	 							
						
								
								
                        </div>
                           </div>		
<%-- class="card bg-light">end --%>
<%-- class="comment end --%>













        </div>
        
         <jsp:include page="/sjKim/boat/footer.jsp" />
</body>
</html>