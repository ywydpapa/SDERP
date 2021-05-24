<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<script>
	var contTable;
	$(function(){
		var obj = new Object();
		contTable = $('#contTable').DataTable({
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
			sAjaxSource : "${path}/cont/list/data",
			sServerMethod : "POST",
			fnServerParams : function (data){
				data.push({"name":"userNo", "value" : $("#userNo").val()});
				data.push({"name":"contNo", "value" : $("#contNo").val()});
				data.push({"name":"custNo", "value" : $("#custNo").val()});
				data.push({"name":"custMemberNo", "value" : ""});
				data.push({"name":"buyrNo", "value" : $("#buyrNo").val()});
				data.push({"name":"buyrMemberNo", "value" : $("#buyrMemberNo").val()});
				data.push({"name":"contTitle", "value" : $("#contTitle").val()});
				data.push({"name":"contType", "value" : $("#contType option:selected").val()});
				data.push({"name":"cntrctMth", "value": $("#contractType option:selected").val()});
				if($("#targetDatefrom").val() != "" && $("#targetDateto").val() != ""){
					data.push({"name":"targetDatefrom", "value" : $("#targetDatefrom").val()});
					data.push({"name":"targetDateto", "value" : $("#targetDateto").val()});
				} else {
					data.push({"name":"targetDatefrom", "value" : ""});
					data.push({"name":"targetDateto", "value" : ""});
				}
				if($("#freemaintSdate").val() != "" && $("#freemaintEdate").val() != ""){
					data.push({"name":"freemaintSdate", "value" : $("#freemaintSdate").val()});
					data.push({"name":"freemaintEdate", "value" : $("#freemaintEdate").val()});
				} else {
					data.push({"name":"freemaintSdate", "value" : ""});
					data.push({"name":"freemaintEdate", "value" : ""});
				}
				if($("#regSDate").val() != "" && $("#regEDate").val() != ""){
					data.push({"name":"regSDate", "value" : $("#regSDate").val()});
					data.push({"name":"regEDate", "value" : $("#regEDate").val()});
				} else {
					data.push({"name":"regSDate", "value" : ""});
					data.push({"name":"regEDate", "value" : ""});
				}
				data.push({"name":"maintIncludeCheck", "value" : $("#maintIncludeCheck").is(":checked")});
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
				},
				{
					targets : 8,
					orderable: false
				},
				{
					targets : 9,
					orderable: false
				},
				{
					targets : 11,
					orderable: false
				}
			],	// ajax로 데이터가 날아오면서 list를 뿌려주는데 각 컬럼에서 만약 값이 없으면 오류대처
			columns : [
				{
					data: "regDatetime",
					column : '등록일',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return data.split(" ")[0];
						}
					},
				},
				{
					data: "contTypeN",
					column : '판매방식',
					render : function (data, type, row) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return data;
						}
					},
				},
				{
					data: "cntrctMthN",
					column : '계약방식',
					render : function (data, type, row) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return data;
						}
					},
				},
				{
					data: "contTitle",
					column : '계약명',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return '<a href="javascript:fnSetPageEx(\''+row.contNo+'\')" title="'+data+'">'+data+'</a>';
						}
					},
				},
				{
					data: "custName",
					column : '매출처',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return '<span title="'+data+'">'+data+'</span>';
						}
					},
				},
				{
					data: "contAmt",
					column : '계약금액',
					render : function (data, type, row) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return '<span style="display: inline-block; width: 95%; text-align: right;">'+data.toLocaleString("en-US")+'</span>';
						}
					},
				},
				{
					data: "net_profit",
					column : '매출이익',
					render : function (data, type, row) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return '<span style="display: inline-block; width: 95%; text-align: right;">'+data.toLocaleString("en-US")+'</span>';
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
					column : '유지보수(시작)',
					render : function ( data, type, row ) {
						if(row.paymaintSdate != undefined){
							return row.paymaintSdate;
						} else if(row.freemaintSdate != undefined){
							return row.freemaintSdate;
						}
					},
				},
				{
					column : '유지보수(끝)',
					render : function ( data, type, row ) {
						if(row.paymaintEdate != undefined){
							return row.paymaintEdate;
						} else if(row.freemaintEdate != undefined){
							return row.freemaintEdate;
						}
					},
				},
				{
					data: "contOrddate",
					column : '판매일자',
					render : function ( data, type, row ) {
						if(data == null || data == undefined) {
							return '';
						} else {
							return data.split(" ")[0];
						}
					},
				},
				{
					column : '계산서 발행일',
					sDefaultContent : "-"
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

		$('#contTable_filter input').unbind();
		$('#contTable_filter input').bind('keyup', function (e){
			if(e.keyCode == 13){
				contTable.search(this.value).draw();
			}
		});

		contTable.on('draw', function () {
			setTimeout(fnDrawAfterCss, 10);
		});

	});

	function fnDrawAfterCss() {
		$("#contTable").css("width","");
	}

	function fnListcon() {
		contTable.search("").draw();
	}
</script>
<style>
	a {
		text-decoration:underline;
	}
	#contTable > tbody > tr > td:nth-child(4){
		overflow: hidden;
		text-overflow: ellipsis;
		max-width: 220px;
		white-space: nowrap;
	}
	#contTable > tbody > tr > td:nth-child(5){
		overflow: hidden;
		text-overflow: ellipsis;
		max-width: 220px;
		white-space: nowrap;
	}
</style>
<c:if test="${preserveSearchCondition != 'Y'}">
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						계약 현황 조회
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

		<!--계약조회-->
		<div class="cnt_wr">
			<div class="row">
				<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
					<div class="col-sm-12">
						<div class="card_box sch_it">
							<div class="btn_wr text-right">
								<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
								<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button>
								<button class="btn btn-sm btn-outline" onClick="javascript:fnSetPage('${path}/cont/write.do')"><i class="icofont icofont-pencil-alt-2"></i>등록</button>
							</div>
							<div class="form-group row">
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">담당사원</label>
									<jsp:include page="/WEB-INF/views/module/input/inputActiveUser.jsp"/>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">계약명</label>
									<jsp:include page="/WEB-INF/views/module/input/inputCont.jsp"/>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">매출처</label>
									<jsp:include page="/WEB-INF/views/module/input/inputCust.jsp"/>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">엔드유저</label>
									<jsp:include page="/WEB-INF/views/module/input/inputBuyr.jsp"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">엔드유저 담당자</label>
									<jsp:include page="/WEB-INF/views/module/input/inputBuyrMember.jsp"/>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">계약명</label>
									<input type="text" class="form-control form-control-sm" id="contTitle" name="" placeholder="">
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">계약방식</label>
									<jsp:include page="/WEB-INF/views/module/input/inputContractType.jsp"/>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">판매방식</label>
									<jsp:include page="/WEB-INF/views/module/input/inputContType.jsp"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">판매일자</label>
									<p class="input_inline">
										<input class="form-control form-control-sm col-xl-6" type="date" id="targetDatefrom" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val())">
										~
										<input class="form-control form-control-sm col-xl-6" type="date" id="targetDateto" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val())">
									</p>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">유지보수기간</label>
									<span class="pull-right">기간포함(<input type="checkbox" value="" id="maintIncludeCheck" checked>)</span>
									<p class="input_inline">
										<input class="form-control form-control-sm col-xl-6" type="date" id="freemaintSdate" onChange="javascript:inputDate($('#freemaintSdate').val(), $('#freemaintEdate').val())">
										~
										<input class="form-control form-control-sm col-xl-6" type="date" id="freemaintEdate" onChange="javascript:inputDate($('#freemaintSdate').val(), $('#freemaintEdate').val())">
									</p>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">등록일</label>
									<p class="input_inline">
										<input class="form-control form-control-sm col-xl-6" type="date" id="regSDate" onChange="javascript:inputDate($('#regSDate').val(), $('#regEDate').val())">
										~
										<input class="form-control form-control-sm col-xl-6" type="date" id="regEDate" onChange="javascript:inputDate($('#regSDate').val(), $('#regEDate').val())">
									</p>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
</c:if>
<!--//계약조회-->
	 <!--리스트 table-->
<div class="cnt_wr" id="list-container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table id="contTable" class="table table-striped table-bordered nowrap ">
						<colgroup>
							<col width="1%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="30%"/>
							<col width="15%"/>
							<col width="7.5%"/>
							<col width="7.5%"/>
							<col width="5%"/>
							<col width="7%"/>
							<col width="7%"/>
							<col width="5%"/>
							<col width="5%"/>
						</colgroup>
						<thead>
							<tr>
								<th>등록일</th>
								<th>판매방식</th>
								<th>계약방식</th>
								<th>계약명</th>
								<th>매출처</th>
								<th>계약금액</th>
								<th>매출이익</th>
								<th>담당사원</th>
								<th>유지보수(시작)</th>
								<th>유지보수(끝)</th>
								<th>판매일자</th>
								<th>계산서 발행일</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//리스트 table-->
<script>
	function fnSetPageEx(data){
		var url = "${path}/cont/detail/"+data;
		fnSetPage(url);
	}

	// 계약명 엔터키 누를경우 원치않는 행동발생하여 이벤트 방지 코드 추가
	$('#contTitle').keydown(function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		}
	})
</script>
