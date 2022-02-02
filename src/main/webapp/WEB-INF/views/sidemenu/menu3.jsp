<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<script src="${path}/assets/js/pcoded.min.js"></script>
<script src="${path}/js/script.js"></script>
<script src="${path}/assets/js/demo-12.js"></script>
<script>

</script>
<nav>
                    <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="${path}/myboard.do" class="current">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.dash.main">나의 업무 홈</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="pcoded-hasmenu  pcoded">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-receipt"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">전표관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/cont/sliplist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">전표조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/cont/slipwrite.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">전표등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    </li>
                                    <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/cont/iolist.do' || path2 eq '/cont/iowrite.do' || fn:startsWith(path2, '/cont')}">pcoded-trigger</c:if>">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="icon-calculator"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.form-select.main">매입/매출관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/cont/iolist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">매입매출조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/cont/iowrite.do/0">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">매입매출등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    </li>
                                    <li class="pcoded-hasmenu  pcoded">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="fa fa-krw"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">자금관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                                                        <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/acc/list.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">자금현황조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/acc/write.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">자금변경등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/acc/write1.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">계좌/카드 조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    </li>
                                    <li class="pcoded-hasmenu  pcoded">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-stats-up"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">채권채무관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                                                        <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/acc/vatlist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">계산서 조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/acc/vatupload.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">계산서 등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                 </li>
                            </ul>
                         
                         <div class="pcoded-navigatio-lavel" data-i18n="nav.category.other">설정</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu ">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-settings"></i><b>M</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.menu-levels.main">설정</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/cust/list.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">고객/거래처 설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/product/list.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">상품설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                            </ul>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="javascript:void(0)">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">사용자 설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>                                                        