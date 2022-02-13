<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Blog Template · Bootstrap v4.6</title>

   <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/blog/">
	<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/blog.css">

    <!-- Bootstrap core CSS -->



    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/4.6/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.6/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


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
    </style>

    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900" rel="stylesheet">

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

		<!--  회원가입 폼  -->
		<br>
		<div class=" text-center blog-header-logo">
			<h3>회원가입</h3>
			<br>
		</div>

		<form action="/member/join" method="post">
			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
				<div class="form-group col-md-6">
					<label for="mem_id">아이디</label> <input type="text"
						class="form-control" id="mem_id" name="mem_id">
				</div>
				<div class="col-md-2">
					<label id="idUseState">&nbsp;</label>
					<button type="button" class="form-control" id="memIDchk">중복체크</button>
				</div>
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
				<div class="form-group col-md-4">
					<label for="mem_pw">비밀번호</label> <input type="password"
						class="form-control" id="mem_pw" name="mem_pw">
				</div>
				<div class="form-group col-md-4">
					<label for="inputPassword4">비밀번호 확인</label> <input type="password"
						class="form-control" id="inputPassword4" name="inputPassword4">
				</div>
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
				<div class="form-group col-md-4">
					<label for="mem_name">이름</label> <input type="text"
						class="form-control" id="mem_name" name="mem_name">
				</div>
				<div class="form-group col-md-4">
					<label for="mem_phone">전화번호</label> <input type="text"
						class="form-control" id="mem_phone" name="mem_phone">
				</div>
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
				<div class="form-group col-md-3">
					<label for="mem_addr">기본주소</label> <input type="text"
						class="form-control" id="mem_addr" name="mem_addr">
				</div>
				<div class="form-group col-md-3">
					<label for="mem_de_addr">상세주소</label> <input type="text"
						class="form-control" id="mem_de_addr" name="mem_de_addr">
				</div>
				<div class="form-group col-md-2">
					<label for="mem_zipcode">우편번호</label> <input type="text"
						class="form-control" id="mem_zipcode" name="mem_zipcode">
				</div>
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
				<div class="form-group col-md-6">
					<label for="mem_email">이메일</label> <input type="text"
						class="form-control" id="mem_email" name="mem_email">
				</div>
				<div class="col-md-2">
					<label id="idUseState">&nbsp;</label>
					<button type="button" class="form-control" id="memEmailChk">이메일 인증요청</button>
				</div>
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
				<div class="custom-control col-md-8 custom-checkbox">
					<input type="checkbox" class="for-control" id="mem_rec_email"
						name="mem_rec_email" value="Y"> <label
						class="form-check-label" for="mem_rec_email"> 이메일 수신여부 </label>
				</div>
				<div class="form-group col-md-2">
					<label for="inputEmail4">&nbsp;</label>
				</div>
			</div>

			<div class="form-group col-md-12 text-center">
				<button type="submit" class="btn btn-primary center">회원
					가입하기</button>
				<button type="button" class="btn btn-secondary" id="joinCancel">가입
					취소하기</button>
			</div>
		</form>
	</div>


	<footer class="blog-footer fixed-bottom">
		<p>
			Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a>
			by <a href="https://twitter.com/mdo">@mdo</a>.
		</p>
		<p>
			<a href="#">Back to top</a>
		</p>
	</footer>



	<script>
		$(document).ready(function() {

			let memCancel = $("#joinCancel");
			// 아이디 중복체크 
			$("#memIDchk").on("click", function() {

				let mem_id = $("#mem_id");

				console.log("아이디중복체크? " + mem_id);

				if (mem_id.val() == "" || mem_id.val() == null) {
					alert("아이디를 입력하세요.");
					mem_id.focus();
					return;
				}

				$.ajax({
					url : '/member/checkID',
					type : 'get',
					dataType : 'text',
					data : {
						mem_id : mem_id.val()
					},
					success : function(data) {

						console.log("아이디중복체크22? " + data);

						$("#idUseState").css("color", "red");
						if (data == "Y") {
							$("#idUseState").html("아이디 사용가능");
						} else if (data == "N") {
							mem_id.val("");
							$("#idUseState").html("아이디 사용불가능");
						}
					}
				});
			});
			// 회원가입 취소하기 
			$("#joinCancel").on("click", function() {

				if (confirm("회원가입을 취소하겠습니까?")) {
					location.href = "/";

				}
			});
		});
	</script>

</body>
</html>


