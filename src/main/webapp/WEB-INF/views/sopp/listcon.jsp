<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<script>
$(function(){
    $('#soppTable').DataTable({
    	info:false
    });
});
</script>
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
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="userName">담당사원</label>
							<jsp:include page="/WEB-INF/views/module/input/inputActiveUser.jsp"/>
						</div>
						<!--//담당자-->
						<!--거래처-->
						<div class="col-sm-12 col-xl-3">
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
												<h4 class="modal-title">거래처검색</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<h5>거래처목록</h5>
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
						<!--매출예정일-->
						<div class="col-sm-12 col-xl-6">
							<label class="col-form-label" for="targetDate">매출예정일</label>
							<p class="input_inline mb-0"><input class="form-control form-control-sm col-xl-6" type="date" id="targetDatefrom"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="targetDateto">
							</p>
						</div>
						<!--//매출예정일-->
					</div>
					<!--//row-->
					<div class="form-group row">
						<div class="col-sm-12 col-xl-4">
							<label class="col-form-label" for="soppSrate">가능성</label>
							<select class="form-control form-control-sm" name="soppSrate" id="soppSrate" title="선택">
								<option value="">선택</option>
								<option value="49">50%미만</option>			
								<option value="50">50%이상</option>			
							</select>
						</div>
						<div class="col-sm-12 col-xl-4">
							<label class="col-form-label" for="soppType">영업타입</label>
							<select name="select" class="form-control form-control-sm" id="soppType">
								<option value="">선택</option>
								<option value="01">신규</option>			
								<option value="02">노후화교체</option>			
								<option value="03">윈백</option>			
								<option value="04">증설</option>			
								<option value="05">이중화</option>			
								<option value="06">조달구매</option>			
								<option value="99">기타</option>	
							</select>
						</div>
						<div class="col-sm-12 col-xl-4">
							<label class="col-form-label" for="soppStatus">진행단계</label>
							<select class="form-control form-control-sm" name="soppStatus" id="soppStatus" title="선택">
								<option value="">선택</option>
								<option value="01">영업정보파악</option>			
								<option value="20">초기접촉</option>			
								<option value="30">제안서제출 및 PT</option>			
								<option value="40">견적서제출</option>			
								<option value="50">계약요청</option>			
								<option value="60">수주</option>			
								<option value="80">매출</option>			
								<option value="85">수금완료</option>			
								<option value="86">은행입금</option>			
								<option value="90">계약실패</option>			
								<option value="91">발주서입수</option>			
								<option value="92">협력사요청</option>				
							</select>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!--//영업기회조회-->

 <!--리스트 table-->
<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table id="soppTable" class="table table-striped table-bordered nowrap ">
						<colgroup>
							<col width="1%"/>
							<col width="20%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="15%"/>
							<col width="15%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="9%"/>
						</colgroup>							
						<thead>
							<tr>
								<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
								<th>영업기회</th>
								<th>거래처</th>
								<th>담당사원</th>
								<th>예상매출액</th>
								<th>진행단계</th>
								<th>매출예정일</th>
								<th>가능성</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${list}">
							<tr>
								<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
								<td><a href="javascript:fnSetPage('${path}/sopp/detail/${row.soppNo}')">${row.soppTitle}<span class="sales_n"></span></td>
								<td>${row.custName}</td>
								<td>${row.userName}</td>
								<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.soppTargetAmt}" /></td>
								<td>${row.soppStatus}</td>
								<td class="text-right">${row.soppTargetDate}</td>
								<td class="text-right">${row.soppSrate}<span>%</span></td>
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
    	function fnClearall(){
    		$("#searchForm").each(function(){
    			this.reset();
    		});
    	}

    	function fnListcon() {
    		var soppData = {};
    	 	var userNo = $("#userNo").val();
    	 	if (userNo){
    			soppData.userNo 		= $("#userNo").val();
    		}
 			fnSetPage('${path}/sopp/listcon.do', soppData);
   		}
</script>

