<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
    <!-- data tables css -->
	<link rel="stylesheet" href="${path}/assets/css/plugins/dataTables.bootstrap4.min.css">
	<!-- datatable Js -->
	<script src="${path}/assets/pages/jquery.dataTables.min.js"></script>
	<script src="${path}/assets/pages/dataTables.bootstrap4.min.js"></script>
<script>
$(function(){
    $('#schedTable').DataTable({
    	info:false
    });
});
$(function(){
	$("#btnAdd").click(function(){
		location.href="${path}/product/write.do "
	});
});

</script>
	
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						일정조회
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->
	<!--일정조회-->
<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="card_box sch_it">
				<div class="btn_wr text-right">
					<button class="btn btn-sm btn-inverse">
						<i class="icofont icofont-spinner-alt-3"></i>초기화
					</button>
					<button class="btn btn-sm btn-primary">
						<i class="icofont icofont-search"></i>검색
					</button>
					<button class="btn btn-sm btn-outline"
						onClick="javascript:fnSetPage('${path}/sales/write.do')">
						<i class="icofont icofont-pencil-alt-2"></i>등록
					</button>
				</div>
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
								id="soppTitle" value="" readonly /> <input type="hidden"
								name="soppNo" id="soppNo" value="" /> <span
								class="input-group-btn">
								<button class="btn btn-primary sch-company"
									data-remote="${path}/modal/popup.do?popId=sopp" type="button"
									data-toggle="modal" data-target="#soppModal">
									<i class="icofont icofont-search"></i>
								</button>
							</span>
							<div class="modal fade " id="soppModal" tabindex="-1"
								role="dialog">
								<div class="modal-dialog modal-80size" role="document">
									<div class="modal-content modal-80size">
										<div class="modal-header">
											<h4 class="modal-title">영업기회 검색</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<h5>영업기회 목록</h5>
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
						<label class="col-form-label" for="custName">거래처</label>
						<div class="input-group input-group-sm mb-0">
							<input type="text" class="form-control" name="custName"
								id="custName" value="" readonly /> <input type="hidden"
								name="custNo" id="custNo" value="" /> <span
								class="input-group-btn">
								<button class="btn btn-primary sch-company"
									data-remote="${path}/modal/popup.do?popId=cust" type="button"
									data-toggle="modal" data-target="#custModal">
									<i class="icofont icofont-search"></i>
								</button>
							</span>
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
											<button type="button" class="btn btn-default waves-effect "
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-xl-3">
						<label class="col-form-label" for="co_name">활동형태</label> <select
							name="select" class="form-control form-control-sm">
						<c:forEach var ="acttype" items="${acttype}">
						<option value = "${acttype.codeNo}">${acttype.desc03}</option>
						</c:forEach>
						</select>
					</div>

				</div>
				<div class="form-group row">
					<div class="col-sm-12 col-xl-6">
						<label class="col-form-label" for="co_name">활동일</label>
						<p class="input_inline">
							<input class="form-control form-control-sm col-xl-6" type="date">
							~ <input class="form-control form-control-sm col-xl-6"
								type="date">
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--일정조회-->
<!--회원리스트 table-->
<div class="cnt_wr" id="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table id="schedTable"
						class="table table-striped table-bordered nowrap ">
						<thead>
							<tr>
								<th>일정구분</th>
								<th>일정제목</th>
								<th>일정</th>
								<th>고객사</th>
								<th>담당자</th>
								<th>장소</th>
								<th>활동형태</th>
								<th>일정설명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${list}">
								<tr>
									<td>${row.schedTypeN}</td>
									<td><a
										href="javascript:fnSetPage('${path}/sched/detail/${row.schedNo}')">${row.schedTitle}</a></td>
									<td>${row.schedFrom}<span> ~ </span>${row.schedFrom}</td>
									<td>${row.custName}</td>
									<td>${row.userName}</td>
									<td><a
										href="javascript:fnSetPage('${path}/sched/detail/${row.schedNo}')">${row.schedPlace}</a></td>
									<td>${row.schedCatN}</td>
									<td><a
										href="javascript:fnSetPage('${path}/sched/detail/${row.schedNo}')">${row.schedDesc}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//table-->
