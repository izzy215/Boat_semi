<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>

 <link href="${pageContext.request.contextPath}/jhLee/css/bootstrap-select.min.css" type="text/css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/jhLee/js/bootstrap-select.min.js"></script>
</head>
<body>

 <select class="selectpicker" data-style="btn-primary">
    <option>Mustard</option>
    <option>Ketchup</option>
    <option>Relish</option>
  </select>
 
 <select >
    <option>Mustard</option>
    <option>Ketchup</option>
    <option>Relish</option>
  </select>
 <script>
 $(function(){
	 
	 $('.selectpicker').selectpicker({
	      style: 'btn-info',
	      size: 4
	  });
 </script>
</body>
</html>