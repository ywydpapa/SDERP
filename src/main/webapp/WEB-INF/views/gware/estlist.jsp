<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
	<script>
	$(function(){
		$('#estTable').DataTable({
			info:false,
			searching: true,
			order: [[ 0, "desc" ]],
		});
	});
	</script>
	<style>
		a {
			text-decoration:underline;
		}
		#estTable > tbody > tr > td:nth-child(4){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 220px;
			white-space: nowrap;
		}
		#estTable > tbody > tr > td:nth-child(5){
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
					<div class="page-header-title" style="float:left;">
						<div style="margin-top:15px;">
							<h6 style="font-weight:600;">견적 작성 목록</h6>
						</div>
					</div>
					<div class="btn_wr" style="float:right;">
						<!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold"
							onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2"
							onclick="acordian_action1()" style="display: none;">접기</button>
						<!-- hide and show -->
						<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
						<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search" id="search"></i>검색</button>
						<button class="btn btn-sm btn-outline" onClick="javascript:location='${path}/gw/estwrite.do'"><i class="icofont icofont-pencil-alt-2"></i>견적등록</button>
					</div>
				</div>
			</div>
		</div>
		<!--Page-header end 페이지 타이틀 -->
		
		<!--계약조회-->
		<div class="cnt_wr" id="acordian" style="display:none;">
			<div class="row">
				<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
					<div class="col-sm-12">
						<div class="card_box sch_it">
							<div class="form-group row" style="clear:both;">
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label">거래처</label>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="custName" id="custName" autocomplete="off" value="${param.custName}" />
										<input type="hidden" name="custNo" id="custNo" value="${param.custNo}" />
									</div>
								</div>
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label" for="userName">담당사원</label>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="userName" id="userName" autocomplete="off"/> 
										<input type="hidden" name="userNo" id="userNo" /> 
									</div>
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
						<table id="estTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="5%"/>
								<col width="10%"/>
								<col width="10%"/>
								<col width="30%"/>
								<col width="10%"/>
								<col width="5%"/>
								<col width="5%"/>
								<col width="5%"/>
								<col width="20%"/>
							</colgroup>							
							<thead>
								<tr>
									<th class="text-center">견적일자</th>
									<th class="text-center">작성자</th>
									<th class="text-center">견적번호</th>
									<th class="text-center">견적명</th>
									<th class="text-center">거래처</th>
									<th class="text-center">공급가합계</th>
									<th class="text-center">부가세합계</th>
									<th class="text-center">금액</th>
									<th class="text-center">적요</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${list}">
								<tr>
									<td class="text-center">${row.estDate}</td>
									<td class="text-center">${row.userName}</td>
									<td class="text-center">
										<a href="${path}/gw/estdetail/${row.estId}/${row.estVer}">${row.estId}</a>
									</td>
									<td class="text-center">${row.estTitle}</td>
									<td class="text-center">${row.custName}</td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.estAmount}" /></td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.estVat}" /></td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.estTotal}" /></td>
									<td>${row.estDesc}</td>
								</tr>
							</c:forEach>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//리스트 table-->
	
	<script>
	function acordian_action(){
		if($("#acordian").css("display") == "none"){
		    $("#acordian").show();
		    $("#fold").hide();
		    $("#fold2").show();

		} else {
		    $("#acordian").hide();
		    $("#fold").show();
		}
	}
	function acordian_action1(){
		if($("#acordian").css("display") != "none"){
		    $("#acordian").hide();
		    $("#fold").show();
		    $("#fold2").hide();

		} else {
		    $("#acordian").show();
		    $("#fold").hide();
		}
	}
</script>
	
	<script>
	$("#estTable tbody tr").find("#absSum").each(function(index, item){
		var absValue = $(item).html().replace(/[\D\s\._\-]+/g, "");
		var absSum = 0;
		
		if(absValue < 0){
			absSum = absValue * -1;
		}else{
			absSum = absValue;
		}
		
		$(item).html(Number(absSum).toLocaleString("en-US"));
	});
	
	$("#vatSdate").change(function(){
		var dateValue = $(this).val();
		var dateValueArr = dateValue.split("-");
		var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
		var EdateValue = $("#vatEdate").val();
		var EdateDateArr = EdateValue.split("-");
		var EdateDateCom = new Date(EdateDateArr[0], parseInt(EdateDateArr[1])-1, EdateDateArr[2]);
		
		if(EdateValue == ""){
			dateValueCom.setDate(dateValueCom.getDate()+1);
		}else if(dateValueCom.getTime() > EdateDateCom.getTime()){
			alert("시작일이 종료일보다 클 수 없습니다.");
			dateValueCom.setDate(dateValueCom.getDate()+1);
		}else{
			return null;
		}
		
		var year = dateValueCom.getFullYear();
		var month = dateValueCom.getMonth()+1;
		var day = dateValueCom.getDate();
		
		if(day < 10){
			day = "0" + day;
		}
		
		$("#vatEdate").val(year + "-" + month + "-" + day);
	});
	
	$("#vatEdate").change(function(){
		var SdateValue = $("#vatSdate").val();
		var SdateValueArr = SdateValue.split("-");
		var SdateValueCom = new Date(SdateValueArr[0], parseInt(SdateValueArr[1])-1, SdateValueArr[2]);
		var thisDateValue = $(this).val();
		var thisDateArr = thisDateValue.split("-");
		var thisDateCom = new Date(thisDateArr[0], parseInt(thisDateArr[1])-1, thisDateArr[2]);
		
		if(SdateValue == ""){
			thisDateCom.setDate(thisDateCom.getDate()-1);
		}else if(SdateValueCom.getTime() > thisDateCom.getTime()){
			alert("종료일이 시작일보다 작을 수 없습니다.");
			thisDateCom.setDate(thisDateCom.getDate()-1);
		}else{
			return null;
		}
		
		var year = thisDateCom.getFullYear();
		var month = thisDateCom.getMonth()+1;
		var day = thisDateCom.getDate();
		
		if(day < 10){
			day = "0" + day;
		}
		
		$("#vatSdate").val(year + "-" + month + "-" + day);
	});
	
	
	$('#userModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	
	$('#custModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	$('#endCustModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});

	function fnSetUserData(a, b) {
		localStorage.setItem("userName", b);
		$("#userName").val(b);
		$("#userNo").val(a);
		$(".modal-backdrop").remove();
		$("#userModal").modal("hide");
	}
	
	function fnSetCustData(a, b) {
		$("#custNo").val(b);
		$("#custName").val(a);
		$(".modal-backdrop").remove();
		$("#custModal").modal("hide");
	}
	function fnSetEndCustData(a, b) {
		$("#endCustNo").val(b);
		$("#endCustName").val(a);
		$(".modal-backdrop").remove();
		$("#endCustModal").modal("hide");
	}

	function fnListcon() {
		var estData = {};
		estData.custNo = $("#custNo").val() ? Number($("#custNo").val()) : 0;
		estData.userName = $("#userName").val() ? $("#userName").val() : null;
		var param = "?";
		var paramFirst = true;
		for (variable in estData) {
			console.log("key: " + variable + ", value: " + estData[variable]);
			if(estData[variable] != null && estData[variable] != 0) {
				if(paramFirst){
					param = param + variable + "=" + estData[variable];
					paramFirst = false;
				} else {
					param = param + "&" + variable + "=" + estData[variable];
				}
			}
		}

		if(param == "?"){
			param = "";
		}
		
		localStorage.setItem("custNo", estData.custNo);
		localStorage.setItem("custName", $("#custName").val());
		localStorage.setItem("userName", estData.userName);

		if(document.querySelector('#acordian').style.cssText == "display: none;"){
			var testAco1 = document.querySelector('#acordian').style.cssText;
			localStorage.setItem('lastAco1', testAco1);	
		}else {
			var testAco2 = document.querySelector('#acordian').style.cssText;
			localStorage.setItem('lastAco2', testAco2);
		}
		
		var url = '${path}/gw/estlist.do'+param;
		location.href = url;
	}
	
	$("input[type='text']").keyup(function(e){
		if(e.keyCode == 13){
			$("#search").click();
		}
	});

	$(document).ready(function() {
		var targetDatefrom = '${param.targetDatefrom}';
		var targetDateto = '${param.targetDateto}';
		var freemaintSdate = '${param.freemaintSdate}';
		var freemaintEdate = '${param.freemaintEdate}';
		var regSDate = '${param.regSDate}';
		var regEDate = '${param.regEDate}';

		if(targetDatefrom != '') $("#targetDatefrom").val(targetDatefrom);
		if(targetDateto != '') $("#targetDateto").val(targetDateto);
		if(freemaintSdate != '') $("#freemaintSdate").val(freemaintSdate);
		if(freemaintEdate != '') $("#freemaintEdate").val(freemaintEdate);
		if(regSDate != '') $("#regSDate").val(regSDate);
		if(regEDate != '') $("#regEDate").val(regEDate);

		if(window.location.search.toString().startsWith('?')){
			if('${param.userName}' == ''){
				$("#userName").val("");
			} else {
				$("#userName").val(localStorage.getItem("userName"));
			}
			
			if('${param.custNo}' == ''){
				$("#custNo").val("");
				$("#custName").val("");
			} else {
				$("#custNo").val(localStorage.getItem("custNo"));
				$("#custName").val(localStorage.getItem("custName"));
			}
			
		} /* else {
			var userName = '${sessionScope.userName}';
			$("#userName").val(userName);
		} */
		var lastAco1 = localStorage.getItem('lastAco1');
		var lastAco2 = localStorage.getItem('lastAco2');
		if(lastAco1 == null && lastAco2 != null) {
			 $("#acordian").css("display", "block");
		}
		localStorage.clear();
	});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>
