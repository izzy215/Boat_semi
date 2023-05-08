<%--
http://localhost:8088/Boat/FileBoardList.filebo
 --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html lang="ko">
<head> 
	  <jsp:include page="/sjKim/boat/header.jsp" />
	  
	  
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="jhLee/css/filelist.css">
    
    <title>자료게시판 목록보기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<%--moment lib --%>
 	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script> 
	
	<script src="${pageContext.request.contextPath}/jhLee/js/filelist.js"></script>
	
	

	  <head>


</head>
</head>
<body>
<hr>
    <div class="container">
    <div class = "File_board_list_wrap">
        <div class="File_board_Title">
            <Strong><a class = "filebo" href="${pageContext.request.contextPath}/FileBoardList.filebo" target="_self">자료실 게시판</a></Strong>
            <p>자료실 게시판 입니다.</p>

        </div>
              <input type="hidden" name = "empno" id = "empno" value = ${empno}>
         
       
       <div>
   <div>
     <label>
   <div class = 'search'>
      
        

        <div class="btn-group search">
              <input type="hidden" name = "searchsel" id = "searcselhval" value = ${searchsel}>
            <button type="button" class="btn btn-secondary" id = 'search'>검색옵션</button>
            <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" id = "searchbtn">
            </button>
            
            <div class="dropdown-menu">
                <a class="dropdown-item" href="#"  >작성자
                </a>
                
                <a class="dropdown-item" href="#" >제목
                </a>
                
            </div>
        </div>     
      
          <input class ="search" type="text" name="searchinput" id = "searchinput" value="${searchinput}" >
          <button type="submit" class = "searchbutton search" id="searhcbtn2">
        	<img src="${pageContext.request.contextPath}/jhLee/image/2.png"  class ="searchimg">
        </button>
        </label>
        </div>

        <table class="File_board_list">
            <caption>자료 게시판 목록</caption>
            <thead>
	             <tr>
				    <th colspan="4"></th>
		    		<th colspan="3">
		    			<span class = "listcount">글 개수 : ${listcount}</span>
		    		</th>
			  </tr> 
                <tr class = 'head'>
                    <th><div class="num">번호</div></th>
                    <th><div class="title">제목</div></th>
                    <th><div class="dept">부서</div></th>
                    <th><div class=writer>작성자</div></th>
                    <th><div class="count">조회수</div></th>
                    <th><div class="date">작성일자</div></th>
                    <th><div class="file1">자료</div></th>
                    <th><div class="file2">자료2</div></th>
                </tr>
            </thead>
            <tbody>
            	<c:set var = "num" value ="${listcount-(page-1)*limit }"/>
				<c:forEach var="b" items="${boardlist}">
				<tr>
					<td><%--번호 --%><div class="num">
					<c:out value="${num}"/><%--num출력 --%>
					<c:set var ="num" value="${num-1}"/><%--num =num-1의 의미 --%>
					</div></td>
					
					
					<td><%--제목 --%>
					
					<div class="title">
						<c:if test ="${b.FILE_RE_LEV !=0}"><%--답글인 경우 --%>
			
							<c:forEach var ="a" begin="0" end="${b.FILE_RE_LEV*2}" step="1">
							&nbsp;
							</c:forEach>
							<img alt="들여쓰기" src="${pageContext.request.contextPath}/jhLee/image/line.gif">
						</c:if>
			
						<c:if test="${b.FILE_RE_LEV==0}"><%--원문인 경우 --%>
							&nbsp;
						</c:if>
					
						<c:if test="${!empty empno}">
						<a href ="FileBoadDetailAction.filebo?num=${b.FILE_NUM}">
							<%-- FileBoardDetailAction22번줄 getParameter("num") --%>
						</c:if>
							<c:if test="${b.FILE_SUBJECT.length()>=20}">
								&nbsp;	&nbsp;	&nbsp;	<c:out value="${b.FILE_SUBJECT.substring(0,20)}..."/>
							</c:if>
							
						<c:if test="${b.FILE_SUBJECT.length()<20}">
							&nbsp;	&nbsp;	&nbsp;	<c:out value="${b.FILE_SUBJECT}"/>
						</c:if>
						</a>[${b.CNT}]
						
					
						
			
						<c:if test="${b.FILE_DATE > nowday}">
	 		      	  		<img src="${pageContext.request.contextPath}/ejYang/image/new.jpg" id="new">
	 		      	  	</c:if>
						
						
						
						
					</div><%--제목 --%>
				</td>
			
				<td><div class="dept">${b.DEPT}</div></td>
				<td><div class="writer">${b.FILE_NAME}</div></td>
				<td><div class="count">${b.FILE_READCOUNT}</div></td>
				<td><div class="date">${b.FILE_DATE}</div></td>
				
				
				<td><div class = "file1">
				<c:if test="${!empty b.FILE_FILE}">
				<img alt="파일다운2" src="${pageContext.request.contextPath}/jhLee/image/download.png" class = 'file'>
				</c:if>
				</div></td>
				<td><div class = "file2">
				<c:if test="${!empty b.FILE_FILE2}">
				<img alt="파일다운2" src="${pageContext.request.contextPath}/jhLee/image/download.png" class = 'file'>
				</c:if>

				</div></td>
				</tr>
				</c:forEach>
            	
            </tbody>
        </table>
        
    
     

       <div class="File_board_page">


   <p class="paging">
 
   	<c:if test="${page<=1}">
       <a class="btnPage gray firstItem">이전&nbsp;
     <img src="jhLee/image/pre.png" alt="이전10개" width="10px">  
     </a>
   	</c:if>
   	<c:if test="${page>1}">
     <a href="FileBoardList.filebo?page=${page-1}" class="btnPage arractive firstItem">이전&nbsp;<img src="jhLee/image/pre.png" alt="이전10개" width="10px"></a>
   	</c:if>
   	
 
   	<c:forEach var="a" begin="${startpage}" end="${endpage}">
   		<c:if test="${a==page}">
     		<span class="num"><a class="firstItem">${a}</a> </span> 
   		</c:if>
   		<c:if test="${a !=page}">
     		<span class="num"><a href="FileBoardList.filebo?page=${a}" class="fistItem" >${a}</a> </span> 
   		</c:if>
   		</c:forEach>
   	
   	<c:if test="${page>=maxpage }">
     <a  class="btnPage gray firstItem"><img src="jhLee/image/next.png" alt="다음10개" />&nbsp;다음</a>
   	</c:if>
   	<c:if test="${page<maxpage}">
	     <a href="FileBoardList.filebo?page=${page+1}" class="btnPage arractive fistItem"><img src="jhLee/image/next.png" alt="다음10개" />&nbsp;다음</a>
   	</c:if>
   </p>
   
        </div>
   <%--게시글이 없는 경우 --%>
	<c:if test="${listcount==0}">
		<h3 style="text-align: center">등록된 글이 없습니다.</h3>
	</c:if>
		
		
    <div class="btntwo">
 
    <input name = "dept" type ="hidden" id = "deptval">
    <div class="btn-group deptbtn">
        <button id = "dept" type="button" class="btn btn-secondary">부서별</button>
        <button id = "deptbtn" type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
        </button>
   
        <div class="dropdown-menu">
            <a class="dropdown-item" href="javascript:go(1);">전체</a>
            <a class="dropdown-item" href="javascript:go(1);">홍보팀</a>
            <a class="dropdown-item" href="javascript:go(1);">개발팀</a>
            <a class="dropdown-item" href="javascript:go(1);">인사팀</a>
            <a class="dropdown-item" href="javascript:go(1);">기획팀</a>
            <a class="dropdown-item" href="javascript:go(1);">영업팀</a>
        </div>
    </div>
            <input name = "order" type ="hidden" id = "orderval">
        <div class="btn-group orderbtn">
            <button id = "order" type="button" class="btn btn-secondary">정렬</button>
            <button id = "orderbtn" type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
            </button>
            
            <div class="dropdown-menu">
                <a class="dropdown-item" href="javascript:go(1);">최신순</a>
                <a class="dropdown-item" href="javascript:go(1);">조회순</a>
                <a class="dropdown-item" href="javascript:go(1);">댓글순</a>
            </div>
        </div>
		<button type="button" class="btn btn-info float-right" id = "write">글 쓰 기</button>
		</div><%-- btntwoend --%>

		</div>   
 </div>
 </div>
 </div>
 <script>
	
	
 
 </script>
  <jsp:include page="/sjKim/boat/footer.jsp" />
</body>
</html>