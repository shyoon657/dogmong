<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<%@include file="/WEB-INF/views/include/plugin_js.jsp"%>
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
	<!--  ???????????? ???  -->

	<section class="h-100 bg-white">

		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col">
					<div class="card card-registration my-4">
						<div class="row g-0">
							<div class="col-xl-4 ">

								<img src="/resources/img/1.jpg" class="img-fluid"
									style="border-top-left-radius: .10rem; border-bottom-left-radius: .10rem;" />

							</div>
							<div class="col-xl-8">
								<div class="card-body p-md-3 text-black">
									<h3 class="mb-5 text-center ">?????????</h3>

									<form action="/" method="post">
										<div class="row">
											<div class="col-md-12 mb-4">
												<div class="form-outline ">
													<label class="form-label" for="mem_id">?????????</label> <input
														type="text" id="mem_id" name="mem_id"
														class="form-control form-control-lg" />
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12 mb-4">
												<div class="form-outline">
													<label class="form-label" for="mem_pw">????????????</label> <input
														type="password" id="mem_pw" name="mem_pw"
														class="form-control form-control-lg" />
												</div>
											</div>
										</div>
										<div class="form-group col-md-12 text-center">
											<button type="button" id="btnLogin" class="btn btn-primary center">???????????????</button>
											<button type="button" id="btnFindPw" class="btn btn-secondary">???????????? ??????</button>
										</div>
									</form>
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
		
		$("#btnLogin").on("click", function(){
			
			let mem_id = $("#mem_id");
			let mem_pw = $("#mem_pw");

			if(mem_id.val() == "" || mem_id.val() == null){
				alert("???????????? ???????????????."); 
				mem_id.focus();
				return;
			}
			
			if(mem_pw.val() == "" || mem_pw.val() == null){
				alert("??????????????? ???????????????.");
				mem_pw.focus();
				return;
			} 

			$.ajax({
				url: '/member/login',
				type: 'post',
				dataType: 'text',
				data: {mem_id : mem_id.val(), mem_pw : mem_pw.val()},
				success: function(data){
					
					if(data == "success"){
						alert("????????? ?????????????????????.");
						location.href = "/";
					} else if(data == "idFail"){
						alert("????????? ???????????? ????????????.");
						mem_id.focus();
					} else if(data == "pwFail"){   
						alert("????????? ??????????????? ????????????.");
						mem_pw.focus();
					}
				}
			});
		});	
		
		$("#btnFindPw").on("click", function(){
			
			location.href = "/member/findPw";

		});
		
		
		
	});
	</script>


</body>
</html>


