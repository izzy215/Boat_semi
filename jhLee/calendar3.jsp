 
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
 
 <link href ="${pageContext.request.contextPath}/jhLee/css/calendar.css"  rel ="stylesheet">
 
 <script>
 var calendar =null;
 // calendar element 취득
 	var obj = null;
 	var object = null;

 $(document).ready(function(){
	      
	      //드래그앤 드롭가능  -> 추후 삭제 예정
	      var Draggable = FullCalendar.Draggable;
	      
	      var containerEl = document.getElementById('external-events');
	      var calendarEl = document.getElementById('calendar');
	      var checkbox = document.getElementById('drop-remove');
	      var allEvent =null;
	      //db모든 데이터 가져옴
	    
	      //드래그앤 드롭가능  -> 추후 삭제 예정
	      
	      new Draggable(containerEl, {
	          itemSelector: '.fc-event',
	          eventData: function(eventEl) {
	            return {
	              title: eventEl.innerText
	            };
	          }
	        });
	      //드래그앤 드롭가능  -> 추후 삭제 예정
	      
	      
	      var all_events = loadingEvents();
	     console.log(all_events);
	      
	      // full-calendar 생성하기
	      calendar = new FullCalendar.Calendar(calendarEl, {
	    		events :all_events,
	    		
	        	height: '600px', // calendar 높이 설정
	       		 expandRows: true, // 화면에 맞게 높이 재설정
	        
	       		 headerToolbar: {
	          		  left: 'prev,next today',
	          		  center: 'title',
 						right : '',
	        			  },
	          
	       		   editable: true, //재수정여부 가능
	       		 //drop으로 update 해야함
	        	 /*  droppable: true,
	       	   
	          		drop: function(info) {
	            } 
	          },*/
	          //월간 달력으로 시작합니다.
	          initialView: 'dayGridMonth',
	          editable: true, // 수정 가능?
	          selectable: true, // 달력 일자 드래그 설정가능
	          nowIndicator: true, // 현재 시간 마크
	          dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	          locale: 'ko', // 한국어 설정
	          
	          eventAdd: function(arg) { // 이벤트가 추가되면 발생하는 이벤트
	              console.log(arg);
	          	console.log('이벤트 변경 및 추가');
	          	 var id = arg.id
		            console.log("아이디있대"+id);

	          	
	            },
	            eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
	              console.log(obj);
	          	console.log('이벤트 수정함');
	            var start = arg.start;
	           	var startmoment =moment(start).format("YYYY-MM-DD HH:mm:ss");
	           	 var end = arg.end;
	           	 var endmoment = moment(end).format("YYYY-MM-DD HH:mm:ss");
	           		obj.title =  title;
	           		obj.start = startmoment
	           		obj.end = endmoment;
	           		obj.allDay = arg.allDay;
	           		color = 	 $('#color').val();
	           		obj.color = color;
	         	  	 obj.empno = $('#empno').val();
	         	  	 update(obj); 
	            },
	            eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
	              console.log(obj);
	          	console.log('이벤트 삭제함');
	            
	            },
	            //ok
	            select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
	           console.log(arg);
	            var id = arg.id
	            console.log("아이디있대"+id);
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
		    	   			},
		    	   			error:function(request,status,error){
		    	   				console.log('saveerror')
		    	   				 
		    	   			},
		    	   			complete:function(){}
		    	   		}) 
		         	  
		 $("#addevent").modal('hide');
			                		  
			                		  
	            });
	                //ok
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
	            	                  arg.event.remove();
	            	 location.reload();
	            	                },error:function(error){
	            		alert('등록한 글만 삭제 가능합니다.')
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
	    
  
	    
	    //전체 이벤트 뽑아냄(그달의 전체 이벤트)
	    //뽑을때 각각 데이터로 뽑아냄 json값
	/*     function cal_data(allEvent){
	     		 var events = new Array();
		   		 var obj = new Object();
	     		 for(var i=0; i<allEvent.length;i++){
	     		 
 		   		var startevent = moment(allEvent[i]._instance.range.start).format("YYYY-MM-DD HH:mm:ss");
	//	   		var startevent = moment(allEvent[i]._instance.range.start).format("YYYY-M-D ");
	//	   		var endevent = moment(allEvent[i]._instance.range.end).format("YYYY-M-D");
	   			var endevent = moment(allEvent[i]._instance.range.end).format("YYYY-MM-DD HH:mm:ss");
		   		 
		   		 obj.title = allEvent[i]._def.title; //이벤트 명칭
		   		 obj.allday =allEvent[i]._def.allDay; //하루종일 이벤트인지 알려주는boolean값
		   		 obj.start = startevent//시작날짜 및 시간
		   		 obj.end   = endevent //마침 날짜 및 시간
	    		}
	     		 obj.empno = $('#empno').val();
	     	 
	     	return obj
	      } */
   
   
	    //selectable 저장
	  /*   function save(){
	    allEvent = calendar.getEvents();
	    console.log(allEvent);
	    console.log("현재 이벤트 저장합니다.");
	    let obj = cal_data(allEvent);
	   	 savedata(obj);
	   	 
	    } */
	    
	    //전체 버튼 누르면 저장됨
	   /*  function allSave(){
	    allEvent =	 calendar.getEvents();
	   	 console.log(allEvent);
	   	 alert("전체 이벤트 저장합니다.");
	 	console.log('1111'+moment.locale());
	   	 console.log("전체 이벤트 저장합니다.");
	   	 
	    let obj = cal_data(allEvent);
	   	 savedata(obj);
	   	 } */
	    

	    //이벤트 db저장 ajax
	  /*   function savedata(jsondata){
	   		$.ajax({
	   			type:'POST',
	   			url:'${pageContext.request.contextPath}/project_calendarallSave.cal',
	   			data:jsondata,
	   			async:true,
	   			success:function(rdata){
	   				console.log('모든 데이터 저장하였습니다.');
	   				$('#title').val("");		
	   			
	   			},
	   			error:function(request,status,error){
	   				console.log('saveerror')
	   			},
	   			complete:function(){}
	   		}) 
	    }//save data끝 */
	    
	    
	    function update(jsondata){
	   		$.ajax({
	   			type:'POST',
	   			url:'${pageContext.request.contextPath}/project_calupdate.cal',
	   			data:jsondata,
	   			async:true,
	   			success:function(rdata){
	   				console.log('모든 데이터 저장하였습니다.');
	   				$('#title').val("");		
	   			
	   			},
	   			error:function(request,status,error){
	   				console.log('saveerror')
	   			},
	   			complete:function(){}
	   		}) 
	    }//save data끝

		 	function loadingEvents(){
			 	   
			 	   var return_value = null;
			    		$.ajax({
			    			type:'POST',
			    			url:'${pageContext.request.contextPath}/project_calendarshow.cal',
			    			dataType:"json",
			    			async:false,//  동기화
			    			success:function(result){
			    				return_value = result;
			    				console.log('이벤트 가져왔습니다.');
			    				console.log(result);
			    				console.log('다음');
			    				console.log(return_value);
			    			},
			    			error:function(request,status,error){},
			    			complete:function(){}
			    		}) 
			 	return return_value;   
			    }
			    
			    
 </script>
</head>

<body>

<div class="cal_container">
 <hr class = "calhr">
 <div id = cal_wrap>
<%-- 추후 삭제 예정 --%>
 <div id = drag_wrap>
	 <div id='external-events'>
	    <p>
	      <strong>드래그앤드롭</strong>
	    </p>
	
	    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
	      <div class='fc-event-main'>My Event 1</div>
	    </div>
	    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
	      <div class='fc-event-main'>My Event 2</div>
	    </div>
	    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
	      <div class='fc-event-main'>My Event 3</div>
	    </div>
	    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
	      <div class='fc-event-main'>My Event 4</div>
	    </div>
	    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
	      <div class='fc-event-main'>My Event 5</div>
	    </div>
	
	    <p>
	      <input type='checkbox' id='drop-remove' />
	      <label for='drop-remove'>드롭제거</label>
	    </p>
	  </div>
  </div>
  <%-- 추후 삭제 예정 --%>
    <!-- Button trigger modal -->
<button id="mobtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addevent">
  Launch demo modal
</button>

 
<!-- Modal -->
<div class="modal fade" id="addevent" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id ="saveBtn">Save changes</button>
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