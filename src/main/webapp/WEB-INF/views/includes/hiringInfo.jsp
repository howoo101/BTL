<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 30.
  Time: 오후 6:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="section2" class="mt-3">
	<div class="container center-block">
		<div class="card border-primary">
			<div class="card-body">
				<div class="text-primary font-weight-bold card-title">
					<h5>채용정보</h5>
				</div>

				<!-- 한 라인에 3가지 회사가 들어옴.-->
				<div class="row" id="saraminRow1">
					<!-- 첫번째 회사.-->
					<div class="col-sm-4  ">
						<!-- 패널 배경색 넣는곳 만약 색을 바꾸고 싶다면, bootstrap.css 파일에서 bg-원하는 색 컬러를 추가해서 해야한다.-->
						<div class="panels panel-default text-center"
							style="background-color: #74b9ff;">
							<!-- 패널 헤드 배경색 넣는곳
                             expriationTimestamp의 span 에다가 값을 만료일을 생성해서 넣어주는듯.
                          -->
							<div class="panel-headings" style="background-color: #0984e3;">
								<span class="expirationTimestamp ">~10/28 (월)</span>
							</div>
							<div class="panels-body">
								<!-- 회사 이름을 넣는곳 -->
								<h4 class="name">(주)신흥정밀</h4>
								<h5>
									<!-- 사람인 채용공고 링크로 넣어주는곳-->
									<a class="title blue-font"
										href="http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=36832910&amp;utm_source=job-search-api&amp;utm_medium=api&amp;utm_campaign=saramin-job-search-api"
										target="_blank"><b>[(주)신흥정밀]
											제조팀 수리사 신입/경력 사원 모집</b></a>
								</h5>
							</div>
							<!-- panel-footers에다가 아래 값들을 넣어주는 역할.-->
							<div class="panel-footers">
								<p>
									<small> <span class="experienceLevel">신입/경력</span> | <span
										class="requiredEducationLevel">고졸↑</span> | <span
										class="location">경기</span> | <span class="industry">전기</span></small>
								</p>
							</div>
						</div>
					</div>

					<!--두번째 회사.-->
					<div class="col-sm-4">
						<div class="panels panel-default text-center">
							<div class="panel-headings">
								<span class="expirationTimestamp">~09/27 (금)</span>
							</div>
							<div class="panels-body">
								<h4 class="name">피아물류(주)</h4>
								<h5>
									<a class="title blue-font"
										href="http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=36835226&amp;utm_source=job-search-api&amp;utm_medium=api&amp;utm_campaign=saramin-job-search-api"
										target="_blank"><b>물류보관설비
											영업부 사원을 모집합니다</b></a>
								</h5>
							</div>
							<div class="panel-footers">
								<p>
									<small> <span class="experienceLevel">경력무관</span> | <span
										class="requiredEducationLevel">대졸↑</span> | <span
										class="location">서울</span> | <span class="industry"></span></small>
								</p>
							</div>
						</div>
					</div>

					<!-- 세번째 회사.-->
					<div class="col-sm-4">
						<div class="panels panel-default text-center">
							<div class="panel-headings">
								<span class="expirationTimestamp">~09/27 (금)</span>
							</div>
							<div class="panels-body">
								<h4 class="name">피아물류(주)</h4>
								<h5>
									<a class="title blue-font"
										href="http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=36835230&amp;utm_source=job-search-api&amp;utm_medium=api&amp;utm_campaign=saramin-job-search-api"
										target="_blank"><b>물류보관설비
											설계실 사원을 모집합니다</b></a>
								</h5>
							</div>
							<div class="panel-footers">
								<p>
									<small> <span class="experienceLevel">경력무관</span> | <span
										class="requiredEducationLevel">대졸↑</span> | <span
										class="location">서울</span> | <span class="industry"></span></small>
								</p>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- 첫번째 줄 끝-->
		</div>
	</div>
</div>