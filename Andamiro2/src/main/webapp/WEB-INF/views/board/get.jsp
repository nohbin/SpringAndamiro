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
			<div class="panel-heading pull-right"><b>조회수 </b> <c:out value="${board.readCount}" /> | <b>추천수 </b> <span id="recommendCount"><c:out value="${board.recommendCount}" /></span> <hr></div>
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
					<label>수정일</label> <input class="form-control" name="modDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value='${board.modDate}'/>" readonly="readonly">
				</div>

				<br>
				<!-- 데이타오퍼? 제이쿼리에서 사용되는 변수명이다아아아앙아아아아아앙 -->
				<button data-oper="modify" class="btn btn-info"> Modify </button>
				<button data-oper="list" class="btn btn-info"> List </button>
				<button data-oper="recommend" class="btn btn-danger"><img src="/resources/img/recommend.png" height="30px"></button>
			</div>
			<!-- /.panel-body -->
			<form id='operForm' action="/board/modify" method='get'>
				<input type='hidden' id="bno" name='bno' 	 value='<c:out value="${board.bno}"	 />' > 
				<input type='hidden' 		  name='type' 	 value='<c:out value="${cri.type}"   />' > 
				<input type='hidden' 		  name='keyword' value='<c:out value="${cri.keyword}"/>' > 
				<input type='hidden' 		  name='pageNum' value='<c:out value="${cri.pageNum}"/>' > 
				<input type='hidden' 		  name='amount'  value='<c:out value="${cri.amount}" />' >
			</form>
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<div class="row">
<hr>
	<div class="col-lg-12">
		<!-- /.panel -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id="addReplyBtn" class='btn btn-primary btn-xs pull-right'>New Reply</button>
			</div>
			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno="12">
						<div>
							<div class="header">
								<strong class="primart-font">user00</strong>
								<small class="pull-right text-muted">2018-01-01 13:13</small>
							</div>
						<p>Good job!</p>
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

<div class="modal fade" id="myModal" tagindex="-1" role="dialog" aria-labelledby="myModalLabel" area-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label>		<input class="form-control" name="reply" value="New Reply!!!!"></input>
				</div>
				<div class="form-group">
					<label>Replyer</label>		<input class="form-control" name="replyer" value="a replyer!!!"></input>
				</div>
				<div class="form-group">
					<label>Reply Date</label>	<input class="form-control" name="replyDate" value=""></input>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="modalModifyBtn" class="btn btn-warning">Modify</button>
				<button type="button" id="modalRemoveBtn" class="btn btn-danger">Remove</button>
				<button type="button" id="modalRegisterBtn" class="btn btn-default">Register</button>
				<button type="button" id="modalCloseBtn" class="btn btn-default">Close</button>
			</div>
		</div>
	</div>
</div>



<script>

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
console.log(token + "/" + header);
var replyService = (function() {
	function add(reply, callback, error) {
		// console.log("add reply..................");
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
		get : get,
		displayTime : displayTime
	};// add라는 이름의 속성으로 값은 add라는 function을 가지는 replyService객체가 된다.!!
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
		
		showList(1);
		
		
		
		
		
		function showReplyPage(replyCount) {
			console.log("pageNum : " + pageNum);
			console.log("replyCount : " + replyCount);
			
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
			console.log("page click");
			var targetPageNum = $(this).attr("href");
			console.log("targetPageNum: " + targetPageNum);
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
					str += "	<div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
					str += "			<small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
					str += "		<p>" + list[i].reply + "</p></div></li>";
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
			console.log(rno); // 각각의 댓글(각각의 li)을 클릭했을 때 콘솔창에 rno번호를 뿌린다.
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
	
		
	});

function recommend(bno, callback, error) {
	$.ajax({
		type : 'put',
		url : '/board/recommend/'+bno,
		data : JSON.stringify(board),
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
function refreshRecommendCount() {
	var bno = param.bno;
	$.getJSON("/board/get?bno=" + bno + ".json", function(data) {
				if(callback) { callback(data.recommendCount); }
	}).fail (function(xhr, status, err) {
		if(error) { error(); }
	});
}
				
	//////////////////////////////////////////////////////////////////////
	$(document).ready(function() {
		var bnoValue = '${board.bno}';
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
					alert(result);
					var newRecommendCount = refreshRecommendCount();
					$('#recommendCount').html(newRecommendCount);
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