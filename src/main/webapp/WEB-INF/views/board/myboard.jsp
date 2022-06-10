<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/css/myboard/bodyContent.css" />

<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<script src="${path}/js/myboard/bodyContent.js"></script>

<div id="bodyContents">
	<div id="sideContents">
		<jsp:include page="../sidemenu/menu1.jsp" />
	</div>
	<div id="bodyContent">
		<div id="bodyNotice">
			<hr />
			<span>공지사항</span>
			<div id="noticeTableDiv">
				<table id="noticeTable" frame="void">
					<colgroup>
				        <col width="15%">
				        <col width="55%">
				        <col width="15%">
				        <col width="15%">
			    	</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th id="notiTitle">제목</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty noticelist}">
								<tr>
									<td colspan="4">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="row" items="${noticelist}">
									<tr>
										<td>${row.notiNo}</td>
										<td id="notiTitle"><a href="${path}/notice/detail/${row.notiNo}">${row.notiTitle}</a></td>
										<td>${row.userName}</td>
										<td>${row.regDatetime}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		
		<div id="bodySched">
			<hr />
			<span>일정조회</span>
			<div id="schedTableDiv">
				<table id="schedTable" frame="void">
					<colgroup>
				        <col width="15%">
				        <col width="25%">
				        <col width="30%">
				        <col width="35%">
			    	</colgroup>
					<thead>
						<tr>
							<th>작성일자</th>
							<th id="schedTitle">일정제목</th>
							<th id="schedTitle">일정설명</th>
							<th>일정</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty schedList}">
								<tr>
									<td colspan="4">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="row" items="${schedList}">
									<tr>
										<td>
											<fmt:parseDate value="${row.regDatetime}" var="regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>
										</td>
										<td id="schedTitle">${row.schedTitle}</td>
										<td id="schedTitle">${fn:substring(row.schedDesc, 0, 15)} ...</td>
										<td>${row.schedFrom} ~ ${row.schedTo}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		
		<div id="bodyMyDoc">
			<hr />
			<span>나의 문서함</span>
			<div id="myDocTableDiv">
				<table id="myDocTable" frame="void">
					<colgroup>
				        <col width="15%">
				        <col width="55%">
				        <col width="15%">
				        <col width="15%">
			    	</colgroup>
					<thead>
						<tr>
							<th>작성일자</th>
							<th id="myDocTitle">문서명</th>
							<th>금액</th>
							<th>진행상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty myList}">
								<tr>
									<td colspan="4">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="row" items="${myList}">
									<tr>
										<td>${row.regDate}</td>
										<td id="myDocTitle"><a href="${path}/gw/detail/${row.docNo}">${row.docTitle}</a></td>
										<td>￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.docAmount}" /></td>
										<td>
											<c:if test="${row.appStatus == 1}">임시저장</c:if>
	                                    	<c:if test="${row.appStatus == 2}">검토요청</c:if>
	                                    	<c:if test="${row.appStatus == 3}">반려</c:if>
	                                    	<c:if test="${row.appStatus == 4}">승인요청</c:if>
	                                    	<c:if test="${row.appStatus == 5}">승인완료</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		
		<c:if test="${sessionScope.docRole eq 'S'}">
			<div id="bodyDocList">
				<hr />
				<span>나의 결재함</span>
				<div id="docListTableDiv">
					<table id="docListTable" frame="void">
						<colgroup>
					        <col width="15%">
					        <col width="55%">
					        <col width="15%">
					        <col width="15%">
				    	</colgroup>
						<thead>
							<tr>
								<th>작성일자</th>
								<th id="docListTitle">문서명</th>
								<th>금액</th>
								<th>진행상태</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty myDocList}">
									<tr>
										<td colspan="4">데이터가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="row" items="${myDocList}">
										<c:if test="${row.appStatus == 4}">
											<tr>
												<td>${row.regDate}</td>
												<td id="docListTitle"><a href="${path}/gw/detail/${row.docNo}">${row.docTitle}</a></td>
												<td>￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.docAmount}" /></td>
												<td>승인요청</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
		
		<c:if test="${sessionScope.docRole eq 'A'}">
			<div id="bodyDocList">
				<hr />
				<span>나의 결재함</span>
				<div id="docListTableDiv">
					<table id="docListTable" frame="void">
						<colgroup>
					        <col width="15%">
					        <col width="55%">
					        <col width="15%">
					        <col width="15%">
				    	</colgroup>
						<thead>
							<tr>
								<th>작성일자</th>
								<th id="docListTitle">문서명</th>
								<th>금액</th>
								<th>진행상태</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty myDocList}">
									<tr>
										<td colspan="4">데이터가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="row" items="${myDocList}">
										<c:if test="${row.appStatus == 2}">
											<tr>
												<td>${row.regDate}</td>
												<td id="docListTitle"><a href="${path}/gw/detail/${row.docNo}">${row.docTitle}</a></td>
												<td>￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.docAmount}" /></td>
												<td>검토요청</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
		
		<div id="bodyAtt">
			<hr />
			<span>근태조회</span>
			<div id="attTableDiv">
				<table id="attTable" frame="void">
					<colgroup>
				        <col width="15%">
				        <col width="10%">
				        <col width="35%">
				        <col width="15%">
				        <col width="15%">
				        <col width="10%">
			    	</colgroup>
					<thead>
						<tr>
							<th>작성일자</th>
							<th>근태종류</th>
							<th id="attTitle">내용</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty attList}">
								<tr>
									<td colspan="6">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="row" items="${attList}">
									<c:choose>
										<c:when test="${sessionScope.userRole eq 'ADMIN'}">
											<tr>
												<td>${row.regDate}</td>
												<td>
													<c:if test="${row.attType eq 1}">월차</c:if>
		                                            <c:if test="${row.attType eq 2}">연차</c:if>
		                                            <c:if test="${row.attType eq 3}">연장근무</c:if>
		                                            <c:if test="${row.attType eq 4}">휴일근무</c:if>
		                                            <c:if test="${row.attType eq 5}">경조휴가</c:if>
												</td>
												<td id="attTitle"><a href="${path}/gw/attdetail/${row.attendId}">${fn:substring(row.attDesc, 0, 15)} ...</a></td>
												<td>${row.attStart}</td>
												<td>${row.attEnd}</td>
												<td>
													<c:if test="${row.attStatus eq 1}">신청중</c:if>
		                                        	<c:if test="${row.attStatus eq 3}">반려/보류</c:if>
		                                        	<c:if test="${row.attStatus eq 5}">승인완료</c:if>
												</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:if test="${row.userNo eq sessionScope.userNo}">
												<tr>
													<td>${row.regDate}</td>
													<td>
														<c:if test="${row.attType eq 1}">월차</c:if>
			                                            <c:if test="${row.attType eq 2}">연차</c:if>
			                                            <c:if test="${row.attType eq 3}">연장근무</c:if>
			                                            <c:if test="${row.attType eq 4}">휴일근무</c:if>
			                                            <c:if test="${row.attType eq 5}">경조휴가</c:if>
													</td>
													<td id="attTitle"><a href="${path}/gw/attdetail/${row.attendId}">${fn:substring(row.attDesc, 0, 15)} ...</a></td>
													<td>${row.attStart}</td>
													<td>${row.attEnd}</td>
													<td>
														<c:if test="${row.attStatus eq 1}">신청중</c:if>
			                                        	<c:if test="${row.attStatus eq 3}">반려/보류</c:if>
			                                        	<c:if test="${row.attStatus eq 5}">승인완료</c:if>
													</td>
												</tr>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		
		<div id="bodyCont">
			<hr />
			<span>계약조회</span>
			<div id="contTableDiv">
				<table id="contTable" frame="void">
					<colgroup>
				        <col width="12.5%">
				        <col width="12.5%">
				        <col width="12.5%">
				        <col width="12.5%">
				        <col width="12.5%">
				        <col width="12.5%">
				        <col width="12.5%">
				        <col width="12.5%">
			    	</colgroup>
					<thead>
						<tr>
							<th>작성일자</th>
							<th>판매방식</th>
							<th>계약방식</th>
							<th id="contTitle">계약명</th>
							<th>매출처</th>
							<th>계약금액</th>
							<th>매출이익</th>
							<th>담당자</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty contList}">
								<tr>
									<td colspan="4">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="row" items="${contList}">
									<tr>
										<td>
											<fmt:parseDate value="${row.regDatetime}" var="regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>
										</td>
										<td>${row.contTypeN}</td>
										<td>${row.cntrctMthN}</td>
										<td id="contTitle"><a href="${path}/cont/detail/${row.soppNo}/${row.contNo}">${row.contTitle}</a></td>
										<td>${row.custName}</td>
										<td class="moneyTdHtml">${row.contAmt}</td>
										<td class="moneyTdHtml">${row.net_profit}</td>
										<td>${row.userName}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../body-bottom.jsp"/>