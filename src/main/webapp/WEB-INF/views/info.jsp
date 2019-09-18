<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>
<%--chart 생성 위한 Chart.js--%>
<script type="text/javascript" src="resources/js/Chart.js"></script>
<script type="text/javascript" src="resources/js/Chart.bundle.js"></script>
<%--&lt;%&ndash;reviewChart js 불러오기위해서&ndash;%&gt;--%>
<script type="text/javascript" src="resources/js/forChart.js"></script>

<%-- <%@ include file="includes/enterpriseSummary.jsp" %> --%>

<%@ include file="includes/enterpriseInfo.jsp" %>

<%@ include file="includes/map.jsp" %>

<%@ include file="includes/hiringInfo.jsp" %>

<%@ include file="includes/monthChart.jsp" %>

<%@ include file="includes/reviewComment.jsp" %>

<%@ include file="includes/interviewReview.jsp" %>

<%@ include file="includes/news.jsp" %>

<%@ include file="includes/footer.jsp" %>

<c:forEach items="${graph}" var="g">
	${g.ci_companyName} / ${g.cp_month } / ${g.cp_totalcnt} / ${g.cp_incnt} / ${g.cp_outcnt}<br>
</c:forEach>

