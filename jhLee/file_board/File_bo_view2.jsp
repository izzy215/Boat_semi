<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>자료실 게시판</title>

  <link rel="stylesheet" href="jhLee/css/fileview.css">
  
   <jsp:include page="/sjKim/boat/header.jsp" />
</head>
<body>
<input type="hidden" id ="loginid" value ="${id}" name="loginid"><%--view.js에서 사용하기 위해 추가합니다. --%>
    <div class="board_wrap">
        <div class="board_title">
            <strong>자료실 게시판</strong>
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
           <c:out value =" ${boarddata.FILE_CONTENT}" escapeXml="true" />
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
     
        </div>
        <div class="bt_wrap">
        
            <a href="FileBoardList.filebo" class="on">목록</a>
            
              <!-- <c:if test="${boarddata.FILE_NAME ==id||id=='admin'}"></c:if> -->
              
			  <a href="FileBoardModifyView.filebo?num=${boarddata.FILE_NUM}">
		         수정
			  </a>
			  
			  <%--href의 주소를 #으로 설정합니다. --%>
			  
            <a href ="FileBoardReplyView.filebo?num=${boarddata.FILE_NUM}">답변</a>
             
            <a href ="FileBoardReplyView.filebo?num=${boarddata.FILE_NUM}">이전</a>
            <a href ="FileBoardReplyView.filebo?num=${boarddata.FILE_NUM}">다음</a>

		  <a href="#" id ='delete'>
			  <button id = 'deletebtn' class="btn btn-danger" data-toggle ="modal"
			  data-target="#myModal">삭제</button>
			</a>
			  


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

<div class="comment">
 <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                                <!-- Comment form-->
                                <form class="mb-4"><textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea></form>
 							 </div>
                        </div>
                    </section>
<%-- class="card bg-light">end --%>
</div><%-- class="comment end --%>

  <div class="d-flex mb-4">
                                    <!-- Parent comment-->
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">${empno}</div><!--  this.F_C_ID -->
                                        ${F_CONTENT} this.F_CONTENT

this.F_COMMENT_DATE

<div class="comment">
 <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                                <!-- Comment form-->
                                <form class="mb-4"><textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea></form>
                                <!-- Comment with nested comments-->
                                <div class="d-flex mb-4">
                                    <!-- Parent comment-->
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name</div>
                                        If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                        <!-- Child comment 1-->
                                        <div class="d-flex mt-4">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">Commenter Name</div>
                                                And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
                                            </div>
                                        </div>
                                        <!-- Child comment 2-->
                                        <div class="d-flex mt-4">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">Commenter Name</div>
                                                When you put money directly to a problem, it makes a good headline.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single comment-->
                                <div class="d-flex">
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name</div>
                                        When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
<%-- class="card bg-light">end --%>
</div><%-- class="comment end --%>
        </div>
        
         <jsp:include page="/sjKim/boat/footer.jsp" />
</body>
</html>