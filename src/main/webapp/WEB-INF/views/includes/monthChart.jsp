<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 30.
  Time: 오후 6:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="section3" class="mt-3">
    <div class="container center-block">
        <div class="card border-primary">
            <div class="card-body">
                <%--월별 그래프 제목--%>
                <div class="text-primary font-weight-bold card-title"><h5>월별 그래프</h5></div>
                <!-- 차트 -->
                <div class="chart-container" style="position: relative; width:80%; margin: auto;">
                    <canvas id="myChart" width="200" height="100"></canvas>
                </div>
            </div>
        </div>
    </div>
    <%--end section --%>
</div>