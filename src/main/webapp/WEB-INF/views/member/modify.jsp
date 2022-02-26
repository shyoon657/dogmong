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
  
   <script> 
  	let msg = '${msg}';
  	if(msg == 'modifyFail'){
  	 	alert("비밀번호를 확인바랍니다.");
  	}
  	
  </script>
  
  
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
								<h3 class="mb-5 text-center">회원수정</h3>
								<form action="/member/modify" method="post" id="memModifyForm">
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
												<input type="text" id="mem_email" name="mem_email" class="form-control" value='<c:out value="${memberVO.mem_email }"/>'/>
											</div>
										</div>
									</div>
								
									
									<div class="row">
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="mem_pw">비밀번호</label> <input
													type="password" id="mem_pw" name="mem_pw"
													class="form-control" />
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="inputPassword4">비밀번호
													확인</label> <input type="password" id="mem_pwchk"
													name="mem_pwchk" class="form-control" />
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
													class="form-control" value='<c:out value="${memberVO.mem_phone }"/>' />
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="mem_addr">기본주소</label> <input
													type="text" id="mem_addr" name="mem_addr"
													class="form-control " value='<c:out value="${memberVO.mem_addr }"/>' />
											</div>
										</div>
										<div class="col-md-6 mb-2">
											<div class="form-outline">
												<label class="form-label" for="mem_de_addr">상세주소</label> 
												<input type="text" id="mem_de_addr" name="mem_de_addr"
													class="form-control " value='<c:out value="${memberVO.mem_de_addr }"/>' />
												<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
											</div>
		
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 mb-4">
											<div class="form-outline">
												<label class="form-label" for="mem_zipcode">우편번호</label> <input
													type="text" id="mem_zipcode" name="mem_zipcode"
													class="form-control " value='<c:out value="${memberVO.mem_zipcode }"/>' />
											</div>   
										</div>
											<div class="col-md-6 mb-4">
											<div class="form-outline">
												<label for="btnPostCode" class="form-label">&nbsp;</label>
												<button type="button" 
													class="form-control btn btn-info" id="btnPostCode" name="btnPostCode" 
													onclick ="sample2_execDaumPostcode()">우편번호 찾기</button>
											</div>
										</div>
										
									</div>
										<div class="form-outline form-check">
											<input type="checkbox" class="form-check-input" id="mem_rec_email" name="mem_rec_email" 
											
											value='<c:out value="${memberVO.mem_rec_email }" />' 
										
											<c:out value="${memberVO.mem_rec_email == 'Y' ? 'checked' : '' }" />
											
											/>
											<label class="form-check-label" for="mem_rec_email"> 이메일 수신여부 </label>
										</div>
										<hr>
									<div class="form-group col-md-12 text-center">
										<button type="button" class="btn btn-primary center" id="btnMemModify">회원정보 수정하기</button>
										<button type="button" class="btn btn-secondary" id="btnModifyCancel">회원수정 취소하기</button>
									</div>
								</form>
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
		$(document).ready(function() {
	
			
			// 메일인증확인체크 전역변수
			let isEmailAuthConfirm = false;
			
			// 폼에서 전송버튼 클릭하면 호출되는 이벤트 설정
			$("#btnMemModify").on("click", function() { 
						
				let mem_pw = $("#mem_pw"); 
				let mem_pwchk = $("#mem_pwchk");
 
				if(mem_pw.val() == "" && mem_pwchk.val() == "") {
					alert("비밀번호를 입력하세요.");
					return; 
				}
				if(mem_pw.val() != mem_pwchk.val()) {
					alert("비밀번호가 일치하지 않습니다.");
					return; 
				}
			   $("#memModifyForm").submit();
			
			});

			// 회원수정 취소하기 
			$("#btnModifyCancel").on("click", function() {

				if (confirm("회원수정을 취소하겠습니까?")) {
					location.href = "/";

				}
			});
		});
	</script>

	<div id="layer"
		style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
			id="btnCloseLayer"
			style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
			onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 화면을 넣을 element
		var element_layer = document.getElementById('layer');

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_layer.style.display = 'none';
		}

		function sample2_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample2_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample2_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('mem_zipcode').value = data.zonecode;
							document.getElementById("mem_addr").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("mem_de_addr")
									.focus();

							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_layer.style.display = 'none';
						},
						width : '100%',
						height : '100%',
						maxSuggestItems : 5
					}).embed(element_layer);

			// iframe을 넣은 element를 보이게 한다.
			element_layer.style.display = 'block';

			// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
			initLayerPosition();
		}

		// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		function initLayerPosition() {
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 400; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 5; //샘플에서 사용하는 border의 두께

			// 위에서 선언한 값들을 실제 element에 넣는다.
			element_layer.style.width = width + 'px';
			element_layer.style.height = height + 'px';
			element_layer.style.border = borderWidth + 'px solid';
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
					+ 'px';
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
					+ 'px';
		}
	</script>


</body>
</html>


