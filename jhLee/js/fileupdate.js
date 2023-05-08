$(document).ready(function(){
	
	$('#summernote').val();
	  $('#summernote').summernote({
	        placeholder: '내용을 입력하세요',
	        tabsize: 2,
	        lang : "ko-KR",
	        height: 300
	      });
	      
	      
	let check = 0;
	let check2 =0;
	
	
	//submit 버튼 클릭할 때 이벤트 부분
	$("form[name=modifyform]").submit(function(){
		if($.trim($("#board_subject").val())==""){
			alert("제목을 입력하세요");
			$("#board_subject").focus();
			return false;
		}
		
		if($.trim($("#fileboard_pass").val())==""){
			alert("비밀번호를 입력하세요");
			$("board_pass").focus();
			return false;	
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
		
			if(check ==0){
				const value =$('#filevalue').text();
				const html = "<input type='hidden' value='"+value+"' name ='check'>";
				console.log(html);
				$(this).append(html);}
				
				
			if(check2 ==0){
				const value2 =$('#filevalue2').text();
				const html2 = "<input type='hidden' value='"+value2+"' name ='check2'>";
				console.log(html2);
				$(this).append(html2);}
			
				})	//submit끝
	
	
	
	      


	$('#deptbutton+div a').click(function(){
			const dept =$(this).text();
				console.log(dept)
			const sel =$('#deptsel').text();
			
		$('#deptsel').text(dept);
			console.log(sel)
		
			
		$('#dept').val(dept);
			console.log($('#dept').val())			
	
	})//drop downclick 끝
	
	
function show(){
		//파일이름이 있는 경우 remove이미지를 보이게 하고
		//파일이름이 없는 경우 remove 이미지를 보이지 않게 합니다.
		
		if($("#filevalue").text()==''){
			$('.remove1').css('display','none');
		}else{
			$(".remove1").css({'display':'inline-block',
							'position':'relative','top':'-5px'});
			
		}
		if($("#filevalue2").text()==''){
			$('.remove2').css('display','none');
		}else{
			$(".remove2").css({'display':'inline-block',
							'position':'relative','top':'-5px'});
		}
	}//show end
	show();
	
	
$("#upfile").change(function(){
	check++
	console.log($(this).val())
	const inputfile = $(this).val().split('\\');//c:\facepath\upload.png
	$('#filevalue').text(inputfile[inputfile.length -1]);
	$('.file2').css('display','block');
	show();
	
	});
	
	
$("#upfile2").change(function(){
	check2++
	console.log($(this).val())
	const inputfile2 = $(this).val().split('\\');//c:\facepath\upload.png
	$('#filevalue2').text(inputfile2[inputfile2.length -1]);
	show();
	});
	

	
	
				
				
				
		$(".remove1").click(function(){
			
		$('#filevalue').text('');
		$(this).css('display','none');
		
		
		
	})
		$(".remove2").click(function(){
		$('#filevalue2').text('');
		$(this).css('display','none');
		
	})

	
})//ready끝