<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
	<title> Board List </title>
	<style>
.uploadResult {
	width: 100%;
	background-color: rgba(210, 124, 125, .3);
}
.uploadResult ul {
/* 	justify-content: center; */
}
.uploadResult ul li{
	list-style: none;
	padding: 10px;
	line-height: 30px;
	font-size: 15px;
	align-items: center;
}
.uploadResult ul li a{
	text-decoration: none;
	color: black;
}
.uploadResult ul li img{
	height: 70px;
}

.bicPictureWrapper {
	display: none;				z-index: 100;
	position: absolute; 		top: 0%;
	justify-content: center;	align-items: center;
	width: 100%; 				height: 100%;
	background: rgba(100,100,100, 0.5);
}
.bicPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="container border mt-3 rounded-3 w-50">
		<div class="col col-11 d-inline float-left mt-3 mb-3">
				<h1 class="page-header float-left">
					<c:choose>
						<c:when test="${cri.cno == 01}">자유 게시판</c:when>
						<c:when test="${cri.cno == 02}">질문 게시판</c:when>
						<c:when test="${cri.cno == 03}">페어링 이야기</c:when>
						<c:when test="${cri.cno == 04}">식당 이야기</c:when>
						<c:when test="${cri.cno == 05}">식재료 이야기</c:when>

					</c:choose>
				</h1>
			</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading"><small>게시판 매너를 준수합시다.</small></div>
					<div class="panel-body">
						<form role="form" action="/board/register" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type='hidden' name='type' value='<c:out value="${cri.type}"   />'>
							<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'> 
							<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
							<input type='hidden' name='amount' value='<c:out value="${cri.amount}" />'> 
							<input type='hidden' name='cno' value='<c:out value="${cri.cno}"/>' />
							<div class="form-group">
								<label>Title</label> <input class="form-control" name="title" placeholder="제목">
							</div>

							<div class="form-group">
								<label>Content</label>
								<textarea class="form-control" rows="10" name="content" placeholder="내용"></textarea>
							</div>

							<div class="form-group">
								<label>Writer</label> <input class="form-control" name="writer" placeholder="작성자">
							</div>

							<br>
							<button type="submit" class="btn btn-outline-secondary btn-xs mb-10">Submit</button>
							<button type="reset" class="btn btn-outline-secondary btn-xs mb-10">Reset</button>
						</form>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

<!-- 		<div class="row"> -->
<!-- 			<div class="col-lg-12"> -->
<!-- 				<div class="panel panel-default"> -->
<!-- 					<div class="panel-heading">File Attach</div> -->
<!-- 					<div class="panel-body"> -->
<!-- 						<div class="form-group uploadDiv"> -->
<!-- 							<input type="file" name="uploadFile" multiple> -->
<!-- 						</div> -->
<!-- 						<div class="uploadResult"> -->
<!-- 							<ul> -->

<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	<script>
	$(document).ready(function(e) {
		/**/
		var formObj = $('form[role="form"]');
// 		$('button[type="submit"]').on('click', function(e) {
// 			e.preventDefault();
// 			console.log("submit clicked");
// 			var str="";
// 			$('.uploadResult ul li').each(function(i, obj) {
// 				var jobj = $(obj);
// 				console.dir(jobj);
// 				str += "<input type='hidden' name='attachList[" + i + "].fileName' 		value='" + jobj.data("filename") + "'>";				
// 				str += "<input type='hidden' name='attachList[" + i + "].uuid' 			value='" + jobj.data("uuid")	 + "'>";				
// 				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' 	value='" + jobj.data("path")	 + "'>";				
// 				str += "<input type='hidden' name='attachList[" + i + "].fileType' 		value='" + jobj.data("type")	 + "'>";				
// 			});
// 				formObj.append(str).submit();
// 		});
		
		/* 파일 업로드 */  
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert('파일 사이즈 초과');
				return false;
			}
			if(regex.test(fileName)) {
				alert('해당 종류의 파일은 업로드할 수 없습니다.');
				return false;
			}
			return true;
		}
		
		/* <input type="file">의 내용 변경을 감지하여 바로 서버에 업로드해버린다. */
		$('input[type="file"]').change(function(e) {
			var formData = new FormData();
			var inputFile = $('input[name="uploadFile"]');
			var files = inputFile[0].files;
			for(var i = 0; i < files.length; i++) {
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append('uploadFile', files[i]);
			}
			$.ajax({
				url: '/uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData, 
				type: 'POST',
				dataType: 'json',
				success: function(result) {
					console.log(result);
					showUploadResult(result); //업로드 결과 처리 함수
				}
				
				
			});
			
		});
		
		$('.uploadResult').on('click', 'button', function(e){ 
			console.log("delete file");
			var targetFile = $(this).data('file');
			var type 	   = $(this).data('type');
			var targetLi   = $(this).closest('li');
			$.ajax({
				url: '/deleteFile',
				data: {fileName: targetFile, type: type},
				dataType: 'text',
				type: 'POST',
				success: function(result) {
					alert(result);
					targetLi.remove();
				}
			});
		});
	});
	
	function showUploadResult(uploadResultArr) {
		if(!uploadResultArr || uploadResultArr.length == 0) {return;}
		var uploadUL = $('.uploadResult ul');
		var str = "";
		$(uploadResultArr).each(function(i, obj) {
			if(obj.image) {
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>";
				str += "<span> " + obj.fileName + "</span> &nbsp;";
				str += "<button type='button' data-file='" + fileCallPath + "' data-type='image' class='btn btn-warning btn-circle'>";
				str += "<i class='fa fa-times'></i></button><br>";
				str += "<img src='/display?fileName=" + fileCallPath + "'>";
				str += "</div></li>";
			}
			else {
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>";
				str += "<span> " + obj.fileName + "</span> &nbsp;";
				str += "<button type='button' data-file='" + fileCallPath + "' data-type='file' class='btn btn-warning btn-circle'>";
				str += "<i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'>";
				str += "</div></li>";
			}
		});
		uploadUL.append(str);
	}
</script>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>