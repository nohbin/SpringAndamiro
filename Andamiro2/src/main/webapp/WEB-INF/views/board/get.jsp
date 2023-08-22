<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Board List</title>
<style>
.header, .panel-heading, .flex {
	display: flex;
	justify-content: space-between;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	${cri.pageNum}
	<div class="container border mt-3 rounded-3 w-100">
		<div class="row">
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
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading pull-right">
						<b>조회수 </b>
						<c:out value="${board.readCount}" />
						| <b>추천수 </b> <span id="recommendCount"><c:out
								value="${board.recommendCount}" /></span>
						<hr>
					</div>
					<div class="panel-body">

						<div class="form-group">
							<label>No.</label> <input class="form-control" name="bno"
								value="<c:out value='${board.bno}'/>" readonly="readonly">
						</div>
						<div class="form-group">
							<label>Title</label> <input class="form-control" name="title"
								value="<c:out value='${board.title}'/>" readonly="readonly">
						</div>

						<div class="form-group">
							<label>Content</label>
							<textarea class="form-control" rows="10" name="content"
								readonly="readonly"><c:out value='${board.content}' /></textarea>
						</div>

						<div class="form-group">
							<label>Writer</label> <input class="form-control" name="writer"
								value="<c:out value='${board.writer}'/>" readonly="readonly">
						</div>

						<div class="form-group">
							<label>등록일</label> <input class="form-control" name="regDate"
								value="<fmt:formatDate pattern="yyyy-MM-dd" value='${board.regDate}'/>"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label>수정일</label> <input class="form-control" name="modDate"
								value="<fmt:formatDate pattern="yyyy-MM-dd" value='${board.modDate}'/>"
								readonly="readonly">
						</div>

						<br>
						<!-- 데이타오퍼? 제이쿼리에서 사용되는 변수명이다아아아앙아아아아아앙 -->
						<button data-oper="modify" class="btn btn-info mb-10">수정</button>
						<button data-oper="list" class="btn btn-info mb-10">목록</button>
						<button data-oper="recommend" class="btn btn-danger">
							<img src="/resources/img/recommend.png" height="28px">
						</button>
					</div>
					<!-- /.panel-body -->
					<form id='operForm' action="/board/modify" method='get'>
						<input type='hidden' id="bno" name='bno' value='<c:out value="${board.bno}"	 />'> 
						<input type='hidden' name='type' value='<c:out value="${cri.type}"   />'>
						<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'> 
						<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
						<input type='hidden' name='amount' value='<c:out value="${cri.amount}" />'> 
						<input type='hidden' name='cno' value='<c:out value="${cri.cno}"/>' />
					</form>
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
	<div class="container border mt-3 rounded-3 w-100">
		<div class="row">
			<div class="col-lg-12">
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i>
						<button id="addReplyBtn" class='btn btn-primary btn-xs pull-right mt-10 mb-10'>댓글달기</button>
					</div>
					<div class="panel-body">
						<ul class="chat">
							<li class="left clearfix" data-rno="60">	
								<div>		
									<div class="header">			
										<strong class="primary-font">good!</strong>			
										<button value="60" class="btn btn-outline-secondary" onclick="replyUp(event);"><img src="/resources/img/recommend.png" height="20px"> &nbsp;<span value="60">1<span></span></span></button>
									</div>		
									<p>글 좋습니다.</p>		
									<p class="flex"><small class="text-muted">16:39:52 | <a>덧글</a></small>	</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- 댓글 모달창!!! -->

	<div class="modal fade" id="myModal" tagindex="-1" role="dialog"
		aria-labelledby="myModalLabel" area-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Replyer</label> <input class="form-control" name="replyer"
							value="a replyer!!!"></input>
					</div>
					<div class="form-group">
						<label>Reply</label> <input class="form-control" name="reply"
							value="New Reply!!!!"></input>
					</div>
					<div class="form-group">
						<label>Reply Date</label> <input class="form-control"
							name="replyDate" value=""></input>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="modalModifyBtn" class="btn btn-warning">수정</button>
					<button type="button" id="modalRemoveBtn" class="btn btn-danger">삭제</button>
					<button type="button" id="modalRegisterBtn" class="btn btn-default">등록</button>
					<button type="button" id="modalCloseBtn" class="btn btn-default">닫기</button>
				</div>
			</div>
		</div>
	</div>


<script>

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
function recommend(bno, callback, error) {
	$.ajax({
		type : 'put',
		async: false,
		url : '/board/recommend/'+bno,
		contentType : "application/json; charset=utf-8",
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function(result, status, xhr) {
			if (callback) {
				callback(result);
			}
		},
		error : function(xhr, status, er) {
			if (error) {
				error(er);
			}
		}
	});
}
function replyUp(event) {
	event.stopPropagation();
	var rnoValue = event.currentTarget.value; // 자식 요소를 클릭해도 이벤트가 달린 요소를 타깃으로 한다.
	console.log(event.currentTarget);
	replyService.recommendReply(rnoValue
			, function(result){
				alert("추천하셨습니다.");
				$('span[value="'+ rnoValue + '"]').html(result);
			}, function(er) {
				console.log("왜 때문에 되다 안되다 하는거지요?"); // rnoValue를 못 받아오는 문제였다. 알고보니 버튼 안의 스팬태그가 클릭되는 경우 안됐었으
			}
	);
}
var replyService = (function() {
	function add(reply, callback, error) {
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function getList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
				function(data) {
					if(callback) {
						console.log(data);
						callback(data.replyCount, data.list);
					}
		}).fail (function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	function remove(rno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			dataType : 'text', /////이게 필요했다~!!!
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});   /* 여기에 세미콜론을 빠뜨렸더니 replyService.update가 호출불가였다.  */
	}
	function update(reply, callback, error) {
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	function recommendReply(rno, callback, error) {
		$.ajax({
			type : 'put',
			async: false,
			url : '/replies/recommend/'+rno,
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	function get(rno, callback, error) {
		$.get("/replies/" + rno + ".json", function(result) {
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	function displayTime(timeValue) {
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		if(gap < (1000*60*60*24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			return [(hh>9?'':'0')+hh, ':', (mi>9?'':'0')+mi, ':', (ss>9?'':'0')+ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();
			return [yy, '/', (mm>9?'':'0') + mm, (dd>9?'':'0') + dd].join('');
		}
	}

	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		recommendReply : recommendReply,
		get : get,
		displayTime : displayTime
	};
})();


	/////////////////////////////////////////////////////////////////////
	$(document).ready(function() {

		
		
		var bnoValue = '<c:out value="${board.bno}"/>';
		var replyUL = $(".chat");
				
		var pageNum = 1; // reply pagenation
		var replyPageFooter = $('.panel-footer');
		
		var modal = $('.modal');
		var modalInputReply = modal.find('input[name="reply"]');
		var modalInputReplyer = modal.find('input[name="replyer"]');
		var modalInputReplyDate = modal.find('input[name="replyDate"]'); 
		var modalModifyBtn = $('#modalModifyBtn');
		var modalRemoveBtn = $('#modalRemoveBtn');
		var modalRegisterBtn = $('#modalRegisterBtn');
		var modalCloseBtn = $('#modalCloseBtn');
		
		showList(1);
		
		

		
		
		function showReplyPage(replyCount) {
	
			var endNum = Math.ceil(pageNum / 10.0)*10;
			var startNum = endNum -9;
			
			var prev = startNum != 1;
			var next = false;
			if(endNum * 10 >= replyCount) {
				endNum = Math.ceil(replyCount/10.0);
			}
			if(endNum * 10 < replyCount) {
				next = true;
			}
			
			var str = "<ul class='pagination pull-right'>";
			if(prev){
				str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
			}
			for(var i = startNum; i <= endNum; i++) {
				var active = pageNum == i? "active" : "";
				str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
			}
			if(next) {
				str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
			}
			str += "</ul></div>";
			replyPageFooter.html(str);
		}	
		
		replyPageFooter.on("click", "li a", function(e) {
			e.preventDefault();
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			showList(pageNum);
		});
		
		function showList(page) {
			replyService.getList({bno:bnoValue, page:page||1}, function(replyCount, list) {
				if(page == -1) {
					pageNum = Math.ceil(replyCount/10.0);
					showList(pageNum);
					return;
				}
				var str="";
				if(list==null || list.length ==0) {
					replyUL.html("");
					return;
				}
				for (var i = 0, len = list.length || 0 ; i<len; i++) {
					str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
					str += "	<div>";
					str += "		<div class='header'>";
					str += "			<strong class='primary-font'>" + list[i].replyer + "</strong>";
					str += "			<button value='" + list[i].rno + "' class='btn btn-outline-secondary' onclick='replyUp(event);'><img src='/resources/img/recommend.png' height='20px'> &nbsp;<span value='" + list[i].rno + "'>" + list[i].recommendCount + "<span></button></div>";
					str += "		<p>" + list[i].reply + "</p>";
					str += "		<p class='flex'>";
					str += "			<small class='text-muted'>" + replyService.displayTime(list[i].replyDate) + " | <a>덧글</a></small>";
// 					str += "			<button class='btn btn-outline-secondary'><img src='/resources/img/rereply.png' height='15px'></button></p>";			
					str += "	</div>";
					str += "</li><hr>";
				}
				replyUL.html(str);
				showReplyPage(replyCount); //추가됨
			}); //end function
		}//end showList
		
		$('#addReplyBtn').on("click", function(e){
			modal.find('input').val('');
			modalInputReplyDate.closest('div').hide();
			modal.find('button[id != "modalCloseBtn"]').hide();
			modalRegisterBtn.show();
			$('.modal').modal('show');
		});	
		


		$('.chat').on('click', 'li', function(e) {
			var rno = $(this).data('rno');
			replyService.get(rno, function(reply){
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
				
				modal.data("rno", reply.rno);
				modal.find('button[id != "modalCloseBtn"]').hide();
				modalModifyBtn.show();
				modalRemoveBtn.show();
				
				$('.modal').modal('show');
			});
		});

		modalRegisterBtn.on("click", function(e) {
			var reply = {
					reply: modalInputReply.val(),
					replyer: modalInputReplyer.val(),
					bno: bnoValue
			};
			replyService.add(reply, function(result) {
				alert(result);
				modal.find('input').val('');
				modal.modal('hide');
// 				showList(1);
				showList(-1);
			});
		});
		

		modalModifyBtn.on("click", function(e){
			var reply = {rno: modal.data("rno"), reply: modalInputReply.val(), replyer: modalInputReplyer.val()};
			replyService.update(reply, function(result) {
				alert(result);
				modal.modal("hide");
// 				showList(1);
				showList(pageNum);
			});
		});
		
		modalRemoveBtn.on("click", function(e){
			var rno = modal.data("rno");
			replyService.remove(rno, function(result) {
				alert(result);
				modal.modal("hide");
// 				showList(1);
				showList(pageNum);
			});
		});
		modalCloseBtn.on("click", function(e){
			modal.modal("hide");
		});
	
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/board/modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list").submit();
		});
		
		$('button[data-oper="recommend"]').on('click', function(e) {
			recommend(bnoValue
				, function(result){
					alert("추천하셨습니다.");
					$('#recommendCount').html(result);
				}, function(er) {
					console.log("진짜로 잘 모르겠다구요,....");
				}
			);
		});
	});



</script>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>