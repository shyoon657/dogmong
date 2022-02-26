<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="utf-8">
    <title> DogMong_Main </title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/blog/">
	<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/blog.css">
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
    .card-registration .select-input.form-control[readonly]:not([disabled]) {
  font-size: 1rem;
  line-height: 2.15;
  padding-left: .75em;
  padding-right: .75em;
}
.card-registration .select-arrow {
  top: 13px;
}

    </style>
  </head>
  

  
  
  <body>
    <%@include file="/WEB-INF/views/include/plugin_js.jsp" %>
	<div class="container">

		<div class="container sticky-top bg-white">

			<header class="blog-header py-3">
				<div
					class="row flex-nowrap justify-content-between align-items-center">
					<div class="col-4 pt-1">
						<a class="text-muted" href="#">logo</a>
					</div>
					<div class="col-4 text-center">
						<a class="blog-header-logo text-dark" href="/">DogMong</a>
					</div>
					<div class="col-4 d-flex justify-content-end align-items-center">

						<a type="button"
							class="btn btn-sm btn-outline-secondary invisible" href="#">Search</a>
						<a type="button"
							class="btn btn-sm btn-outline-secondary invisible"
							href="member/login">LOGIN</a> <a type="button"
							class="btn btn-sm btn-outline-secondary invisible"
							href="member/join">JOIN</a> <a type="button"
							class="btn btn-sm btn-outline-secondary invisible" href="#">ORDER</a>
						<a type="button"
							class="btn btn-sm btn-outline-secondary invisible" href="#">CART</a>
						<a type="button"
							class="btn btn-sm btn-outline-secondary invisible" href="#">MYPAGE</a>
					</div>
				</div>
			</header>
		</div>
</div>
		<!--  회원가입 폼  -->
		
<section class="h-100 bg-white">
		<div class="container py-7">
			<div class="col">
				<div class="card card-registration my-4">
					<div class="row">
						<div class="col-xl-4 ">
							<img
								src="/resources/img/1.jpg" 
								class="img-fluid"
								style="width: 100%; height: 100%;"/>
						</div>
						<div class="col-xl-8">
							<div class="card-body p-md-3 text-black"> 
								<h3 class="mb-5 text-center">마이페이지</h3>
							
									<div class="row">
										<div class="col-md-6 mb-2"> 
											<div class="form-outline">
												<label class="form-label" for="mem_id">아이디</label> <input
													type="text" id="mem_id" name="mem_id" class="form-control" value='<c:out value="${memberVO.mem_id }"/>' readonly />
											</div>
										</div>
									
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="mem_email">이메일</label> 
												<input type="text" id="mem_email" name="mem_email" class="form-control" value='<c:out value="${memberVO.mem_email }"/>' readonly />
											</div>
										</div>
									</div>
				
									<div class="row">
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="mem_name">이름</label> <input
													type="text" id="mem_name" name="mem_name"
													class="form-control" value='<c:out value="${memberVO.mem_name }"/>' readonly/>
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="mem_phone">전화번호</label> <input
													type="text" id="mem_phone" name="mem_phone"
													class="form-control" value='<c:out value="${memberVO.mem_phone }"/>' readonly />
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="mem_addr">기본주소</label> <input
													type="text" id="mem_addr" name="mem_addr"
													class="form-control " value='<c:out value="${memberVO.mem_addr }"/>' readonly />
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="mem_de_addr">상세주소</label> 
												<input type="text" id="mem_de_addr" name="mem_de_addr"
													class="form-control " value='<c:out value="${memberVO.mem_de_addr }"/>' readonly />
												<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
											</div>
		
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="mem_zipcode">우편번호</label> <input
													type="text" id="mem_zipcode" name="mem_zipcode"
													class="form-control " value='<c:out value="${memberVO.mem_zipcode }"/>' readonly />
											</div>   
										</div>
										
										
									</div>
								<div class="row">
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="mem_phone">전화번호</label> <input
													type="text" id="mem_phone" name="mem_phone"
													class="form-control " value='<c:out value="${memberVO.mem_phone }"/>' readonly />
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="mem_point">포인트</label> 
												<input type="text" id="mem_point" name="mem_de_addr"
													class="form-control " value='<c:out value="${memberVO.mem_point }"/>' readonly />
											</div>
										</div>
									</div>
									
									
										<div class="form-outline form-check">
											
										<label class="form-check-label" for="mem_rec_email"> 이메일 수신여부 : <c:out value="${memberVO.mem_rec_email == 'Y' ? '수신' : '수신 안함 ' }" /></label>
										</div>
										<hr>
											
									<div class="form-group col-md-12 text-center">
										<button type="button" class="btn btn-primary center" id="btnMemPwModify">비밀번호 변경하기</button>
										<button type="button" class="btn btn-secondary" id="btnMemUnregister">회원 탈퇴하기</button>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<footer class="blog-footer fixed-bottom">
		<p>
			Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> 
			by <a href="https://twitter.com/mdo">@mdo</a>.
		</p>

	</footer>
	
	<script> 
	$(document).ready(function(){
		
		$("#btnMemPwModify").on("click", function() {

			location.href = "/member/changePw";
	
		});
		
		$("#btnMemUnregister").on("click", function(){
			
			location.href = "/member/unregister";
			
		});
		
	});
	
	</script>

</body>
</html>


