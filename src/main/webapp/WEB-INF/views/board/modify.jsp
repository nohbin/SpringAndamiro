<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
	<title> Board List </title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
${cri.pageNum}
<div class="container border mt-3 rounded-3 w-50">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Free Board</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">매너를 지켜주세요!!!</div>
			<div class="panel-body">
				<form role="form" action="/board/modify" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type='hidden' name='type' value='<c:out value="${cri.type}"/>' /> 
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>' /> 
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='cno' value='<c:out value="${cri.cno}"/>' />
					
					<div class="form-group">
						<label>No.</label> 
						<input class="form-control" name="bno" value="<c:out value='${board.bno}'/>" readonly="readonly">
					</div>
					<div class="form-group">
						<label>Title</label> 
						<input class="form-control" name="title" value="<c:out value='${board.title}'/>">
					</div>

					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" rows="10" name="content"><c:out value='${board.content}' /></textarea>
					</div>

					<div class="form-group">
						<label>Writer</label> 
						<input class="form-control" name="writer" value="<c:out value='${board.writer}'/>">
					</div>

					<div class="form-group">
						<label>등록일</label>
						<fmt:formatDate pattern="yyyy-MM-dd" value='${board.regDate}' />
						&nbsp;&nbsp;|&nbsp;&nbsp; <label>수정일</label>
						<fmt:formatDate pattern="yyyy-MM-dd" value='${board.modDate}' />
					</div>

					<br>
					<!-- 데이타오퍼? 제이쿼리에서 사용되는 변수명이다아아아앙아아아아아앙 -->
					<button type="submit" data-oper="modify" class="btn btn-info">Modify</button>
					<button type="submit" data-oper="remove" class="btn btn-danger">Delete</button>
					<button type="submit" data-oper="list" class="btn btn-info pull-right">List</button>
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
</div>
<script>
	$(document).ready(function() {
		var formObj = $("form");
		$('button').on("click", function(e) {
			e.preventDefault(); // 기본 처리를 무시한다.
			var operation = $(this).data("oper");
			console.log(operation);
			
			if (operation === 'remove') {
				formObj.attr("action", "/board/remove").attr("method", "post");
			} else if (operation === 'list') {
				formObj.attr("action", "/board/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(typeTag);
				formObj.append(keywordTag);
			}
			formObj.submit();
		});
	});
</script>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>