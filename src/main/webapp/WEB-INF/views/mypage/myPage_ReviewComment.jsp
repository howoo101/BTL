<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 31.
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>

<%@ include file="myPage_Menu.jsp" %>

<div class="container mt-4">
    <div class="card border-primary">
        <div class="card-body">
            <h5 style="color:royalblue;">내 리뷰 코멘트</h5>
            <hr style="border:1px solid #c7d5f8; padding: 0px;">
            <!-- Bootstrap table class -->
            <table class="table ">
                <thead>
                <tr class="">
                    <th scope="col">기업명</th>
                    <th scope="col">면접결과</th>
                    <th scope="col">작성일</th>
                    <th scope="col">수정 | 삭제</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <th scope="row">1
                    <td>Ajay</td>
                    <td>Patna</td>
                    <td>20</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Rahul</td>
                    <td>Chandigarh</td>
                    <td>17</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Parush</td>
                    <td>Kolkata</td>
                    <td>22</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>

