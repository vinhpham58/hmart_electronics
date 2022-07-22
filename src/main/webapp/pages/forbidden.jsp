<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="section-404 section" data-bg-image=" assets/images/404/bg-404.webp">
   <div class="container">
      <div class="content-404">
         <h1 class="title">Oops!</h1>
         <h2 class="sub-title">You've stumbled on a restricted space!</h2>
         <p>You could go back to the homepage</p>
         <div class="buttons">
            <a class="btn btn-dark btn-outline-hover-dark" href="<c:url value = "${contextUrl}/index.html" />" >Homepage</a>
         </div>
      </div>
   </div>
</div>