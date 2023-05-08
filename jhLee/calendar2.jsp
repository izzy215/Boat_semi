 
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <jsp:include page="/sjKim/boat/header.jsp" />
<!DOCTYPE html>
<html>

<head>
 
  <meta charset='utf-8' />
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <!-- fullcalendar CDN -->
  
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
 
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  
  <!-- bootstrap -->
  <link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet'>
	<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>

 
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js" integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- the moment-to-fullcalendar connector. must go AFTER the moment lib -->

<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@6.1.1/index.global.min.js'></script>
 
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
 
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <link href ="${pageContext.request.contextPath}/jhLee/css/calendar.css"  rel ="stylesheet">
 
 <script>
 var calendar =null;
 // calendar element 취득
 	var obj = null;
 	var object = null;
 	var upobj = null;
	var allEvent =null;
	var deptevent = null;
 $(document).ready(function(){
	      console.log('달력 전체페이지')
	      
	      var calendarEl = document.getElementById('calendar');
	      
	  	var dept = $('#dept').val();
	 	$('#everyevent').click(function(){
	  		location.href="${pageContext.request.contextPath}/project_calendarstart.cal";	
	  			sessionStorage.removeItem('dept');
	  		sessionStorage.setItem('dept', dept)
	  	})
	  	    var sessiondept =  sessionStorage.getItem('dept');
	  	$('#dept').val(sessiondept);
	  	
	    $('#dept').change(function(){
			 dept = $('#dept').val();
	  		console.log(dept)
	  		//var empno = ${empno}
	      	location.href="${pageContext.request.contextPath}/project_calendarshow.cal?dept="+dept;
	
			})
	      allEvent =${callist}
		 
	      
	      
	      
	      // full-calendar 생성하기
	      calendar = new FullCalendar.Calendar(calendarEl, {
				  		events :allEvent
	        	,height: '600px', // calendar 높이 설정
	       		 expandRows: true, // 화면에 맞게 높이 재설정
	        
	       		 headerToolbar: {
	          		  left: 'prev,next today',
	          		  center: 'title',
 						right : '',
	        			  },
	          
	       		   editable: true, //재수정여부 가능
	     			eventDrop:function(event){
	     			console.log(event)
	     			console.log(event.event.start)
	     			console.log(event.event.title)
	     			var title = event.event.title;
	     			var empno =$('#empno').val();
	     			var startmoment =moment(event.event.start).format('YYYY-MM-DD HH:mm:ss');
	  	            var endmoment = moment(event.event.end).format('YYYY-MM-DD HH:mm:ss');	  
					upobj = new Object();
					upobj.start = startmoment;
					upobj.end = endmoment;
					upobj.empno = empno;
					upobj.title = title;
					
	  	      	$.ajax({
    	   			type:'POST',
    	   			url:'${pageContext.request.contextPath}/project_calupdate.cal',
    	   			data:upobj,
    	   			async:true,
    	   			success:function(response){
    	   				console.log('success'+response
    	   					)	
    	   				if(response==-1){
    	   					alert('본인이 작성한 일정만 수정 가능합니다.');
    	   					setTimeout(function(){
    	   							location.reload();},1500);
    	   				}else{
    	   					
    	   				swal("Good job!", "성공적으로 수정되었습니다.", "success");
    	   				}
    	   			},
    	   			error:function(request,status,error){
    	   				console.log('updateerror')
    	   			},
    	   			complete:function(){}
    	   		})
	      },  
	       
	          //월간 달력으로 시작합니다.
	          initialView: 'dayGridMonth',
	          selectable: true, // 달력 일자 드래그 설정가능
	          nowIndicator: true, // 현재 시간 마크
	          dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	          locale: 'ko', // 한국어 설정
	          eventAdd: function(arg) { // 이벤트가 추가되면 발생하는 이벤트
	              console.log(arg);
	          	console.log('이벤트 변경 및 추가');
	            },
	      
	            eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
	              console.log(obj);
	          	console.log('이벤트 삭제함');
	            
	            },
	            //ok
	            select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
	           console.log(arg);
	            	$('#addevent').modal('toggle');
	            
	            	 	var color =null;
	            $('#saveBtn').click(function(){
	            	var title =$('#title').val();
	            	color = 	 $('#color').val();
	            	
	            	if($('#title').val()==""){
	            		alert('일정을 입력해주세요');
	            		return false;
	            		$('#title').focus();
	            	}
	              console.log(arg.id)
		            var start = arg.start;
		           	var startmoment =moment(start).format("YYYY-MM-DD HH:mm:ss");
		           	 var end = arg.end;
		           	 var endmoment = moment(end).format("YYYY-MM-DD HH:mm:ss");
	                if(title!=""){
	                	obj = new Object();
		           	 	obj.id = arg.defId;
		           		obj.title =  title;
		           		obj.start = startmoment
		           		obj.end = endmoment;
		           		obj.allDay = arg.allDay;
		           		color = 	 $('#color').val();
		           		obj.color = color;
		         	  	 obj.empno = $('#empno').val();
	               
		         	  	calendar.addEvent({
		         	  		'title':title,
		         	  		'start':startmoment,
		         	  		'end':endmoment,
		         	  		'allDay':true,
		         	  		'color':color
		         	  	});
		         	  	calendar.unselect();
	                
	                }	
		         	  	$.ajax({
		    	   			type:'POST',
		    	   			url:'${pageContext.request.contextPath}/project_calendarallSave.cal',
		    	   			data:obj,
		    	   			async:true,
		    	   			success:function(rdata){
		    	   				console.log('모든 데이터 저장하였습니다.');
		    	   				$('#title').val("");		
		    	   				 location.reload();
		    	   			
		    	   			console.log('왜안되니')
		    	   			},
		    	   			error:function(request,status,error){
		    	   				console.log('saveerror')
		    	   				 
		    	   			},
		    	   			complete:function(){}
		    	   		}) 
		         	  
					 $("#addevent").modal('hide');
			                		  
			                		  
	            });
	            $('#undo').click(function(){
	            	$('#title').val("");
	            	 location.reload();
	    	   			
	            })
	            calendar.unselect();  //ok
	            },   eventClick: function (arg) {
	            	console.log(arg)
	            	console.log(arg.event.title)
	            	var title = arg.event.title;
	            	console.log(typeof(title))
	            	console.log(title)
	            	var empno = $('#empno').val();
	            	console.log(empno)
	           		 object = new Object();
	          	 	object.title = title;
	        	  	 object.empno = empno;
	        	         if (confirm("삭제하시겠습니까?")) {
	            	     $.ajax({
	            	                type: "POST",
	            	                url: "${pageContext.request.contextPath}/project_calendardelete.cal",
									data : object,
	            	                success: function (result) {
	            	                  console.log("삭제완료");
	            	console.log(result)
	            	if(result==false){
	            		alert('등록한 글만 삭제 가능합니다.')
	            		setTimeout(function(){
   							location.reload();},1500);	}
	            	
	            	                  arg.event.remove();
	            					 location.reload();
	            	                },error:function(error){
	            		
	            		console.log(error);
	            	
	            	}
	            	
	            	})//ajax 끝 
	            	}else{
	            		console.log('삭제 실패');
	            	}
	            
	            }
	          
     });
     calendar.render();
   });//캘린더 객체 선언 끝

   function update(jsondata){
	   console.log('update')
	   
	    }
   var loadingobj=null;
   
   
	

 </script>
</head>

<body>

<div class="cal_container">
 <hr class = "calhr">
 <div id = cal_wrap>
 <br>
 <br>
 <button id = "everyevent" style = "width : 100px; height : 50px; background-color : rgb(0, 173, 238); color; color :  white; margin-bottom : 20px; border : none;">전체보기</button>
        <select class="form-control" id ="dept">
        <option value ="" class="">팀별 일정 확인하기</option>
  			<option value ="홍보팀" class="ad">홍보팀</option>
  			<option value ="개발팀" class = "devel">개발팀</option>
  			<option value ="인사팀" class = "hire">인사팀</option>
  			<option value ="기획팀" class = "plan">기획팀</option>
  			<option value ="영업팀" class = "sales">영업팀</option>
  			<option value ="개인일정" class = "personal">개인일정</option>
		<c:if test="${empno =='ADMIN'}">
  			<option value ="관리자">(관리자)</option>
		</c:if>
			</select>
			<br>
			<br>
    <!-- Button trigger modal -->
<button id="mobtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addevent">
  Launch demo modal
</button>

 
<!-- Modal -->
<div class="modal fade" id="addevent" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">일정등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      일정추가
        <input type="text" class = "form-control" id = 'title'>
        <select class="form-control" id ="color">
  			<option value ="pink" class="ad">홍보팀</option>
  			<option value ="orange" class = "devel">개발팀</option>
  			<option value ="lightgreen" class = "hire">인사팀</option>
  			<option value ="purple" class = "plan">기획팀</option>
  			<option value ="" class = "sales">영업팀</option>
  			<option value ="lightgray" class = "personal">개인일정</option>
		<c:if test="${empno =='ADMIN'}">
  			<option value ="red">(관리자)</option>
		</c:if>
			</select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id ="undo">돌아가기</button>
        <button type="button" class="btn btn-primary" id ="saveBtn">&nbsp;&nbsp;일정 저장&nbsp;&nbsp;</button>
      </div>
    </div>
  </div>
</div>
  <!-- Modal end -->
  
 <input type="hidden" name ="empno" value="${empno}" id="empno">
 
 	<div id='calendar'></div>
 </div>
 </div><%--calcontainer --%>
 <script>

 </script>
  <jsp:include page="/sjKim/boat/footer.jsp" />
</body>
</html>