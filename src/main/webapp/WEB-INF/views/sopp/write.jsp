<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					영업기회등록
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->
<!--Page-header end 페이지 타이틀 -->
<div class="cnt_wr">
	<!-- Row start -->
	<div class="row">
		<div class="col-lg-12 col-xl-12">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs  tabs" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#tab01" role="tab">기본정보</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content tabs m-t-20">
				<div class="tab-pane active" id="tab01" role="tabpanel">
					<div class="cnt_wr">
						<div class="row">
							<div class="col-sm-12">
								<div class="card-block table-border-style">
									<div class="table-responsive">
										<table class="table table-sm bst02">
											<colgroup>
												<col width="15%" />
												<col width="35%" />
												<col width="15%" />
												<col width="35%" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row" class="requiredTextCss">영업기회명</th>
													<td colspan="3">
														<input type="text" class="form-control form-control-sm" id="soppTitle" name="soppTitle" value="">
														<input type="hidden" id="soppNo" name="soppNo" value="">
													</td>
												</tr>
												<tr>
													<th scope="row" class="requiredTextCss">담당사원</th>
													<td>
														<jsp:include page="/WEB-INF/views/module/input/inputActiveUser.jsp"/>
													</td>
													<th scope="row">매출처</th>
													<td>
														<jsp:include page="/WEB-INF/views/module/input/inputCust.jsp"/>
													</td>
												</tr>
												<tr>
													<th scope="row">매출처 담당자</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="custmemberName"  id="custmemberName" value="" />
															<input type="hidden" name="custmemberNo" id="custmemberNo" value="" />
															<span class="input-group-btn">
																<button class="btn btn-primary sch-partner"
																		data-remote="${path}/modal/popup.do?popId=custmem&compNo="
																		type="button" data-toggle="modal" data-target="#custmemberModal"
																		id="custmemberModalbtn">
																	<i class="icofont icofont-search"></i>
																</button>
															</span>
															<div class="modal fade " id="custmemberModal" tabindex="-1"
																 role="dialog">
																<div class="modal-dialog modal-80size" role="document">
																	<div class="modal-content modal-80size">
																		<div class="modal-header">
																			<h4 class="modal-title">매출처 담당자 검색</h4>
																			<button type="button" class="close"	data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<h5>매출처 담당자 목록</h5>
																			<p>매출처를 먼저 입력해주셔야 목록이 보입니다.</p>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="close"	data-dismiss="modal" aria-label="Close"/>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</td>
													<th scope="row">엔드유저</th>
													<td>
														<jsp:include page="/WEB-INF/views/module/input/inputBuyr.jsp"/>
													</td>
												</tr>
												<tr>
													<th scope="row" class="requiredTextCss">진행단계</th>
													<td><select name="soppStatus" id="soppStatus" class="form-control form-control-sm" onchange="javascript:changeProbability()">
															<option value="10178">영업정보파악</option>
															<option value="10179">초기접촉</option>
															<option value="10180">제안서제출 및 PT</option>
															<option value="10181">견적서제출</option>
															<option value="10182">계약요청</option>
															<option value="10183">수주</option>
															<option value="10184">매출</option>
															<option value="">수금완료</option>
															<option value="">은행입금</option>
															<option value="10187">계약실패</option>
															<option value="10193">계약진행보류</option>
															<option value="">발주서입수</option>
															<option value="">협력사요청</option>
													</select></td>
													<th scope="row">가능성</th>
													<td>
														<span class="input_inline">
															<input type="text" class="form-control form-control-sm" id="soppSrate" name="soppSrate" value="0">
														</span>
														%
													</td>
												</tr>
												<tr>
													<th scope="row">계약구분</th>
													<td><select name="cntrctMth" id="cntrctMth"
														class="form-control form-control-sm">
															<option value="">선택</option>
															<option value="10247">판매계약</option>
															<option value="10248">유지보수</option>
															<option value="10254">임대계약</option>
													</select></td>
													<th scope="row">매출예정일</th>
													<td>
														<input class="form-control form-control-sm col-md-6" name="soppTargetDate" id="soppTargetDate" type="date"	value="0">
													</td>
												</tr>
												<tr>
													<th scope="row">판매방식</th>
													<td>
														<select class="form-control form-control-sm" name="soppType" id="soppType">
															<option value>선택</option>
															<c:forEach var = "saleslist" items="${saleslist}">
																<option value="${saleslist.codeNo}">${saleslist.desc03}</option>			
															</c:forEach>
														</select>
													</td>
													<th scope="row">예상매출</th>
													<td><span class="input_inline">
														<input type="text" class="form-control form-control-sm" id="soppTargetAmt" name="soppTargetAmt" value="0"></span>원</td>
												</tr>
												<tr>
													<th scope="row">설명</th>
													<td colspan="3"><textarea name="soppDesc"
															id="soppDesc" rows="8" class="form-control">${dto.soppDesc}</textarea></td>
												</tr>
											</tbody>
										</table>

									</div>
								</div>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:fnSetPage('${path}/sopp/list.do')">목록</button>
									<button class="btn btn-md btn-primary" onClick="fn_soppInsert()">등록</button>
									<button class="btn btn-md btn-inverse" onClick="javascript:fnSetPage('${path}/sopp/list.do')">취소</button>
								</div>
							</div>
						</div>
					</div>
					<!--//영업기회등록-->
				</div>
			</div>
		</div>
	</div>
	<!-- Row end -->
</div>
<!--영업기회등록-->
<script>
		$('#ptncModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#custmemberModal').on('show.bs.modal', function(e) {
			var custNo = $("#custNo").val();
			var url = '${path}/modal/popup.do?popId=custmem&compNo=' + custNo;
			$("#custmemberModalbtn").data("remote",url);

			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#endCustModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});

		function fnSetCustmereData(a, b) {
			$("#custmemberNo").val(a);
			$("#custmemberName").val(b);
			$(".modal-backdrop").remove();
			$("#custmemberModal").modal("hide");
		}
    	function fnSetPtncData(a, b) {
			$("#ptncNo").val(b);
			$("#ptncName").val(a);
			$(".modal-backdrop").remove();
			$("#ptncModal").modal("hide");
		}
		function fnSetEndCustData(a, b) {
			$("#endCustNo").val(b);
			$("#endCustName").val(a);
			$("#endCustmemberModalbtn").data('whatever', b);
			$(".modal-backdrop").remove();
			$("#endCustModal").modal("hide");
		}

function fn_soppInsert() {
	var soppData = {};
	soppData.soppTitle 		= $("#soppTitle").val();
	if($("#userName").val() != "")  	soppData.userNo 		= Number($("#userNo").val());
	if($("#custName").val() != "")	soppData.custNo 		= Number($("#custNo").val());
	if($("#endCustName").val() != "")	soppData.buyrNo 		= Number($("#endCustNo").val());
	if($("#soppSrate").val() != "")	soppData.soppSrate 		= Number($("#soppSrate").val());
	if($("#soppType").val() != "")	soppData.soppType 		= Number($("#soppType").val());
	if($("#cntrctMth").val() != "")	soppData.cntrctMth 		= Number($("#cntrctMth").val());
	if($("#custmemberName").val() != "") soppData.custMemberNo = Number($("#custmemberNo").val());
	if($("#soppStatus").val() != "") soppData.soppStatus 	= $("#soppStatus").val();
	if($("#soppTargetDate").val() != "") soppData.soppTargetDate	= $("#soppTargetDate").val();
	if($("#soppTargetAmt").val() != "") soppData.soppTargetAmt 	= $("#soppTargetAmt").val().replace(/[\D\s\._\-]+/g, "");
	if($("#soppDesc").val() != "") soppData.soppDesc 		= $("#soppDesc").val();

	// 필수값 체크
	if (!soppData.soppTitle) {
		alert("영업기회명을 입력하십시오.!!");
		return;
	}

	$.ajax({ url: "${path}/sopp/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data: soppData, // HTTP 요청과 함께 서버로 보낼 데이터
		method: "POST", // HTTP 요청 메소드(GET, POST 등)
		dataType: "json" // 서버에서 보내줄 데이터의 타입
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
	.done(function(data) {
		if(data.code == 10001){
			alert("저장 성공");
			fnSetPage('${path}/sopp/list.do');
		}else{
			alert("저장 실패");
		}
	}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
	.fail(function(xhr, status, errorThrown) {
		alert("통신 실패");
	});
}

</script>

<script>
$(document).ready(function(){
    // 옵션추가 버튼 클릭시
    $("#AdditemBtn").click(function(){
        // item 의 최대번호 구하기
        var lastItemNo = $("#itemlist tr:last").attr("class").replace("item", "");
        var newitem = $("#itemlist tr:eq(1)").clone();
        newitem.removeClass();
        newitem.find("td:eq(0)").attr("rowspan", "1");
        newitem.addClass("item"+(parseInt(lastItemNo)+1));
        $("#itemlist").append(newitem);
    });

	// 이벤트 시작 ==========================================================================
	// 이벤트시 동작
	$("#soppTargetAmt").on("keyup", function (event) {
		// 긁어와서 이벤트 체크
		var selection = window.getSelection().toString();
		if (selection !== '') return;
		if ($.inArray(event.keyCode, [38, 40, 37, 39]) !== -1) return;

		// 긁어오는값을 콤마를 제거해서 숫자변환
		var $this = $(this);
		var input = $this.val();
		var input = input.replace(/[\D\s\._\-]+/g, "");
		input = input ? parseInt(input, 10) : 0;
		var ti = input;

		// 데이터 반환
		$this.val(function () {
			return (input === 0) ? "0" : input.toLocaleString("en-US");
		});
	});
});
</script>