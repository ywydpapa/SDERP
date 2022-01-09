<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top2.jsp"/>

<div id="main_content">
    <!-- Page-header start 페이지 타이틀-->
    <div class="page-header2">
        <div class="row align-items-end">
            <div class="col-lg-12">
                <div class="page-header-title">
                    <div class="d-inline">
                        결제서류 상세보기
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Page-header end 페이지 타이틀 -->

    <!--계약등록-->
    <div class="cnt_wr">
        <h5 class="cont_title"><i class="icofont icofont-square-right"></i>결제정보</h5>
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <input type="hidden" id="compNo" value="${sessionScope.compNo}" />
                        <input type="hidden" id="docUserNo" value="${sessionScope.userNo}" />
                        <input type="hidden" id="docNo" value="${detailList.docNo}" />
                        <input type="hidden" id="userNoCR" value="${detailListApp.userNoCR}" />
                        <table class="table table-sm bst02">
                            <colgroup>
                                <col width="15%" />
                                <col width="35%"/>
                                <col width="15%"/>
                                <col width="35%"/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="text-center">결제 문서 종류</th>
                                <td colspan="3">
                                    <div class="form-radio">
                                        <form>
                                            <div class="radio radio-inline">
                                                <label> <input type="radio" name="contractType" value="BREQ" checked="checked"> <i class="helper"></i>지출품의서</label>
                                            </div>
                                            <div class="radio radio-inline">
                                                <label> <input type="radio" name="contractType" value="TREQ"> <i class="helper"></i>지출결의서</label>
                                            </div>
                                            <div class="radioLabel radio-inline">
                                                <label style="color:red;"></label>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="contDetailSopp text-center">연결프로젝트(영업기회)</th>
                                <td class="contDetailSopp">
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="soppDTO" id="soppTitle" value="${detailList.soppTitle}" readonly/>
                                        <input type="hidden" class="form-control" name="soppDTO" id="soppNo" value="${detailList.linkSoppNo}" />
                                        <span class="input-group-btn">
												<button class="btn btn-primary sch-opportunity2"
                                                        data-remote="${path}/modal/popup.do?popId=sopp"
                                                        type="button" data-toggle="modal" data-target="#soppModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
                                        <div class="modal fade " id="soppModal" tabindex="-1"
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
                                                        <h5>영업기회목록</h5>
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
                                </td>
                                <th class="text-center">거래처</th>
                                <td>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="custName"
                                               id="custName" value="${detailList.custName}" readonly> <input
                                            type="hidden" name="custNo" id="custNo" value="${detailList.linkCustNo}" /> <span class="input-group-btn">
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
                                                        <h4 class="modal-title">거래처검색</h4>
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
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">문서번호(자동 생성)</th>
                                <td>
                                    <input type="text" class="form-control" id="estId" value="VTEK_2022${detailList.docNo}" readonly>
                                </td>
                                <th class="text-center requiredTextCss">문서제목(*)</th>
                                <td>
                                    <input type="text" class="form-control" id="docTitle" value="${detailList.docTitle }">
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center requiredTextCss">문서종류(*)</th>
                                <td>
                                    <select class="form-control" id="docType" >
                                        <option value="">선택</option>
                                        <option value="BUY">물품 구매요청서</option>
                                        <option value="TRS">지출품의서</option>
                                    </select>
                                </td>
                                <th class="text-center requiredTextCss">작성일자(*)</th>
                                <td>
                                    <input type="date" id="docDate" name="docDate" class="form-control" style="text-align: right;" value="${detailList.docDate}">
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">첨부파일</th>
                                <td>
                                    <input class="form-control" type="file" id="addFile">
                                </td>
                                <th class="text-center">파일다운로드</th>
                                <td>
                                    <a href="javascript:downloadFile('${detailFile.fileId}');">${detailFile.fileName}</a>
                                </td>
                            </tr>
                            <tr>
                            	<th class="text-center requiredTextCss">결제자(*)</th>
                                <td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="userName"
											id="userName" value="${detailListApp.userName}" readonly> <input type="hidden"
											name="userNo" id="userNo" value="${detailListApp.userNoAPP}"> <span
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
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">상세 내용</th>
                                <td colspan="3"><textarea class="form-control" id="docDesc">${detailList.docDesc}</textarea></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="table-responsive" style="overflow-x: hidden;">
                            <jsp:include page="/WEB-INF/views/module/inputSet/inputSetDoc.jsp"/>
                            <jsp:include page="/WEB-INF/views/gware/docdtaillist.jsp"/>
                        </div>
                        <c:if test="${detailList.docStatus ne 1 }">
                        <c:if test="${sessionScope.userNo eq detailListApp.userNoAPP || sessionScope.userNo eq detailListApp.userNoCR}">
                        	<c:set var="now" value="<%=new java.util.Date()%>" />
                        	<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set>
                        	<input type="hidden" id="appDate" value="${sysDate}" />
	                        <div>
	                        	<table class="table table-sm">
		                        	<tr>
										<th scope="row">승인/반려 의견<br />
											<c:choose>
												<c:when test="${detailListApp.appDate != null && detailListApp.appDate != ''}">
													(시간 : ${detailListApp.appDate})
												</c:when>
												<c:otherwise>
													(시간 : 없음)
												</c:otherwise>
											</c:choose>
										</th>
										<td colspan="3"><textarea name="appComment" id="appComment" rows="8" class="form-control">${detailListApp.appComment}</textarea></td>
									</tr>
	                        	</table>
	                        </div>
                        </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="btn_wr text-right mt-3">
        <button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/gw/list.do'">결재목록</button>
        <c:if test="${sessionScope.userNo eq detailListApp.userNoAPP && detailList.docStatus == 2}">
	        <button class="btn btn-md btn-success" onClick="fn_data02App()">승인</button>
	        <button class="btn btn-md btn-danger" onClick="fn_data02Com()">반려</button>
        </c:if>
        <c:if test="${sessionScope.userNo eq detailListApp.userNoCR && detailList.docStatus == 2}">
	        <button class="btn btn-md btn-primary" onClick="fn_data02Update()">수정</button>
        	<button class="btn btn-md btn-danger" onClick="fn_data02delete()">삭제</button>
        </c:if>
        <c:if test="${sessionScope.userNo eq detailListApp.userNoCR && detailList.docStatus == 1}">
            <button class="btn btn-md btn-primary" onClick="fn_tempUpdate()">임시저장</button>
            <button class="btn btn-md btn-primary" onClick="fn_data02Update()">수정</button>
            <button class="btn btn-md btn-danger" onClick="fn_data02delete()">삭제</button>
        </c:if>
        <button class="btn btn-md btn-inverse" onClick="javascript:location='${path}/gw/list.do'">취소</button>
    </div>
    <!--//계약등록-->

    <script>
        $('#custModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });

        $(".radioLabel").hide();

        $("[name='contractType']").change(function(){
            if($(this).val() === "NFORM"){
                $(".contDetailSopp").hide();
                $(".radioLabel").show();
            }else{
                $(".radioLabel").hide();
                $(".contDetailSopp").show();
            }
        });

        $('#soppModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });

        $('#contModal').on('show.bs.modal', function(e) {
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

        function fnSetproductdata(a,b){
            $("#productNo1").val(a);
            $("#data01Title").val(b);
            //$(".modal-backdrop").remove();
            //$("#productdataModal").modal("hide");
            // 모달이 정상적으로 제거되지않아 close 버튼 트리거로 구성함
            $("#productdataModal1").find(".modal-footer button").trigger('click');
        }

        function fnSetSoppData(a, b) {
            $("#soppNo").val(b);
            $("#soppTitle").val(a);
            $("#soppModal").modal("hide");
        }

        function fnSetproductdata2(a,b){
            $("#productNo2").val(a);
            $("#data02Title").val(b);
            $("#productdataModal2").find(".modal-footer button").trigger('click');
        }

        $(document).ready(function() {
        	var contractType = "${detailList.docFormNo}";
        	var docType = "${detailList.docType}";
        	
        	$("[name='contractType'][value='"+contractType+"']").attr("checked", true);
        	$("#docType").val(docType);
        });
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>
