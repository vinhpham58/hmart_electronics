<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="empty-cart-area pb-100px pt-100px">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
            <div class="cart-heading">
               <h2>Your cart item</h2>
            </div>
            <div class="empty-text-contant text-center">
               <i class="pe-7s-shopbag"></i>
               <h3>There are no more items in your cart</h3>
               <a class="empty-cart-btn" href="<c:url value = "${contextUrl}/product-list.html" />" >
               <i class="fa fa-arrow-left"> </i> Continue shopping
               </a>
            </div>
         </div>
      </div>
   </div>
</div>