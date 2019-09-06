<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 30.
  Time: 오후 6:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="mt-3" id="section4">
    <div class="container center-block">
        <div class="card border-primary">
            <div class="card-body">
                <div class="text-primary font-weight-bold card-title"><h5>리뷰 코멘트</h5></div>
                <div class="card border-info">
                    <div class="row">
                        <div class="card-body col-md-6 text-center">
                            <h5 class="card-title">2.9</h5>
                            <p class="card-text">별이 2개</p>
                            <p>***********별그림</p>
                            <p>총 만족도</p>
                        </div>
                        <div class="card-body col-md-6" style="position: relative; height:30vh; width:80vw">
                            <canvas id="companyChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="accordion" id="accordionExample">
                <div class="card-body">
                    <div class="card-header" id="headingOne">
                        <div class="border-info mb-0">
                            <div class="row">
                                <div class="col-lg-8">
                                    <button class="btn" type="button" data-toggle="collapse" data-target="#collapseOne"
                                            aria-expanded="false" aria-controls="collapseOne">
                                        승진 기회 및 가능성 <span class="text-primary">(5)</span>
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    *****4.0
                                </div>
                            </div>
                            <%-- end border-ingo--%>
                        </div>
                    </div>

                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>총5개의 기업리뷰 코멘트</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <p>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination" style="justify-content: center">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>

                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&lt;</span>
                                        </a>

                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&gt;</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <form action="#">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="입력해주세요"
                                           aria-label="Recipient's username with two button addons"
                                           aria-describedby="button-addon4">
                                    <div class="input-group-append" id="button-addon4">
                                        <button class="btn btn-outline-secondary" type="button">제출</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

<%-- 임시로 템플릿 보기 위해서--%>
            <div class="accordion" >
                <div class="card-body">
                    <div class="card-header">
                        <div class="border-info mb-0">
                            <div class="row">
                                <div class="col-lg-8">
                                    <button class="btn" type="button" data-toggle="collapse" data-target="#collapseOne"
                                            aria-expanded="false" aria-controls="collapseOne">
                                        복지 및 급여 <span class="text-primary">(5)</span>
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    *****4.0
                                </div>
                            </div>
                            <%-- end border-ingo--%>
                        </div>
                    </div>

                    <div class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>총5개의 기업리뷰 코멘트</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <p>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination" style="justify-content: center">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>

                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&lt;</span>
                                        </a>

                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&gt;</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <form action="#">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="입력해주세요"
                                           aria-label="Recipient's username with two button addons"
                                           aria-describedby="button-addon4">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button">제출</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>


            <div class="accordion" >
                <div class="card-body">
                    <div class="card-header">
                        <div class="border-info mb-0">
                            <div class="row">
                                <div class="col-lg-8">
                                    <button class="btn" type="button" data-toggle="collapse" data-target="#collapseOne"
                                            aria-expanded="false" aria-controls="collapseOne">
                                        업무와 삶의 균형 <span class="text-primary">(5)</span>
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    *****4.0
                                </div>
                            </div>
                            <%-- end border-ingo--%>
                        </div>
                    </div>

                    <div class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>총5개의 기업리뷰 코멘트</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <p>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination" style="justify-content: center">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>

                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&lt;</span>
                                        </a>

                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&gt;</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <form action="#">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="입력해주세요"
                                           aria-label="Recipient's username with two button addons"
                                           aria-describedby="button-addon4">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button">제출</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

            <div class="accordion" >
                <div class="card-body">
                    <div class="card-header">
                        <div class="border-info mb-0">
                            <div class="row">
                                <div class="col-lg-8">
                                    <button class="btn" type="button" data-toggle="collapse" data-target="#collapseOne"
                                            aria-expanded="false" aria-controls="collapseOne">
                                        사내문화 <span class="text-primary">(5)</span>
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    *****4.0
                                </div>
                            </div>
                            <%-- end border-ingo--%>
                        </div>
                    </div>

                    <div class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>총5개의 기업리뷰 코멘트</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <p>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <small>2018-01-01</small>
                                        </p>
                                        내용~~~~~~~~~~~
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination" style="justify-content: center">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>

                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&lt;</span>
                                        </a>

                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&gt;</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <form action="#">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="입력해주세요"
                                           aria-label="Recipient's username with two button addons"
                                           aria-describedby="button-addon4">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button">제출</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

            <div class="accordion" >
            <div class="card-body">
                <div class="card-header">
                    <div class="border-info mb-0">
                        <div class="row">
                            <div class="col-lg-8">
                                <button class="btn" type="button" data-toggle="collapse" data-target="#collapseOne"
                                        aria-expanded="false" aria-controls="collapseOne">
                                    경영진 <span class="text-primary">(5)</span>
                                </button>
                            </div>
                            <div class="col-lg-4">
                                *****4.0
                            </div>
                        </div>
                        <%-- end border-ingo--%>
                    </div>
                </div>

                <div class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>총5개의 기업리뷰 코멘트</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <p>
                                        <small>2018-01-01</small>
                                    </p>
                                    내용~~~~~~~~~~~
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <small>2018-01-01</small>
                                    </p>
                                    내용~~~~~~~~~~~
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <small>2018-01-01</small>
                                    </p>
                                    내용~~~~~~~~~~~
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <small>2018-01-01</small>
                                    </p>
                                    내용~~~~~~~~~~~
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <small>2018-01-01</small>
                                    </p>
                                    내용~~~~~~~~~~~
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination" style="justify-content: center">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>

                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&lt;</span>
                                    </a>

                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&gt;</span>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <form action="#">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="입력해주세요"
                                       aria-label="Recipient's username with two button addons"
                                       aria-describedby="button-addon4">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button">제출</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>



        </div>
    </div>
</div>