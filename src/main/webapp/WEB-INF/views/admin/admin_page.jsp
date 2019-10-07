<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>

<style>
	#admin_div {
		padding: 8px;
		text-align: center;
		width: 100%;
	}

	#admin_div > #admin_body {
		width: 100%;
		text-align: center;
	}

	#admin_div > #admin_body > #tables {
		width: 90%;
		margin-left: auto;
		margin-right: auto;
	}

</style>
<section>

    <div class="col-lg-12 mt-4" id="admin_div">
        <div class="col-lg-12 mt-4 text-primary" id="admin_header">
            <h2>관리 모드</h2>
            <form action="${pageContext.request.contextPath}/user_search" method="get">
                <input type="text" name="user_name"/>
                <input type="submit" value="검색"/>
            </form>
        </div>
        <script>

        </script>
        <div class="col-ls-12 mt-4" id="admin_body">
            <table id="tables" border="1">
                <c:forEach var="ul" items="${user_list}">
                    <tr>
                        <td><b>INFO</b></td>
                        <td><b>user_id</b></td>
                        <td><b>등급</b></td>
                        <td><b>닉네임</b></td>
                        <td><b>이메일</b></td>
                        <td><b>가입일</b></td>
                        <td><b>정보수정일</b></td>
                        <td><b>소셜가입</b></td>
                    </tr>

                    <tr>
                        <td><a href="user_status?user_email=${ul.user_email}"
                               onclick="window.open(this.href,'유저 관리','width=800, height=500'); return false;">클릭</a>
                        </td>
                        <td>${ul.user_id}</td>
                        <td>${ul.authorization_id}</td>
                        <td>${ul.user_name}</td>
                        <td>${ul.user_email}</td>
                        <td>${ul.user_create_date}</td>
                        <td>${ul.user_modify_date}</td>
                        <td>${ul.sns_type}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div class="col-lg-12 mt-4" id="admin_footer">
        </div>
    </div>
</section>

<%@ include file="../includes/footer.jsp" %>

