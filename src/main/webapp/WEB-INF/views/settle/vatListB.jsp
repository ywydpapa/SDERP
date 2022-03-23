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

<div id="main_content">
	
	<script>
	$(function(){
		$('#vatTable').DataTable({
			info:false,
			searching: true,
			order: [[ 0, "desc" ]],
		});
	});
	</script>
	
    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">매입 계산서 조회</h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                        <!-- hide and show -->
						<button class="btn btn-sm btn-success" style="display:none;" id="fold" onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" style="display:none;" id="fold2"  onclick="acordian_action1()" style="display:none;">접기</button>
						<!-- hide and show -->
                        <button class="btn btn-sm btn-inverse" style="display:none;" onClick="javascript:fnClearall()">
                        	<i class="icofont icofont-spinner-alt-3"></i>초기화
                        </button>
                        <button class="btn btn-sm btn-primary" style="display:none;" onClick="javascript:fnListcon()">
                        	<i class="icofont icofont-search"></i>검색
                        </button>
                        <button class="btn btn-sm btn-danger" onClick="javascript:fnChgStatus()">
                        	상태변경
                        </button>
                        <button class="btn btn-sm btn-outline"onClick="javascript:location='${path}/acc/vatupload.do'">
                        	<i class="icofont icofont-pencil-alt-2"></i>계산서 등록
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!--Page-header end 페이지 타이틀 -->
        <!--영업활동조회-->
        <div class="cnt_wr" id="acordian" style="display:none;">
            <div class="row">
                <form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
                    <div class="col-sm-12">
                        <div class="card_box sch_it">
                            <div class="form-group row">
                            	<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">거래처</label>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="vatSellerName" id="vatSellerName" value="${param.vatSellerName}" readonly />
										<input type="hidden" name="vatSellerCustNo" id="vatSellerCustNo" value="${param.vatSellerCustNo}" />
										<span class="input-group-btn">
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
														<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="salesType">처리 상태</label>
                                    <select name="select" class="form-control form-control-sm" id="salesType">
                                        <option>선택</option>
                                        <c:forEach var = "acttype" items="${acttype}">
                                            <option value="${acttype.codeNo}">${acttype.desc03}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <!-- <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="vatType">매입/매출</label>
                                    <select name="select" class="form-control form-control-sm" id="vatType">
                                        <option value="">선택</option>
                                        <option value="B">매입</option>
                                        <option value="S">매출</option>
                                    </select>
                                </div> -->
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12 col-xl-4">
                                    <label class="col-form-label">등록일</label>
                                    <p class="input_inline">
                                    	<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" id="vatIssueDateFrom" value="${param.vatIssueDateFrom}"/>
                                    		~ 
                                    	<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="vatIssueDateTo" value="${param.vatIssueDateTo}"/>
                                    </p>
                                </div>
                                <div class="col-sm-12 col-xl-3">
									<label class="col-form-label">발행번호</label>
									<input type="text" class="form-control form-control-md" id="vatSerial" name="" placeholder="" value="${param.vatSerial}">
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">메모</label>
									<input type="text" class="form-control form-control-md" id="vatRemark" name="" placeholder="" value="${param.vatRemark}">
								</div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--//영업활동조회-->
    </c:if>

    <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="vatTable" class="table table-striped table-bordered nowrap ">
                            <colgroup>
                                <col width="10%"/>
                                <col width="5%"/>
                                <col width="7%"/>
                                <col width="7%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">등록일</th>
                                <th class="text-center">매입/매출</th>
                                <th class="text-center">거래처</th>
                                <th class="text-center">발행번호</th>
                                <th class="text-center">상태</th>
                                <th class="text-center">공급가</th>
                                <th class="text-center">세액</th>
                                <th class="text-center">합계금액</th>
                                <th class="text-center">연결문서(합계금액)</th>
                                <th class="text-center">메모</th>
                            </tr>
                            </thead>
                            <c:forEach items="${vatList}" var="vlist">
                                <tr>
                                <td class="text-center">${vlist.vatIssueDate}</td>
                                    <td class="text-center vatTyp">
                                    	<%-- <c:if test = "${vlist.vatType eq 'B'}">매입</c:if>
                                    	<c:if test = "${vlist.vatType eq 'S'}">매출</c:if> --%>
                                    	매입
                                    </td>
                                    <td class="text-center">
                                    	<%-- <c:if test = "${vlist.vatType eq 'S'}">${vlist.vatBuyerName}</c:if> 
                                    	<c:if test = "${vlist.vatType eq 'B'}">${vlist.vatSellerName}</c:if> --%>
                                    	${vlist.vatSellerName}
                                   	</td>
                                    <td class="text-center vatSno">${vlist.vatSerial}</td>
                                    <td class="text-center">
                                    	<c:if test = "${vlist.vatStatus eq 'B1'}">매입발행</c:if>
                                    	<c:if test = "${vlist.vatStatus eq 'B3'}">지급처리중</c:if>
                                    	<c:if test = "${vlist.vatStatus eq 'B5'}">지급완료</c:if>
                                        <%-- <c:if test = "${vlist.vatStatus eq 'S1'}">매출발행</c:if>
                                        <c:if test = "${vlist.vatStatus eq 'S3'}">수금처리중</c:if>
                                        <c:if test = "${vlist.vatStatus eq 'S5'}">수금완료</c:if> --%>
                                        <input type="checkbox" class="vatStchg">
                                    </td>
                                    <td class="text-right">
                                    	<fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.vatAmount}" />
                                    </td>
                                    <td class="text-right">
                                    	<fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.vatTax}" />
                                    </td>
                                    <td class="text-right">
                                    	<fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.vatAmount + vlist.vatTax}" />
                                    </td>
                                    <td class="text-right">
                                    	<a data-remote="${path}/modal/popup1.do?popId=${vlist.vatSerial}" type="button" data-toggle="modal" data-target="#userModal1" style="cursor: pointer; text-decoration: underline;">
                                    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.vatSum}" />
                                    	</a>
                                    </td>
                                    <td>${vlist.vatRemark}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <!-- model -->
                <div class="modal fade " id="userModal1" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-80size" role="document">
						<div class="modal-content modal-80size">
							<div class="modal-header">
								<h4 class="modal-title">연결문서(합계금액)</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						<div class="modal-body">
							<h5>연결문서(합계금액)</h5>
							<p>Loading!!!</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
						</div>
						</div>
					</div>
				</div>
				<!-- model -->
            </div>
        </div>
    </div>
    <script>
    	var vatType = "${param.vatType}";
		
    	if(vatType !== ""){
    		$("#vatType").val(vatType);
    	}
    
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
        $('#userModal1').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        
        function fnListcon() {
    		var vatData = {};
    		vatData.vatSellerCustNo = $("#vatSellerCustNo").val() ? Number($("#vatSellerCustNo").val()) : 0;
    		vatData.vatSellerName = $("#vatSellerName").val() ? $("#vatSellerName").val() : null;
    		vatData.vatType = $("#vatType").val() ? $("#vatType").val() : null;
    		vatData.vatIssueDateFrom = $("#vatIssueDateFrom").val() ? $("#vatIssueDateFrom").val() : null;
    		vatData.vatIssueDateTo = $("#vatIssueDateTo").val() ? $("#vatIssueDateTo").val() : null;
    		vatData.vatSerial = $("#vatSerial").val() ? $("#vatSerial").val() : null;						// 판매방식
    		vatData.vatRemark = $("#vatRemark").val() ? $("#vatRemark").val() : null;
    		
    		var param = "?";
    		var paramFirst = true;
    		for (variable in vatData) {
    			console.log("key: " + variable + ", value: " + vatData[variable]);
    			if(vatData[variable] != null && vatData[variable] != 0) {
    				if(paramFirst){
    					param = param + variable + "=" + vatData[variable];
    					paramFirst = false;
    				} else {
    					param = param + "&" + variable + "=" + vatData[variable];
    				}
    			}
    		}

    		if(param == "?"){
    			param = "";
    		}
    		
    		if(document.querySelector('#acordian').style.cssText == "display: none;"){
    			var testAco1 = document.querySelector('#acordian').style.cssText;
    			localStorage.setItem('lastAco1', testAco1);	
    		}else {
    			var testAco2 = document.querySelector('#acordian').style.cssText;
    			localStorage.setItem('lastAco2', testAco2);
    		}

    		var url = '${path}/acc/vatlistB.do'+param;
    		location.href = url;
    	}
    	
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

        function fnSetCustData(a, b) {
            $("#vatSellerCustNo").val(b);
            $("#vatSellerName").val(a);
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
            }
            alert("변경 처리 완료");
            location.href = location.href;
        }
        
    	$(document).ready(function() {
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