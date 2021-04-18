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
					기초코드(03)수정
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->

<div class="cnt_wr">
	<!-- Row start -->
	<div class="row">
		<div class="col-lg-12 col-xl-12">
				<div class="tab-pane " id="tab03" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name = "form3" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<colgroup>
										<col width="25%" />
										<col width="75%"/>
									</colgroup>				
									<tbody>
										<tr>
											<th scope="row">상위코드 02</th>
											<td>
											<input name="codeNo" id ="codeNo" value="${dto.codeNo}" type="hidden">
											<input name="code32" id ="code32" value="${dto.code02}" class="form-control form-control-sm" readonly>
											</td>
										</tr>
										<tr>
											<th scope="row">기초코드03</th>
											<td>
												<input name="code03" id ="code03" value="${dto.code03}" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">기초코드 표시명</th>
											<td>
												<input name="desc03" id ="desc03" value="${dto.desc03}" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">기초코드 값</th>
											<td>
												<input name="value03" id ="value03" value="${dto.value03}" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">표시순서</th>
											<td>
												<input name="sortNo" id ="sortNo" value="${dto.sortNo}" type="number" min="101" max="199" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">사용여부</th>
											<td>
												<select id="attrib" class="form-control">
												<option value = "10001"<c:if test="${dto.attrib eq '10001'}">selected</c:if>>예</option>
												<option value = "XXXXX"<c:if test="${dto.attrib eq 'XXXXX'}">selected</c:if>>아니오</option>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left" onClick="javascript:fnSetPage('${path}/code/list.do')">목록</button>
								<button class="btn btn-md btn-primary" value="수정" id="btnUpdate" onClick= "fn_codeInsert03()" >등록</button>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Row end -->
<script>

function fn_codeInsert03() {
	var codeData = {};
	codeData.codeNo 			= $("#codeNo").val();
	codeData.code03 			= $("#code03").val();
	codeData.desc03 			= $("#desc03").val();
	codeData.value03 			= $("#value03").val();
	codeData.sortNo 			= $("#sortNo").val();
	codeData.attrib 			= $("#attrib").val();

	$.ajax({ url: "${path}/code/update03.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					fnSetPage('${path}/code/write.do');
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
	}


</script>

                                                