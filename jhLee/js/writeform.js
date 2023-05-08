$(document).ready(function(){
	
	  $('#summernote').summernote({
	        placeholder: '내용을 입력하세요',
	        tabsize: 2,
	        lang : "ko-KR",
	        height: 300
	      });

	$('#deptbutton+div a').click(function(){
			const dept =$(this).text();
				console.log(dept)
			const sel =$('#deptsel').text();
			
		$('#deptsel').text(dept);
			console.log(sel)
		
			
		$('#dept').val(dept);
			console.log($('#dept').val())			
	
	})//drop downclick 끝
	
	

$("#upfile").change(function(){
	console.log($(this).val())
	const inputfile = $(this).val().split('\\');//c:\facepath\upload.png
	$('#filevalue').text(inputfile[inputfile.length -1]);
	$('.file2').css('display','block');
	});
$("#upfile2").change(function(){
	console.log($(this).val())
	const inputfile2 = $(this).val().split('\\');//c:\facepath\upload.png
	$('#filevalue2').text(inputfile2[inputfile2.length -1]);
	});
	
	
	//submit 버튼 클릭할 때 이벤트 부분
	$("form[name=fileboardform]").submit(function(){
		if($.trim($("#board_subject").val())==""){
			alert("제목을 입력하세요");
			$("#board_subject").focus();
			return false;
		}
		
		if($.trim($("#fileboard_pass").val())==""){
			alert("비밀번호를 입력하세요");
			$("board_pass").focus();
			return false;	
			}else{
			if(!$.isNumeric($("#fileboard_pass").val())){
				alert("비밀번호는 숫자로 입력해 주세요");
				$("#board_pass").val('').focus();
			return false;
			}
		}
			
			
			const name=$.trim($("#board_name").val());
			
		if($.trim($("#board_name").val())==""){
			alert("이름를 입력하세요");
			$("board_name").focus();
			return false;	
			}
			
		if(name.length >10){
			alert("이름의 최대 길이는 10글자입니다");
			$("board_name").focus();
			return false;
		}
		
		if($('#deptsel').text()== "부서"){
			alert("부서를 선택하세요")
			return false;
			
		} 
		
		if($.trim($("#summernote").val())==""){
			alert("내용을 입력하세요");
			$("#board_content").focus();
			return false;
		}
		if($.trim($("#filevalue").text())==""){
			alert("자료게시판입니다. 자료를 하나 이상 추가해주세요");
			return false;
		}
		
		
		
	})	//submit끝
	
})//ready끝