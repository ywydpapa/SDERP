<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2022-01-20
  Time: 오전 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top3.jsp"/>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<div id="main_content">
	<style>
	.select2-container {
		width: 13%!important;
	}

	.select2-container--default .select2-selection--single .select2-selection__rendered {
		background-color: white;
		line-height: 10px!important;
	}
	</style>
    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">계좌상세내역 </h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                        <!-- hide and show -->
						<!-- <button class="btn btn-sm btn-success" id="fold" onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2" onclick="acordian_action1()" style="display:none;">접기</button>
						hide and show
                        <button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
                        <button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button> -->
                        <button class="btn btn-sm btn-danger" onClick="javascript:fnChgStatus()">상태변경</button>
                        <button class="btn btn-sm btn-outline"onClick="javascript:location='${path}/acc/bacupdate.do'"><i class="icofont icofont-pencil-alt-2"></i>내역 등록</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Page-header end 페이지 타이틀 -->
        <!--영업활동조회-->
        <%-- <div class="cnt_wr" id="acordian" style="display:none;">
            <div class="row">
                <form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
                    <div class="col-sm-12">
                        <div class="card_box sch_it">
                            <div class="form-group row">
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="userName">담당사원</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="userName"
                                               id="userName" value="" readonly /> <input type="hidden"
                                                                                         name="userNo" id="userNo" value="" /> <span
                                            class="input-group-btn">
										<button class="btn btn-primary sch-company"
                                                data-remote="${path}/modal/popup.do?popId=user" type="button"
                                                data-toggle="modal" data-target="#userModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
                                        <div class="modal fade " id="userModal" tabindex="-1"
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
                                                        <h5>사용자목록</h5>
                                                        <p>Loading!!!</p>
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
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="soppTitle">영업기회</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="soppTitle"
                                               id="soppTitle" value="" readonly /> <input
                                            type="hidden" name="soppNo" id="soppNo"
                                            value="" /> <span class="input-group-btn">
											<button class="btn btn-primary sch-company"
                                                    data-remote="${path}/modal/popup.do?popId=sopp"
                                                    type="button" data-toggle="modal"
                                                    data-target="#soppModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
                                        <div class="modal fade " id="soppModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">영업기회 검색</h4>
                                                        <button type="button" class="close"
                                                                data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>영업기회 목록</h5>
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
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="custName">매출처</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="custName"
                                               id="custName" value="" readonly /> <input
                                            type="hidden" name="custNo" id="custNo"
                                            value="" /> <span class="input-group-btn">
												<button class="btn btn-primary sch-company"
                                                        data-remote="${path}/modal/popup.do?popId=cust"
                                                        type="button" data-toggle="modal"
                                                        data-target="#custModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
                                        <div class="modal fade " id="custModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">매출처검색</h4>
                                                        <button type="button" class="close"
                                                                data-dismiss="modal" aria-label="Close">
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
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="salesType">처리 상태</label>
                                    <select name="select" class="form-control form-control-sm" id="salesType">
                                        <option value>선택</option>
                                        <c:forEach var = "acttype" items="${acttype}">
                                            <option value="${acttype.codeNo}">${acttype.desc03}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label">발행일</label>
                                    <p class="input_inline">
                                    	<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" id="salesFrdatetime"> ~ <input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="salesTodatetime">
                                    </p>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label">거래일</label>
                                    <p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" id="regSDate"> ~ <input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="regEDate">
                                    </p>
                                </div>
                            </div>

                        </div>
                    </div>

                </form>
            </div>
        </div> --%>
        <!--//영업활동조회-->
    </c:if>
	<div class="row" style="margin-bottom: 10px;">
		<div class="col-sm-12">
            <label for="baclist">계좌번호</label>
			<select class="form-control-sm" id="baclist" name="baclist">
				<option value="">선택</option>
				<c:forEach var="row" items="${bacList}">
					<option value="${row.bacSerial}">${row.bacNo}</option>
				</c:forEach>
			</select>
			<input id="reloadpage_num" type="hidden" value="0">
			<input id="baclist_num" type="hidden" value="">
		</div>
	</div>
	<!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div id="testcreatebactable" class="table-responsive">
                        <table id="bacTable" class="table table-striped table-bordered nowrap">
                            <colgroup>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="5%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="15%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">일자</th>
                                <th class="text-center">기재내용</th>
                                <th class="text-center">입금</th>
                                <th class="text-center">출금</th>
                                <th class="text-center">잔액</th>
                                <th class="text-center">거래점</th>
                                <th class="text-center">메모</th>
                                <th class="text-center">승인번호</th>
                                <th class="text-center">연결</th>
                            </tr>
                            </thead>
                            <tbody>
<%-- 	                            <c:forEach items="${vatList}" var="vlist">
	                                <tr>
	                                    <td class="text-center">${vlist.baclogTime}</td>
	                                    <td class="text-center">${vlist.logRemark}</td>
	                                    <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.inAmt}" /></td>
	                                    <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.outAmt}" /></td>
	                                    <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.balanceAmt}" /></td>
	                                    <td>${vlist.branchCode}</td>
	                                    <td>${vlist.linkDoc}</td>
	                                </tr>
	                            </c:forEach> --%>
                          	</tbody>
                        </table>
                        <div id="pageDiv" style="float: right;"></div>
                        <div class="modal fade " id="bacVatSModal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-80size" role="document">
                                <div class="modal-content modal-80size">
                                    <div class="modal-header">
                                        <h4 class="modal-title">매입/매출 거래처 선택</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-success waves-effect" data-dismiss="modal" id="checkConnect" onclick="checkConnect();">선택연결</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade " id="bacVatBModal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-80size" role="document">
                                <div class="modal-content modal-80size">
                                    <div class="modal-header">
                                        <h4 class="modal-title">매입/매출 거래처 선택</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-success waves-effect" data-dismiss="modal" id="checkConnect" onclick="checkConnect();">선택연결</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
   	 	var pageListNum = 15;
   		var counter = 0;
	    <!--//리스트 table-->
		$(document).ready(function(){
			var selectData = {};
			var pageCheck = {};
			var bacTable = $("#bacTable tbody");
			var pageDiv = $("#pageDiv");
			var tableHtml = "";
			var pageHtml = "";
			var pageNation = 10;
			var pageFirstBetween = 0;
			
			bacTable.empty();
			pageDiv.empty();
			localStorage.getItem("lastTab");
			localStorage.getItem("lastpageNum");
			$("#baclist").select2(); 
			
			if(localStorage.getItem("lastTab") != null && localStorage.getItem("lastTab") != '' && localStorage.getItem("lastpageNum") != null && localStorage.getItem("lastpageNum") != '') {
				var selectData = {};
				var bacTable = $("#bacTable tbody");
				var pageDiv = $("#pageDiv");
				var tableHtml = "";
				var pageNation = 10;
				bacTable.html("");

				selectData.bacSerial = localStorage.getItem("lastTab");
				selectData.betFirstNum = 15*(localStorage.getItem("lastpageNum"));
				selectData.betLastNum = 15;
				pageCheck.bacSerial = localStorage.getItem("lastTab");
				
				$.ajax({
					url: "${path}/acc/bacSelectList.do",
					method: "get",
					data: selectData,
					dataType: "json",
					success:function(data){
						if(data.length > 0){
							for(var i = 0; i < data.length; i++){
								tableHtml += "<tr><td style='text-align:center;'>" + data[i].baclogTime + "</td><td style='text-align:center;'>" 
								+ data[i].bacDesc + "</td><td style='text-align:right;'>" 
								+ parseInt(data[i].inAmt).toLocaleString("en-US") + "</td><td style='text-align:right;'>"
							 	+ parseInt(data[i].outAmt).toLocaleString("en-US") + "</td><td style='text-align:right;'>"
							 	+ parseInt(data[i].balanceAmt).toLocaleString("en-US") + "</td><td style='text-align:center;'>"
							 	+ data[i].branchCode + "</td><td style='text-align:center;'>"
							 	+ data[i].logRemark + "</td><td style='text-align:center;'>"
							 	+ data[i].linkDoc + "</td>";
								
								 if(parseInt(data[i].inAmt) > parseInt(data[i].outAmt)){
	                                 if(data[i].linkDoc != '' && data[i].linkDoc != null){
	                                     tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' data-id='"+data[i].linkDoc+"' onclick='cancelconnect(this)'>취소</button></td>";
	                                 }else{
	                                     tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatS' type='button' id='bacVatSBtn' data-toggle='modal' data-target='#bacVatSModal' data-id='"+data[i].baclogId+"'>연결</button></td>";    
	                                 }
	                             }else{
	                                 if(data[i].linkDoc != '' && data[i].linkDoc != null){
	                                     tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' data-id='"+data[i].linkDoc+"' onclick='cancelconnect(this)'>취소</button></td>";
	                                 }else{
	                                    tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatB' type='button' id='bacVatBBtn' data-toggle='modal' data-target='#bacVatBModal' data-id='"+data[i].baclogId+"'>연결</button></td>";
	                                 }
	                             }					
							}
							bacTable.html(tableHtml);
						}else{
							bacTable.html("");
						}
					}
				});
				var origin_page_Num = (localStorage.getItem("lastpageNum")+1)/100;
				var endpageNum = Math.ceil(origin_page_Num)*10;
				var startpageNum = Math.floor(origin_page_Num)*10;
				counter = Math.floor(origin_page_Num);
				
				$.ajax({
					url: "${path}/acc/bacSelectListCnt.do",
					method: "post",
					data: pageCheck,
					dataType: "json",
					success:function(data){
						console.log(data.resultCount);
						if(data.resultCount > 0){
							var count = parseInt(data.resultCount/pageListNum);
							var countRe = parseInt(data.resultCount/pageListNum);
							pageHtml = "";
							pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
							
							if(count > pageNation){
								
								for(var j = startpageNum+1; j <= endpageNum; j++){
									if(j <= count+1){
										pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";	
									}
								
								}
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
							}else{
								if(countRe > 0){
									countRe = countRe + 1;
								}else{
									countRe = 0;
								}
								
								for(var j = 1; j <= countRe; j++){
									pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
								}
							}
							
							pageDiv.html(pageHtml);
						}else{
							pageDiv.empty();
						}
					}
				}); 
				 
			}
			$('#reloadpage_num').val(localStorage.getItem("lastpageNum"));
			$('#baclist_num').val(localStorage.getItem("lastTab"));
			localStorage.clear();
		});
		

	$("#baclist").change(function(){
		counter = 0;
		$('#reloadpage_num').val('0');
		var baclist_num  = $('#baclist').val();
		$('#baclist_num').val(baclist_num);
		var selectData = {};
		var pageCheck = {};
		var bacTable = $("#bacTable tbody");
		var pageDiv = $("#pageDiv");
		var tableHtml = "";
		var pageHtml = "";
		var pageNation = 10;
		var pageFirstBetween = 0;
		bacTable.empty();
		pageDiv.empty();
		
		selectData.bacSerial = $(this).val();
		selectData.betFirstNum = pageFirstBetween;
		selectData.betLastNum = pageListNum;
		pageCheck.bacSerial = $(this).val();
		
		$.ajax({
			url: "${path}/acc/bacSelectList.do",
			method: "get",
			data: selectData,
			dataType: "json",
			success:function(data){
				if(data.length > 0){
					console.log("data: " + data.length);
					
					for(var i = 0; i < data.length; i++){
						tableHtml += "<tr><td style='text-align:center;'>" + data[i].baclogTime + "</td><td style='text-align:center;'>" 
						+ data[i].bacDesc + "</td><td style='text-align:right;'>" 
						+ parseInt(data[i].inAmt).toLocaleString("en-US") + "</td><td style='text-align:right;'>"
					 	+ parseInt(data[i].outAmt).toLocaleString("en-US") + "</td><td style='text-align:right;'>"
					 	+ parseInt(data[i].balanceAmt).toLocaleString("en-US") + "</td><td style='text-align:center;'>"
					 	+ data[i].branchCode + "</td><td style='text-align:center;'>"
					 	+ data[i].logRemark + "</td><td style='text-align:center;'>"
					 	+ data[i].linkDoc + "</td>";
                         if(parseInt(data[i].inAmt) > parseInt(data[i].outAmt)){
                             if(data[i].linkDoc != '' && data[i].linkDoc != null){
                                 tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' data-id='"+data[i].linkDoc+"' onclick='cancelconnect(this)'>취소</button></td>";
                             }else{
                                 tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatS' type='button' id='bacVatSBtn' data-toggle='modal' data-target='#bacVatSModal' data-id='"+data[i].baclogId+"'>연결</button></td>";    
                             }
                         }else{
                             if(data[i].linkDoc != '' && data[i].linkDoc != null){
                                 tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' data-id='"+data[i].linkDoc+"' onclick='cancelconnect(this)'>취소</button></td>";
                             }else{
                                tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatB' type='button' id='bacVatBBtn' data-toggle='modal' data-target='#bacVatBModal' data-id='"+data[i].baclogId+"'>연결</button></td>";
                             }
                         }
					 	
					 	/* if(parseInt(data[i].inAmt) > parseInt(data[i].outAmt)){
					 		tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatS' type='button' id='bacVatSBtn' data-toggle='modal' data-target='#bacVatSModal' data-id='"+data[i].baclogId+"'>연결</button></td>";
						}else{
							tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatB' type='button' id='bacVatBBtn' data-toggle='modal' data-target='#bacVatBModal' data-id='"+data[i].baclogId+"'>연결</button></td>";
						}  */
							}
							bacTable.html(tableHtml);
						}else{
							bacTable.html("");
						}
				}
			});
			
			$.ajax({
				url: "${path}/acc/bacSelectListCnt.do",
				method: "post",
				data: pageCheck,
				dataType: "json",
				success:function(data){
					console.log(data.resultCount);
					if(data.resultCount > 0){
						var count = parseInt(data.resultCount/pageListNum);
						var countRe = parseInt(data.resultCount/pageListNum);
						pageHtml = "";
						
						pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
						
						if(count > pageNation){
							for(var j = 1; j <= pageNation; j++){
								pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
							}
							pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
						}else{
							if(countRe > 0){
								countRe = countRe + 1;
							}else{
								countRe = 0;
							}
							
							for(var j = 1; j <= countRe; j++){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
							}
						}
						
						pageDiv.html(pageHtml);
					}else{
						pageDiv.empty();
					}
				}
			});
			
			setTimeout(function(){
				$.LoadingOverlay("hide", true);
			}, 1000);
		});	
			
		function pageClick(e){
			var selectData = {};
			var pageCheck = {};
			var bacTable = $("#bacTable tbody");
			var pageDiv = $("#pageDiv");
			var tableHtml = "";
			var pageNation = 10;
			var pageSetNum = pageListNum * (parseInt($(e).html()) - 1);
			var pagememoryNum = (pageSetNum/15)
			$('#reloadpage_num').val(pagememoryNum);
			bacTable.html("");

			selectData.bacSerial = $("#baclist_num").val();
			selectData.betFirstNum = pageSetNum;
			selectData.betLastNum = pageListNum;
			pageCheck.bacSerial = $('#baclist_num').val();
			
			$.ajax({
				url: "${path}/acc/bacSelectList.do",
				method: "get",
				data: selectData,
				dataType: "json",
				success:function(data){
					if(data.length > 0){
						for(var i = 0; i < data.length; i++){
							tableHtml += "<tr><td style='text-align:center;'>" + data[i].baclogTime + "</td><td style='text-align:center;'>" 
							+ data[i].bacDesc + "</td><td style='text-align:right;'>" 
							+ parseInt(data[i].inAmt).toLocaleString("en-US") + "</td><td style='text-align:right;'>"
						 	+ parseInt(data[i].outAmt).toLocaleString("en-US") + "</td><td style='text-align:right;'>"
						 	+ parseInt(data[i].balanceAmt).toLocaleString("en-US") + "</td><td style='text-align:center;'>"
						 	+ data[i].branchCode + "</td><td style='text-align:center;'>"
						 	+ data[i].logRemark + "</td><td style='text-align:center;'>"
						 	+ data[i].linkDoc + "</td>";
							
							 if(parseInt(data[i].inAmt) > parseInt(data[i].outAmt)){
                                 if(data[i].linkDoc != '' && data[i].linkDoc != null){
                                     tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' data-id='"+data[i].linkDoc+"' onclick='cancelconnect(this)'>취소</button></td>";
                                 }else{
                                     tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatS' type='button' id='bacVatSBtn' data-toggle='modal' data-target='#bacVatSModal' data-id='"+data[i].baclogId+"'>연결</button></td>";    
                                 }
                             }else{
                                 if(data[i].linkDoc != '' && data[i].linkDoc != null){
                                     tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' data-id='"+data[i].linkDoc+"' onclick='cancelconnect(this)'>취소</button></td>";
                                 }else{
                                    tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatB' type='button' id='bacVatBBtn' data-toggle='modal' data-target='#bacVatBModal' data-id='"+data[i].baclogId+"'>연결</button></td>";
                                 }
                             }					
						}
						bacTable.html(tableHtml);
					}else{
						bacTable.html("");
					}
				}
			});
			//수정 진횅중입니다.
			$.ajax({
				url: "${path}/acc/bacSelectListCnt.do",
				method: "post",
				data: pageCheck,
				dataType: "json",
				success:function(data){
					console.log(data.resultCount);
					if(data.resultCount > 0){
						var count = parseInt(data.resultCount/pageListNum);
						var countRe = parseInt(data.resultCount/pageListNum);
						var hide_next_button = counter*10;
						pageHtml = "";
						
						pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";

						if(count > pageNation){
							for(var j = 1+counter*10; j <= pageNation*(counter+1); j++){
								if(j <= count+1){
									if(j-1 == $('#reloadpage_num').val()){
										pageHtml += "<li class='page-item active' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
									}else{
										pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";	
									}
								}
							}
							if(hide_next_button+10 < count){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
							}
						}else{
							 if(countRe > 0){
								countRe = countRe + 1;
							}else{
								countRe = 0;
							}
							
							for(var j = 1; j <= countRe; j++){
								if(j-1 == $('#reloadpage_num').val()){
									pageHtml += "<li class='page-item active'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
								}else{
									pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
								}
							} 
						}
						
						pageDiv.html(pageHtml);
					}else{
						pageDiv.empty();
					}
				}
			});
			//수정 진횅중입니다.
		}	
		
		function pagePrevious(e){
			if(counter != 0){
			counter--;
			var selectData = {};
			var pageCheck = {};
			var bacTable = $("#bacTable tbody");
			var pageDiv = $("#pageDiv");
			var tableHtml = "";
			var pageHtml = "";
			var pageNation = 10;
			var pageFirstBetween = 0;
			bacTable.empty();
			pageDiv.empty();
			
			selectData.bacSerial = $('#baclist_num').val();
			selectData.betFirstNum = counter*150;
			selectData.betLastNum = pageListNum;
			pageCheck.bacSerial = $('#baclist_num').val();
			$.ajax({
				url: "${path}/acc/bacSelectList.do",
				method: "get",
				data: selectData,
				dataType: "json",
				success:function(data){
					if(data.length > 0){
						console.log("data: " + data.length);
						
						for(var i = 0; i < data.length; i++){
							tableHtml += "<tr><td style='text-align:center;'>" + data[i].baclogTime + "</td><td style='text-align:center;'>" 
							+ data[i].bacDesc + "</td><td style='text-align:right;'>" 
							+ parseInt(data[i].inAmt).toLocaleString("en-US") + "</td><td style='text-align:right;'>"
						 	+ parseInt(data[i].outAmt).toLocaleString("en-US") + "</td><td style='text-align:right;'>"
						 	+ parseInt(data[i].balanceAmt).toLocaleString("en-US") + "</td><td style='text-align:center;'>"
						 	+ data[i].branchCode + "</td><td style='text-align:center;'>"
						 	+ data[i].logRemark + "</td><td style='text-align:center;'>"
						 	+ data[i].linkDoc + "</td>";
							
							if(parseInt(data[i].inAmt) > parseInt(data[i].outAmt)){
                                if(data[i].linkDoc != '' && data[i].linkDoc != null){
                                    tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' data-id='"+data[i].linkDoc+"' onclick='cancelconnect(this)'>취소</button></td>";
                                }else{
                                    tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatS' type='button' id='bacVatSBtn' data-toggle='modal' data-target='#bacVatSModal' data-id='"+data[i].baclogId+"'>연결</button></td>";    
                                }
                            }else{
                                if(data[i].linkDoc != '' && data[i].linkDoc != null){
                                    tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' data-id='"+data[i].linkDoc+"' onclick='cancelconnect(this)'>취소</button></td>";
                                }else{
                                   tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatB' type='button' id='bacVatBBtn' data-toggle='modal' data-target='#bacVatBModal' data-id='"+data[i].baclogId+"'>연결</button></td>";
                                }
                            }
						}
						bacTable.html(tableHtml);
					}else{
						bacTable.html("");
					}
				}
			});
			
			$.ajax({
				url: "${path}/acc/bacSelectListCnt.do",
				method: "post",
				data: pageCheck,
				dataType: "json",
				success:function(data){
					console.log(data.resultCount);
					if(data.resultCount > 0){
						var count = parseInt(data.resultCount/pageListNum);
						var countRe = parseInt(data.resultCount/pageListNum);
						pageHtml = "";
						
						pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
						
						if(count > pageNation){
							for(var j = 1+counter*10; j <= pageNation*(counter+1); j++){
								if(j == 1+counter*10){
									pageHtml += "<li class='page-item active' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
								}else{
									pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
								}
							}
							pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
						}else{
							if(countRe > 0){
								countRe = countRe + 1;
							}else{
								countRe = 0;
							}
							
							for(var j = 1; j <= countRe; j++){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
							}
						}
						
						pageDiv.html(pageHtml);
					}else{
						pageDiv.empty();
					}
				}
			});
			
			setTimeout(function(){
				$.LoadingOverlay("hide", true);
			}, 1000);
			}
		}
		
		function pageNext(e){
			counter++;
			var selectData = {};
			var pageCheck = {};
			var bacTable = $("#bacTable tbody");
			var pageDiv = $("#pageDiv");
			var tableHtml = "";
			var pageHtml = "";
			var pageNation = 10;
			var pageFirstBetween = 0;
			bacTable.empty();
			pageDiv.empty();
			
			selectData.bacSerial = $('#baclist_num').val();
			selectData.betFirstNum = counter*150;
			selectData.betLastNum = pageListNum;
			pageCheck.bacSerial = $('#baclist_num').val();
			
			$.ajax({
				url: "${path}/acc/bacSelectList.do",
				method: "get",
				data: selectData,
				dataType: "json",
				success:function(data){
					if(data.length > 0){
						console.log("data: " + data.length);
						
						for(var i = 0; i < data.length; i++){
							tableHtml += "<tr><td style='text-align:center;'>" + data[i].baclogTime + "</td><td style='text-align:center;'>" 
							+ data[i].bacDesc + "</td><td style='text-align:right;'>" 
							+ parseInt(data[i].inAmt).toLocaleString("en-US") + "</td><td style='text-align:right;'>"
						 	+ parseInt(data[i].outAmt).toLocaleString("en-US") + "</td><td style='text-align:right;'>"
						 	+ parseInt(data[i].balanceAmt).toLocaleString("en-US") + "</td><td style='text-align:center;'>"
						 	+ data[i].branchCode + "</td><td style='text-align:center;'>"
						 	+ data[i].logRemark + "</td><td style='text-align:center;'>"
						 	+ data[i].linkDoc + "</td>";
							
							if(parseInt(data[i].inAmt) > parseInt(data[i].outAmt)){
                                if(data[i].linkDoc != '' && data[i].linkDoc != null){
                                    tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' data-id='"+data[i].linkDoc+"' onclick='cancelconnect(this)'>취소</button></td>";
                                }else{
                                    tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatS' type='button' id='bacVatSBtn' data-toggle='modal' data-target='#bacVatSModal' data-id='"+data[i].baclogId+"'>연결</button></td>";    
                                }
                            }else{
                                if(data[i].linkDoc != '' && data[i].linkDoc != null){
                                    tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' data-id='"+data[i].linkDoc+"' onclick='cancelconnect(this)'>취소</button></td>";
                                }else{
                                   tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatB' type='button' id='bacVatBBtn' data-toggle='modal' data-target='#bacVatBModal' data-id='"+data[i].baclogId+"'>연결</button></td>";
                                }
                            }
						}
						bacTable.html(tableHtml);
					}else{
						bacTable.html("");
					}
				}
			});
			
			$.ajax({
				url: "${path}/acc/bacSelectListCnt.do",
				method: "post",
				data: pageCheck,
				dataType: "json",
				success:function(data){
					console.log(data.resultCount);
					if(data.resultCount > 0){
						var count = parseInt(data.resultCount/pageListNum);
						var countRe = parseInt(data.resultCount/pageListNum);
						var hide_next_button = counter*10
						pageHtml = "";
						pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
						
						if(count > pageNation){
							for(var j = 1+counter*10; j <= pageNation*(counter+1); j++){
								if(j <= count+1){
									if(j == 1+counter*10){
										pageHtml += "<li class='page-item active' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
									}else{
										pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";	
									}
								}
							}
							if(hide_next_button+10 < count){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
							}
						}else{
							if(countRe > 0){
								countRe = countRe + 1;
							}else{
								countRe = 0;
							}
							
							for(var j = 1; j <= countRe; j++){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
							}
						}
						
						pageDiv.html(pageHtml);
					}else{
						pageDiv.empty();
					}
				}
			});
			
			setTimeout(function(){
				$.LoadingOverlay("hide", true);
			}, 1000);
			
		};
		
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
		<!-- hide and show -->
		
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
        $('#soppModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
		
        $('#bacVatBModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			localStorage.setItem("thisId", button.attr("data-id"));
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
		$('#bacVatSModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			localStorage.setItem("thisId", button.attr("data-id"));
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
		$('#bacVatBModal').on('hidden.bs.modal', function(e) {
			localStorage.setItem("thisId", $(e).attr("data-id"));
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').html("");
		});
		
		$('#bacVatSModal').on('hidden.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').html("");
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

        function fnSetSoppData(a, b) {
            $("#soppNo").val(b);
            $("#soppTitle").val(a);
            $(".modal-backdrop").remove();
            $("#soppModal").modal("hide");
        }

        function fnChgStatus(){
            $Aarr=$(".vatSno");
            $Barr=$(".vatStchg");
            $Carr=$(".vatTyp");
            for (var i=0; i<$Barr.length; i++) {
                if ($($Barr[i]).is(":checked") == true) {
                    var vatData = {};
                    vatData.vatSerial = $Aarr[i].innerText;
                    if ($Carr[i].innerText == '매입'){
                        vatData.vatStatus = 'B5';
                    }else{
                        vatData.vatStatus = 'S5';
                    }
                    $.ajax({
                        url : "${path}/acc/vatStatuschg.do",
                        data : vatData,
                        method : "POST",
                        dataType: "json"
                    })
                        .done(function(){
                        });
                }
                alert("변경 처리 완료");
            }
        }
        var lastTab = localStorage.getItem('lastTab');
        var lastpageNum = localStorage.getItem('lastpageNum');
        
		if (lastTab) {
		  	$('[href="'+ lastTab + lastpageNum +'"]').tab('show');
		}
        function cancelconnect(e) {
            if(confirm("취소처리 하시겠습니까?")){
                var baclisthideNum = $('#baclisthideNum').val(); 
                $.ajax({
                      url : "${path}/acc/cancelconnect.do/" +$(e).attr("data-id"),
                    method : "POST",
                    dataType: "json"
                });
                alert("취소처리가 완료되었습니다.");
                localStorage.setItem('lastTab', $('#baclist_num').val());
                localStorage.setItem('lastpageNum', $('#reloadpage_num').val());
                location.href="${path}/acc/bacdetail.do";
            }else {
                return false;
            }
        }
		
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>