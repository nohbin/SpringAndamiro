<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<title>Home</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script>
	var token = $("meta[name='_csrf']").attr('content');
    var header = $("meta[name='_csrf_header']").attr('content');
	$(function(){
	    if(token && header) {
	        $(document).ajaxSend(function(event, xhr, options) {
	            xhr.setRequestHeader(header, token);
	        });
	    }
		fetchCategories();
		
		 
	})
	
	 function fetchCategories() {
        $.ajax({
            url: '/api/getCategories', 
            type: 'post',
            dataType: 'json',
//             contentType: 'application/json; charset=utf-8',
//             beforeSend : function(xhr){
//                 xhr.setRequestHeader(header, token);
//             },
            success: function (data) {
            	// mainIngreList 배열에서 개별 데이터 접근
            	var mainIngreList = data.mainIngreList;
            	mainIngreList.forEach(function(item) {
            	    console.log(item.recipeIngreId); // 돼지고기, 소고기, 닭고기 등의 recipeIngreId 값 출력
            	    console.log(item.recipeIngre);   // 돼지고기, 소고기, 닭고기 등의 recipeIngre 값 출력
            	});

            	// kindList 배열에서 개별 데이터 접근
            	var kindList = data.kindList;
            	kindList.forEach(function(item) {
            	    console.log(item.recipeKindId); // 한식, 일식, 양식 등의 recipeKindId 값 출력
            	    console.log(item.recipeKind);   // 한식, 일식, 양식 등의 recipeKind 값 출력
            	});

            	// howList 배열에서 개별 데이터 접근
            	var howList = data.howList;
            	howList.forEach(function(item) {
            	    console.log(item.recipeHowId); // 볶음, 튀김, 삶기 등의 recipeHowId 값 출력
            	    console.log(item.recipeHow);   // 볶음, 튀김, 삶기 등의 recipeHow 값 출력
            	});
            	
            },
            error: function (xhr, status, error) {
                // 에러 처리
                alert("데이터 안불러와지는중");
            }
        });
    }
	
</script>
<body>
<h1>
	Hello world!  
</h1>

<P> dd </P>
</body>
</html>
