<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<script>
	var soppStatusColor = {
		'영업정보파악': 'black',
		'초기접촉' : 'black',
		'제안서제출및PT' : 'black',
		'견적서제출' : 'black',
		'계약요청' : 'blue',
		'수주' : 'green',
		'매출' : 'green',
		'계약실패' : 'red',
		'계약진행보류' : 'red'
	}
	var soppTable;
	$(function(){
		var obj = new Object();
		soppTable = $('#soppTable').DataTable({
			order: [[ 0, "desc" ]],
			paging : true, // 페이지 처리 여부
			ordering : true, // 컬럼 클릭 시 오더링을 적용 여부
			// info : true, // 페이지 상태에 대한 정보 여부
			filter : true, // 검색창 여부
			// lengthChange : true, // 블록 단위 변경 기능 여부
			// stateSave : false,
			pageLength: 20, // 한 페이지에 기본으로 보열줄 항목 수
			pagingType : "full_numbers",
			bPaginate: true,
			bLengthChange: true,
			lengthMenu: [[20, 40, 60, 80, 100], [20, 40, 60, 80, 100]], // 리스트 항목을 구성할 옵션들
			bProcessing: true,
			bServerSide: true,
			sAjaxSource : "${path}/sopp/list/data",
			sServerMethod : "POST",
			fnServerParams : function (data){
				data.push({"name":"userNo", "value" : $("#userNo").val()});							// 담당자
				data.push({"name":"custNo", "value" : $("#custNo").val()});							// 거래처
				data.push({"name":"buyrNo", "value" : $("#buyrNo").val()});							// 엔드유저
				data.push({"name":"soppType", "value" : $("#soppType option:selected").val()});		// 판매방식
				data.push({"name":"cntrctMth", "value" : $("#cntrctMth option:selected").val()});	// 계약구분
				data.push({"name":"soppStatus", "value" : $("#soppStatus option:selected").val()});	// 진행단계
				if($("#targetDatefrom").val() != ""){
					data.push({"name":"targetDatefrom", "value" : $("#targetDatefrom").val()});
					data.push({"name":"targetDateto", "value" : $("#targetDateto").val()});
				} else {
					data.push({"name":"targetDatefrom", "value" : ""});
					data.push({"name":"targetDateto", "value" : ""});
				}
				if($("#targetDatefrom2").val() != ""){
					data.push({"name":"targetDatefrom2", "value" : $("#targetDatefrom2").val()});
					data.push({"name":"targetDateto2", "value" : $("#targetDateto2").val()});
				} else {
					data.push({"name":"targetDatefrom2", "value" : ""});
					data.push({"name":"targetDateto2", "value" : ""});
				}
			},
			// TODO 아래 주석은 서버로 부터 성공시 data 확인하는 용도
			/*
            fnServerData: function ( sSource, aoData, fnCallback, oSettings ) {
                oSettings.jqXHR = $.ajax({
                    "dataType": 'json',
                    "type": "POST",
                    "url": sSource,
                    "data": aoData,
                    "success": function (data) {
                        console.dir(data);
                        return data.aaData;
                    }
                });
            },
            */
			columnDefs :[
				{
					defaultContent : "-",
					targets : "_all"
				}
			],	// ajax로 데이터가 날아오면서 list를 뿌려주는데 각 컬럼에서 만약 값이 없으면 오류대처
			columns : [
				{
					data: "modDatetime",
					column : '등록/수정일',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return '<span class="yyyyMMddConvert">'+data+'</span>';
						}
					},
				},
				{
					data: "soppTypeN",
					column : '판매방식',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return data;
						}
					},
				},
				{
					data: "cntrctMthN",
					column : '계약구분',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return data;
						}
					},
				},
				{
					data: "soppTitle",
					column : '영업기회명',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return '<a href="javascript:fnSetPageEx(\''+row.soppNo+'\')" title="'+data+'">'+data+'</a>';
						}
					},
				},
				{
					data: "custName",
					column : '거래처',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return '<span title="'+data+'">'+data+'</span>';
						}
					},
				},
				{
					data: "buyrName",
					column : '엔드유저',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return '<span title="'+data+'">'+data+'</span>';
						}
					},
				},
				{
					data: "userName",
					column : '담당사원',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return data;
						}
					},
				},
				{
					data: "soppTargetAmt",
					column : '예상매출액',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return '<span class="numberComa">'+data+'</span>';
						}
					},
				},
				{
					data: "soppStatusN",
					column : '진행단계',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return '<span style="color : '+soppStatusColor[data]+'; font-weight: bold;">'+data+'</span>';
						}
					},
				},
				/*{
					data: "salesTypeN",
					column : '활동형태',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return data;
						}
					},
				},*/
				{
					data: "soppTargetDate",
					column : '매출예정일',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return data;
						}
					},
				}
			],
			oLanguage: {
				sZeroRecords : "일치하는 데이터가 존재하지 않습니다.",
				sInfo : "현재 _START_ - _END_ / _TOTAL_건",
				slengthMenu: "페이지당 _MENU_ 개씩 보기",
				sInfoEmpty: "데이터 없음",
				sInfoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
				sSearch : "내부검색 : ",
				sProcessing : '데이터 불러오는중...',
				oPaginate: {
					sFirst : '처음으로',
					sLast : '마지막으로',
					sPrevious: "이전",
					sNext: "다음"
				}
			},
			// docs : https://legacy.datatables.net/usage/i18n

		});

		$('#soppTable_filter input').unbind();
		$('#soppTable_filter input').bind('keyup', function (e){
			if(e.keyCode == 13){
				soppTable.search(this.value).draw();
			}
		});

		soppTable.on('draw', function () {
			setTimeout(fnDrawAfterCss, 10);

			var elementArr = $(".numberComa");
			for(var i=0; i<elementArr.length; i++){
				var temp;
				if(elementArr[i].innerText == '') temp = 0;
				else temp = Number(elementArr[i].innerText);
				elementArr[i].innerText = temp.toLocaleString("en-US");
			}

			var elementArrDay = $(".yyyyMMddConvert");
			for(var i=0; i<elementArrDay.length; i++){
				var temp = elementArrDay[i].innerText;
				elementArrDay[i].innerText = temp.split(" ")[0];
			}


		});
	});

	function fnDrawAfterCss() {
		$("#soppTable").css("width","");
	}

	function fnListcon() {
		soppTable.search("").draw();
	}
</script>
<style>
	a {
		text-decoration:underline;
	}
	.numberComa {
		float: right;
	}
	#soppTable > tbody > tr > td:nth-child(4) {
		overflow: hidden;
		text-overflow: ellipsis;
		max-width: 230px;
		white-space: nowrap;
	}
	#soppTable > tbody > tr > td:nth-child(5) {
		overflow: hidden;
		text-overflow: ellipsis;
		max-width: 230px;
		white-space: nowrap;
	}
	#soppTable > tbody > tr > td:nth-child(6) {
		overflow: hidden;
		text-overflow: ellipsis;
		max-width: 230px;
		white-space: nowrap;
	}
</style>

<c:if test="${preserveSearchCondition != 'Y'}">
	<!-- DB TABLE 실행 -->
	<!--영업기회조회-->
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						영업기회조회
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

	<!--영업기회조회-->
	<div class="cnt_wr">
		<div class="row">
			<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
				<div class="col-sm-12">
					<div class="card_box sch_it">
						<div class="btn_wr text-right">
							<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
							<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button>
							<button class="btn btn-sm btn-outline" onClick="javascript:fnSetPage('${path}/sopp/write.do')"><i class="icofont icofont-pencil-alt-2"></i>등록</button>
						</div>
						<!--row-->
						<div class="form-group row">
							<!--담당자-->
							<div class="col-sm-12 col-xl-2">
								<label class="col-form-label" for="userName">담당자</label>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="userName" id="userName" value=""  readonly />
									<input type="hidden" name="userNo" 	id="userNo" value="" />
									<span class="input-group-btn">
											<button class="btn btn-primary sch-company"
													data-remote="${path}/modal/popup.do?popId=user"
													type="button" data-toggle="modal" data-target="#userModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
									<!--modal-->
									<div class="modal fade " id="userModal" tabindex="-1" role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title"></h4>
													<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>사용자목록</h5>
													<p>Loading!!!</p>
												</div>
												<div class="modal-footer">
													<button type="button"
															class="btn btn-default waves-effect "
															data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
									<!--//modal-->
								</div>
							</div>
							<!--//담당자-->
							<!--거래처-->
							<div class="col-sm-12 col-xl-2">
								<label class="col-form-label" for="custName">거래처</label>
								<div class="input-group input-group-sm">
									<input type="text" class="form-control" name="custName" id="custName" value="" readonly/>
									<input type="hidden" name="custNo" id="custNo" value="" />
									<span class="input-group-btn">
											<button class="btn btn-primary sch-company"
													data-remote="${path}/modal/popup.do?popId=cust"
													type="button" data-toggle="modal" data-target="#custModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
									<!--modal-->
									<div class="modal fade " id="custModal" tabindex="-1"
										 role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title">매출처검색</h4>
													<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>매출처목록</h5>
													<p>Loading!!!</p>
												</div>
												<div class="modal-footer">
													<button type="button"
															class="btn btn-default waves-effect "
															data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
									<!--//modal-->
								</div>
							</div>
							<!--//거래처-->
							<div class="col-sm-12 col-xl-2">
								<label class="col-form-label" for="custmemberName">엔드유저</label>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="buyrName" id="custmemberName" value="" readonly />
									<input type="hidden" name="custmemberNo" id="buyrNo" value="" />
									<span class="input-group-btn">
										<button class="btn btn-dark sch-company" data-remote="${path}/modal/popup.do?popId=custmem&compNo=" type="button" data-toggle="modal" data-target="#custmemberModal" disabled>
											<i class="icofont icofont-search"></i>
										</button>
									</span>
									<div class="modal fade " id="custmemberModal" tabindex="-1"
										 role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title"></h4>
													<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>고객목록</h5>
													<p>거래처를 먼저 입력해주셔야 목록이 보입니다.</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect "
															data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--매출예정일-->
							<div class="col-sm-12 col-xl-6">
								<label class="col-form-label">매출예정일</label>
								<p class="input_inline mb-0">
									<input class="form-control form-control-sm col-xl-6" type="date" id="targetDatefrom" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val())"> ~
									<input class="form-control form-control-sm col-xl-6" type="date" id="targetDateto" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val())">
								</p>
							</div>
							<!--//매출예정일-->
						</div>
						<!--//row-->
						<div class="form-group row">
							<div class="col-sm-2">
								<label class="col-form-label" for="soppType">판매방식</label>
								<select class="form-control form-control-sm" name="soppType" id="soppType" title="선택">
									<option value>선택</option>
									<c:forEach var = "saleslist" items="${saleslist}">
										<option value="${saleslist.codeNo}">${saleslist.desc03}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-2">
								<label class="col-form-label" for="soppType">계약구분</label>
								<select class="form-control form-control-sm" name="cntrctMth" id="cntrctMth" title="선택">
									<option value>선택</option>
									<c:forEach var = "saleslist" items="${contractType}">
										<option value="${saleslist.codeNo}">${saleslist.desc03}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-2">
								<label class="col-form-label" for="soppStatus">진행단계</label>
								<select class="form-control form-control-sm" name="soppStatus" id="soppStatus" title="선택">
									<option value>선택</option>
									<c:forEach var = "sstatuslist" items="${sstatuslist}">
										<option value="${sstatuslist.codeNo}">${sstatuslist.desc03}</option>
									</c:forEach>
								</select>
							</div>
							<!--등록/수정일-->
							<div class="col-sm-12 col-xl-6">
								<label class="col-form-label">등록/수정일</label>
								<p class="input_inline mb-0">
									<input class="form-control form-control-sm col-xl-6" type="date" id="targetDatefrom2" onChange="javascript:inputDate($('#targetDatefrom2').val(), $('#targetDateto2').val())"> ~
									<input class="form-control form-control-sm col-xl-6" type="date" id="targetDateto2" onChange="javascript:inputDate($('#targetDatefrom2').val(), $('#targetDateto2').val())">
								</p>
							</div>
							<!--//등록/수정일-->
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--//영업기회조회-->
</c:if>

<!--리스트 table-->
<div class="cnt_wr" id="list-container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table id="soppTable" class="table table-striped table-bordered nowrap ">
						<colgroup>
							<col width="2.5%">
							<col width="2.5%">
							<col width="5%">
							<col width="30%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="3%">
							<col width="14%">
							<col width="7%">
							<col width="3%">
						</colgroup>
						<thead>
						<tr>
							<th>등록/수정일</th>
							<th>판매방식</th>
							<th>계약구분</th>
							<th>영업기회명</th>
							<th>매출처</th>
							<th>엔드유저</th>
							<th>담당사원</th>
							<th>예상매출액</th>
							<th>진행단계</th>
							<th>매출예정일</th>
						</tr>
						</thead>
						<tbody>
						<%--
                        <c:forEach var="row" items="${list}">
                        <tr>
                            <th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
                            <td>${row.soppTypeN}</td>
                            <td><a href="javascript:fnSetPage('${path}/sopp/detail/${row.soppNo}')" title="${row.soppTitle}">${row.soppTitle}</a></td>
                            <td>${row.custName}</td>
                            <td>${row.userName}</td>
                            <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.soppTargetAmt}" /></td>
                            <td <c:if test="${row.soppStatusN eq '계약진행보류'}">style="color:red"</c:if>>${row.soppStatusN}</td>
                            <td class="text-right">${row.soppTargetDate}</td>
                        </tr>
                        </c:forEach>
                        --%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//리스트 table-->
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
	$('#custmemberModal').on('show.bs.modal', function(e) {
		var custNo = $("#custNo").val();
		var url = '${path}/modal/popup.do?popId=custmem&compNo=' + custNo;
		$("#custmemberModalbtn").data("remote",url);

		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});

	function fnSetCustData(a, b) {
		$("#custNo").val(b);
		$("#custName").val(a);
		$(".modal-backdrop").remove();
		$("#custModal").modal("hide");
	}
	function fnSetUserData(a, b) {
		$("#userName").val(b);
		$("#userNo").val(a);
		$(".modal-backdrop").remove();
		$("#userModal").modal("hide");
	}
	function fnSetCustmereData(a, b) {
		$("#custmemberNo").val(a);
		$("#custmemberName").val(b);
		$(".modal-backdrop").remove();
		$("#custmemberModal").modal("hide");
	}

	/*
    function fnListcon() {
        var soppData = {};
        soppData.userNo = $("#userNo").val() ? $("#userNo").val() : 0;
        soppData.custNo = $("#custNo").val() ? $("#custNo").val() : 0;
        soppData.custmemberNo = $("#custmemberNo").val() ? $("#custmemberNo").val() : 0;
        soppData.targetDatefrom = $("#targetDatefrom").val() ? $("#targetDatefrom").val() : null;
        soppData.targetDateto = $("#targetDateto").val() ? $("#targetDateto").val() : null;
        soppData.soppType = $("#soppType").val() ? $("#soppType").val() : null;
        soppData.businessType = $("#businessType").val() ? $("#businessType").val() : null;
        soppData.soppStatus = $("#soppStatus").val() ? $("#soppStatus").val() : null;

        fnSetList('${path}/sopp/listcon.do', soppData);
   		}
   		*/

	function fnSetPageEx(data){
		var url = "${path}/sopp/detail/"+data;
		fnSetPage(url);
	}
</script>

