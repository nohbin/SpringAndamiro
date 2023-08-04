<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.pagination {
	text-align: center;
}

.pagination li {
	border: 1px solid rgba(100, 100, 100, 0.3);
	padding: 0px 8px;
	margin: 0px 3px;
}

.pagination li.active {
	background-color: rgba(100, 100, 100, 0.3);
}
.board-wrapper {
	display: flex;
	justify-content: space-around;
}
.board {

}
.clear {
	clear: both;
}
.boardMenu {
	padding: 2px;
	margin: 2px;
}
.boardMenu>li>a {
	
}

.boardMenu>li>a {
	
}
.boardMenu>li>a>img {
	height: 1.5em;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Board List</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
<%-- 	${pageMaker.cri.pageNum} --%>
<div class="container border mt-3 mb-3 rounded-3 w-100 clearfix " id="board-wrapper" style="width: 100%;">
	<div class="col container border mt-3 mb-3 rounded-3 w-20 board clearfix" style="width: 19%;float: left;height:100%;">
		<ul class="boardMenu">
			<li data-kind="free"><a data-kind="free" href="/board/list/01"><img src="/resources/img/board3.png"> 자유 게시판</a></li>
			<li data-kind="question"><a data-kind="question" href="/board/list/02"><img src="/resources/img/board3.png"> 질문 게시판</a></li>
			<li data-kind="pairing"><a data-kind="pairing" href="/board/list/03"><img src="/resources/img/board3.png"> 페어링 이야기</a></li>
			<li data-kind="restaurant"><a data-kind="restaurant" href="/board/list/04"><img src="/resources/img/board3.png"> 식당 이야기</a></li>
			<li data-kind="ingredient"><a data-kind="ingredient" href="/board/list/05"><img src="/resources/img/board3.png"> 식재료 이야기</a></li>
		</ul>		
	</div>
	<div class="col container border mt-3 rounded-3 w-70 board clearfix" style="width: 80%;float: right;">
		<div class="row">
			<div class="col-lg-12">

			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading row mb-40">
						<div class="col col-11 d-inline float-left mt-3 mb-3"><h1 class="page-header float-left">자유게시판</h1></div>
						<div class="col d-inline float-right" style="width:70px; padding:3px;"><button type="button" id="regBtn" class="btn btn-outline-secondary btn-xs float-right mt-3 ml-10">글쓰기</button></div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body m">
						<table class="table table-sm table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>수정일</th>
									<th>조회수</th>
									<th>추천수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="board">
									<tr class="odd gradeX">
										<td><c:out value="${board.bno}" /></td>
										<td><a class="move" href='<c:out value="${board.bno}"/>'>
												<%-- 										<a class="move" href='/board/get?bno=${board.bno}'> --%>
												<c:out value="${board.title}" /> <b>[<c:out
														value="${board.replyCount}" />]
											</b>
										</a></td>
										<td><c:out value="${board.writer}" /></td>
										<td class="center"><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.regDate}" /></td>
										<td class="center"><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.modDate}" /></td>
										<td><c:out value="${board.readCount}" /></td>
										<td><c:out value="${board.recommendCount}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class='row'>
							<div class="col-lg-12">
								<form id='searchForm' action="/board/list" method='get'>
									<select name='type'>
										<option value=""
											<c:out value="${pageMaker.cri.type == null ? selected : ''}"/>>--</option>
										<option value="T"
											<c:out value="${pageMaker.cri.type eq 'T'? selected : ''}"/>>제목</option>
										<option value="C"
											<c:out value="${pageMaker.cri.type eq 'C'? selected : ''}"/>>내용</option>
										<option value="W"
											<c:out value="${pageMaker.cri.type eq 'W'? selected : ''}"/>>작성자</option>
										<option value="TC"
											<c:out value="${pageMaker.cri.type eq 'TC'? selected : ''}"/>>제목
											or 내용</option>
										<option value="TW"
											<c:out value="${pageMaker.cri.type eq 'TW'? selected :  ''}"/>>제목
											or 작성자</option>
										<option value="TWC"
											<c:out value="${pageMaker.cri.type eq 'TWC'? selected : ''}"/>>제목
											or 내용 or 작성자</option>
									</select> <input type='text' name='keyword'
										value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
										type='hidden' name='pageNum'
										value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
										type='hidden' name='amount'
										value='<c:out value="${pageMaker.cri.amount}"/>' />
									<button type="button" class='btn btn-default'>Search</button>
								</form>
							</div>
						</div>
						<%-- 				<h3>${pageMaker}</h3>  --%>
						<div class='pull-right'>
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="paginate_button previous" btn btn-secondary btn-sm><a
										href="${pageMaker.startPage-1}">Previous</a></li>
								</c:if>
								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li
										class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
										<a href="${num}">${num}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next}">
									<li class="paginate_button next"><a
										href="${pageMaker.endPage+1}">Next</a></li>
								</c:if>
							</ul>
							<!--  end Pagination -->

							<form id='actionForm' action="/board/list" method='get'>
								<input type='hidden' name='type'
									value='<c:out value="${pageMaker.cri.type}"/>' /> <input
									type='hidden' name='keyword'
									value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
									type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount'
									value='${pageMaker.cri.amount}'>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clear">&nbsp;</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">완료</h4>
				</div>
				<div class="modal-body">처리가 완료되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<!--  <button type="button" class="btn btn-primary">Save changes</button>-->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

<script>
		$(document).ready(function() {
			/* aside menu */
// 			$('.boardMenu').on('click', 'li', function(event) {
// 				var boardkind = $(this).data('kind');
// 				});
// 			});
			
		
		
		
		
			var actionForm = $("#actionForm");
			
			$(".move").on("click",function(e) {
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
				actionForm.attr("action","/board/get").submit();
			});

			$(".paginate_button a").on("click",function(e) {
				e.preventDefault(); //기본 동작 제한      
				console.log('click');//<form>태그의 내용 변경후 submit
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});

			
			
			
			
			var result = '<c:out value="${result}"/>';
			checkModal(result);
			history.replaceState({}, null, null); // 히스토리는 브라우저의 내장객체! 브라우저의 방문 기록을 널값으로 비우라는 뜻이당.

			function checkModal(result) {
				if (result === '' || history.state) {
					return;
				}
				if (parseInt(result) > 0) {
					$('.modal-body').html(
							result + "번 게시글이 등록되었습니다.");
				}
				$('#myModal').modal('show');
			}
	
			
			
			$('#regBtn').on('click', function() {
				self.location = '/board/register';
			});

			
			
			
			
			var searchForm = $('#searchForm');

			$('#searchForm button').on('click', function(evt) {
				if (!searchForm.find('option:selected').val()) {
					alert('검색종류를 선택하세요.');
					return false;
				}
				if (!searchForm.find('input[name="keyword"]').val()) {
					alert('키워드를 입력하세요.');
					return false;
				}
				searchForm.find('input[name="pageNum"]').val(1); // 검색 결과에 대해서 1페이지로 가야 함.
				evt.preventDefault();
				searchForm.submit();
			});
		});
	</script>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>