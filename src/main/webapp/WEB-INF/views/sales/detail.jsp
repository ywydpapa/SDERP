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
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						영업활동 상세
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

	<!--영업활동등록-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-sm bst02">
							<colgroup>
								<col width="5%"/>
								<col width="15%"/>
								<col width="5%"/>
								<col width="15%"/>
								<col width="5%"/>
								<col width="15%"/>
								<col width="5%"/>
								<col width="15%"/>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="requiredTextCss">활동일</th>
									<td colspan="3">
										<div class="input-group input-group-sm mb-0 mr-1">
											<input id="salesFrdatetime" style="width:400px" class="form-control col-xl-2" type="date" max="9999-12-30" value ="" onChange="javascript:inputDate(setDateHourMinute($('#salesFrdatetime').val(), $('#startTime').val()), setDateHourMinute($('#salesTodatetime').val(), $('#endTime').val()), this)">
											<select id="startTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#salesFrdatetime').val(), $('#startTime').val()), setDateHourMinute($('#salesTodatetime').val(), $('#endTime').val()), this)"></select>
											<span style="line-height:30px;">&nbsp;~&nbsp;</span>
											<input id="salesTodatetime" class="form-control col-xl-2" type="date" max="9999-12-31" value ="" onChange="javascript:inputDate(setDateHourMinute($('#salesFrdatetime').val(), $('#startTime').val()), setDateHourMinute($('#salesTodatetime').val(), $('#endTime').val()), this)">
											<select id="endTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#salesFrdatetime').val(), $('#startTime').val()), setDateHourMinute($('#salesTodatetime').val(), $('#endTime').val()), this)"></select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">장소</th>
									<td><input type="text" class="form-control form-control-sm" id="salesPlace" name="salesPlace" value="${dto.salesPlace}"></td>
									<th class="requiredTextCss">활동형태</th>
									<td><select name="salesType" id="salesType" class="form-control form-control-sm">
										<c:forEach var="acttype" items="${acttype}">
										<option value="${acttype.codeNo}" <c:if test="${acttype.codeNo == dto.salesType}">selected</c:if>>${acttype.desc03}</option>
										</c:forEach>
									</select></td>
									<th class="requiredTextCss">담당사원</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="userName" id="userName" data-completeSet="true" value="${dto.userName}" readonly>
											<input type="hidden" class="form-control" name="userNo" id="userNo" value="${dto.userNo}" />
										</div>
									</td>
									<th scope="row">영업기회</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<select class="form-control" id="soppTitle" name="soppTitle" onchange="autoCompleteSelect(this);">
												<option value="">선택</option>
												<c:forEach var="row" items="${listSopp}">
													<option data-no="${row.soppNo}" value="${row.soppTitle}" <c:if test="${row.soppTitle eq dto.soppTitle}">selected</c:if>>${row.soppTitle}</option>
												</c:forEach>
											</select>
											<input type="hidden" class="form-control" name="soppNo" id="soppNo" value="${dto.soppNo }" />
											<%-- <input type="text" class="form-control" name="soppTitle" id="soppTitle" value="${dto.soppTitle}"> --%>
										</div>
									</td>
								</tr>
								<tr>
									
								</tr>
								<tr>
									<th scope="row">매출처</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<select class="form-control" id="custName" name="custName" onchange="autoCompleteSelect(this);">
												<option value="">선택</option>
												<c:forEach var="row" items="${listCust}">
													<option data-no="${row.custNo}" value="${row.custName}" <c:if test="${row.custName eq dto.custName}">selected</c:if>>${row.custName}</option>
												</c:forEach>
											</select>
											<input type="hidden" name="custNo" id="custNo" value="${dto.custNo}" />
											<%-- <input type="text" class="form-control" name="custName" id="custName" value="${dto.custName}"> --%>
										</div>
									</td>
									<th scope="row">엔드유저</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<select class="form-control" id="endCustName" name="endCustName" onchange="autoCompleteSelect(this);">
												<option value="">선택</option>
												<c:forEach var="row" items="${listCust}">
													<option data-no="${row.custNo}" value="${row.custName}" <c:if test="${row.custName eq dto.ptncName}">selected</c:if>>${row.custName}</option>
												</c:forEach>
											</select>
											<input type="hidden" id="endCustNo" value="${dto.ptncNo}" />
											<%-- <input type="text" class="form-control" id="endCustName" value="${dto.ptncName}"> --%>
										</div>
									</td>
									<th scope="row" class="requiredTextCss">제목</th>
									<td colspan="3"><input type="text"
										class="form-control form-control-sm" id="salesTitle" name="salesTitle"
										value="${dto.salesTitle}"></td>
								</tr>
								<tr>
									<th scope="row">
										내용
									</th>
									<td colspan="7">
										<textarea name="salesDesc" id="salesDesc" rows="7" class="form-control form-control-sm">${dto.salesDesc}</textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="btn_wr text-right mt-3">
					<input type="hidden" id="salesNo" value ="${dto.salesNo}">
					<button class="btn btn-md btn-success f-left modal-list-btn" onClick="javascript:location.href='${path}/sales/list.do'">목록</button>
					<c:if test="${dto.userNo eq sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
						<button class="btn btn-md btn-primary" onClick="fn_UpdateSales()">수정</button>
						<button class="btn btn-md btn-danger" onClick="fn_DeleteSales()">삭제</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--//영업활동등록-->


	<script>
		$('#custModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#userModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#ptncModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#soppModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#endCustModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
    	function fnSetCustData(a, b) {
			$("#custName").val(a);
			$("#custNo").val(b);
			$(".modal-backdrop").remove();
			$("#custModal").modal("hide");
		}
    	
		function fnSetUserData(a, b) {
			$("#userNo").val(a);
			$("#userName").val(b);
			$(".modal-backdrop").remove();
			$("#userModal").modal("hide");
			
		}
		
		function fnSetPtncData(a, b) {
			$("#ptncNo").val(b);
			$("#ptncName").val(a);
			$(".modal-backdrop").remove();
			$("#ptncModal").modal("hide");
		}
		
		function fnSetSoppData(a, b) {
			$("#soppNo").val(b);
			$("#soppTitle").val(a);
			$(".modal-backdrop").remove();
			$("#soppModal").modal("hide");
		}

		function fnSetEndCustData(a, b) {
			$("#endCustNo").val(b);
			$("#endCustName").val(a);
			$(".modal-backdrop").remove();
			$("#endCustModal").modal("hide");
		}

		function fn_UpdateSales() {
			var salesData = {};
			salesData.salesNo = $("#salesNo").val();
			salesData.salesFrdatetime = setDateHourMinute($("#salesFrdatetime").val(), $("#startTime").val()); 
			salesData.salesTodatetime = setDateHourMinute($("#salesTodatetime").val(), $("#endTime").val());
			salesData.salesTitle 		= $("#salesTitle").val();
		 	salesData.salesPlace		= $("#salesPlace").val();
			salesData.userNo 		= $("#userNo").val();
			salesData.custNo 		= $("#custName").val() != "" ? Number($("#custNo").val()) : 0;
			salesData.soppNo 		= $("#soppName").val() != "" ? Number($("#soppNo").val()) : 0;
			salesData.ptncNo 		= $("#endCustName").val() != "" ? Number($("#endCustNo").val()) : 0;
			salesData.salesType 		= $("#salesType").val();
			
			if($("textarea").attr("style") === "display: none;"){
				salesData.salesDesc			= tinyMCE.get("salesDesc").getContent();
			}else{
				salesData.salesDesc 		= $("#salesDesc").val();
			}
			
			if (!salesData.salesFrdatetime){
				alert("영업활동의 시작일을 선택해 주십시오.");
				return;
			}
			else if (!salesData.salesTodatetime){
				alert("영업활동의 종료일을 선택해 주십시오.");
				return;
			}
			else if (!salesData.salesType){
				alert("활동형태를 선택해주십시오.");
				return;
			}
			else if (!salesData.userNo){
				alert("담당사원을 선택해 주십시오.");
				return;
			}else if (!salesData.salesTitle) {
				alert("영업활동 제목을 입력해 주십시오.");		
				return;
			}
			/* else if($("#soppTitle").val() !== "" && !autoCompleteVali($("#soppTitle").val(), "sopp")){
				alert("조회된 영업기회가 없습니다.\n다시 확인해 주세요.");
				$("#soppTitle").focus();
				return;
			}else if($("#custName").val() !== "" && !autoCompleteVali($("#custName").val(), "cust")){
				alert("조회된 거래처가 없습니다.\n다시 확인해주세요.");
				$("#custName").focus();
				return;
			}else if($("#endCustName").val() !== "" && !autoCompleteVali($("#endCustName").val(), "cust")){
				alert("조회된 엔드유저가 없습니다.\n다시 확인해주세요.");
				$("#endCustName").focus();
				return;
			}else if($("#soppTitle").val() !== "" && ($("#soppNo").val() === "" || $("#soppNo").val() == 0)){
				alert("영업기회를 제대로 선택해주세요.");
				$("#soppTitle").focus();
				return;
			}else if($("#custName").val() !== "" && ($("#custNo").val() === "" || $("#custNo").val() == 0)){
				alert("매출처를 제대로 선택해주세요.");
				$("#custName").focus();
				return;
			}else if($("#endCustName").val() !== "" && ($("#endCustNo").val() === "" || $("#endCustNo").val() == 0)){
				alert("엔드유저를 제대로 선택해주세요.");
				$("#endCustName").focus();
				return;
			} */
			
			$.ajax({
				url: "${path}/sales/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: salesData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					var eventModal = $('#eventModal');
					if(eventModal[0]) {
						$(".modal-backdrop").remove();
						var url ='${path}/calendar/calmain.do';
						location.href = url;
					}else {
						var url = '${path}/sales/list.do';
						location.href = url;
					}
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		function fn_DeleteSales() {
			var salesData = {};
			salesData.salesNo = Number($("#salesNo").val());

			$.ajax({
				url: "${path}/sales/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: salesData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					var eventModal = $('#eventModal');
					if(eventModal[0]) {
						$(".modal-backdrop").remove();
						var url ='${path}/calendar/calmain.do';
						location.href = url;
					}else {
						var url = '${path}/sales/list.do';
						location.href = url;
					}
				}else{
					alert("삭제 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});

		}

		$(document).ready(function(){
			setTimeComboBox(['#startTime', '#endTime']);
			var startDate = '${dto.salesStime}'.split("T")[0];
			var startTimelocal = '${dto.salesStime}'.split("T")[1].substring(0, 5);
			var endDate = '${dto.salesEtime}'.split("T")[0];
			var endTimelocal = '${dto.salesEtime}'.split("T")[1].substring(0, 5);
			
			$('#salesFrdatetime').val(startDate);
			$('#startTime').val(startTimelocal);
			$('#salesTodatetime').val(endDate);
			$('#endTime').val(endTimelocal);

			Sdate = startDate;
			startTime = startTimelocal;
			EDate = endDate;
			endTime = endTimelocal;
		});

	</script>
<c:if test="${empty simple}">
</div>
<jsp:include page="../body-bottom.jsp"/>
</c:if>