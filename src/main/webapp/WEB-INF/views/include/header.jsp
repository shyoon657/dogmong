<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


  <header class="blog-header py-3 ">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="text-muted" href="/">logo</a>
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" >DogMong</a>
      </div>
      <div class="col-4 d-flex  justify-content-end ">
    	
    	<a type="button" class="btn btn-sm btn-outline-secondary" href="#">SEARCH</a>&nbsp;
    	
    	<!--  로그인 이전상태 표시 -->
    	<c:if test="${sessionScope.loginStatus == null}">
        <a type="button" class="btn btn-sm btn-outline-secondary" href="/member/login">LOGIN</a>&nbsp;
        <a type="button" class="btn btn-sm btn-outline-secondary" href="/member/join">JOIN</a>&nbsp;	
    	</c:if>

		<!--  로그인 이후 상태 표시  -->
        <c:if test="${sessionScope.loginStatus != null}">
        <a type="button" class="btn btn-sm btn-outline-secondary" href="/member/logout">LOGOUT</a>&nbsp;
        <a type="button" class="btn btn-sm btn-outline-secondary" href="/member/modify">MODIFY</a>&nbsp;
    
        <a type="button" class="btn btn-sm btn-outline-secondary" href="#">ORDER</a>&nbsp;
        <a type="button" class="btn btn-sm btn-outline-secondary" href="#">CART</a>&nbsp;
        <a type="button" class="btn btn-sm btn-outline-secondary" href="/member/mypage">MYPAGE</a>
           </c:if>
      </div>
    </div>
  </header>
   

