<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:if test="${empty simple}">
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
</c:if>
	<div class="accordion" id="accordionExample">
		<div class="card">
			<div class="card-header" id="headingOne" style="padding-top: 4px; padding-bottom:4px; overflow:hidden; border-bottom:solid 1px #CCCCC;">
				<div class="mb-0" style="display:flex;justify-content: space-between; ">
					<h5 class="d-flex" style="align-items: center; margin:0;">
						공지사항 상세
					</h5>
					<button class="btn btn-link text-right" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="height:38px; width: 38px;">
						<i class="fa fa-angle-down"></i>
					</button>
				</div>
			</div>
			<div class="cnt_wr">
				<div class="row">
					<div class="col-sm-12">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="15%" />
											<col width="35%" />
											<col width="15%" />
											<col width="35%" />
										</colgroup>
										<tbody>
											<tr>
												<th>제목</th>
												<td colspan="3">
												<c:choose>
													<c:when test="${dto.userNo eq sessionScope.userNo}">
														<input type="text" class="form-control form-control-sm" id="notiTitle" name="notiTitle" value="${dto.notiTitle}">
													</c:when>
													<c:otherwise>
														<input type="text" class="form-control form-control-sm" id="notiTitle" name="notiTitle" value="${dto.notiTitle}" readonly>
													</c:otherwise>
												</c:choose>
												</td>
											</tr>
											<tr>
												<th>작성자</th>
												<td colspan="3">
													<input type="text" class="form-control form-control-sm" id="userName" data-completeSet="true" name="userName" value="${dto.userName}" readonly>
													<input type="hidden" class="form-control" name="userNo" id="userNo" value="${dto.userNo}" />
												</td>
											</tr>
											<tr>
												<th scope="row">등록일</th>
												<td colspan="3"><input type="text" class="form-control form-control-sm" id="regDatetime" name="regDatetime"
													value="${dto.regDatetime}" readonly>
												</td>
											</tr>
										</tbody>
									</table>	
								</div>
								<c:choose>
									<c:when test="${dto.userNo eq sessionScope.userNo}">
										<textarea name="notiContents" id="notiContents" rows="8" class="form-control">${dto.notiContents}</textarea>
									</c:when>
									<c:otherwise>
										<textarea name="notiContents" id="notiContents" rows="8" class="form-control" readonly>${dto.notiContents}</textarea>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="btn_wr text-right mt-3">
					<input type="hidden" id="notiNo" value ="${dto.notiNo}">
					<button class="btn btn-md btn-success f-left modal-list-btn" onClick="javascript:location.href='${path}/notice/list.do'">목록</button>
					<c:if test="${dto.userNo eq sessionScope.userNo}">
						<button class="btn btn-md btn-danger" onClick="fn_DeleteNotice()">삭제</button>
						<button class="btn btn-md btn-primary" onClick="fn_UpdateNotice()">수정</button>
						<button class="btn btn-md btn-inverse modal-list-btn" onClick="javascript:location='${path}/notice/list.do'">취소</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--영업활동등록-->

	<script type="text/javascript" src="${path}/js/image.js"></script>
	<script>
		async function fn_UpdateNotice() {
			var noticeData = {};
			noticeData.notiTitle 		= $("#notiTitle").val();
			noticeData.userNo 		= $("#userNo").val();
			noticeData.notiNo		= $("#notiNo").val();
			
			var content = tinyMCE.get("notiContents").getContent();
			if(content !== null && content !== undefined && content !== "") {
				noticeData.notiContents = await uploadImage(content, "${path}");
			} else {
				noticeData.notiContents = "";
			}

			$.ajax({
				url: "${path}/notice/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: noticeData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					var url = '${path}/notice/list.do';
					location.href = url;
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		function fn_DeleteNotice() {
			var noticeData = {};
			noticeData.notiNo = Number($("#notiNo").val());

			$.ajax({
				url: "${path}/notice/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: noticeData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					var url = '${path}/notice/list.do';
					location.href = url;
				}else{
					alert("삭제 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});

		}
		setTiny(555)
	</script>
<c:if test="${empty simple}">
</div>
<jsp:include page="../body-bottom.jsp"/>
</c:if>