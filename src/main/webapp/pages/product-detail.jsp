<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="product-details-area pt-100px pb-100px">
   <div class="container">
      <div class="row">
         <div class="col-lg-6 col-sm-12 col-xs-12 mb-lm-30px mb-md-30px mb-sm-30px">
            <!-- Swiper -->
            <div class="swiper-container zoom-top">
               <div class="swiper-wrapper">
                  <div class="swiper-slide">
                     <img class="img-responsive m-auto" src="<c:url value = "/static/images/product-image/zoom-image/${product.imageURL}"  />" alt="">
                     <a class="venobox full-preview" data-gall="myGallery" href="<c:url value = "/static/images/product-image/zoom-image/${product.imageURL}" />"> 
                     <i class="fa fa-arrows-alt" aria-hidden="true"></i>
                     </a>
                  </div>
               </div>
            </div>
            <div class="swiper-container mt-20px zoom-thumbs slider-nav-style-1 small-nav">
               <div class="swiper-buttons">
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
               </div>
            </div>
         </div>
         
         <div class="col-lg-6 col-sm-12 col-xs-12" data-aos="fade-up" data-aos-delays="200">
            <div class="product-details-content quickview-content ml-25px">
               <h2>${product.productName}</h2>
               <div class="pricing-meta">
                  <ul class="d-flex">
                     <li class="new-price">${product.price}</li>
                  </ul>
               </div>
               <p class="mt-30px">${product.description}</p>
               <div class="pro-details-categories-info pro-details-same-style d-flex m-0">
                  <span>Categories: </span>
                  <!-- weight, dimensions, material, other info -->
                  <ul class="d-flex">
                     <li>
                        <a href="#">${product.category.categoryName}</a>
                     </li>
                  </ul>
               </div>
               <div class="pro-details-categories-info pro-details-same-style d-flex m-0">
                  <span>Weight: </span>
                  <ul class="d-flex">
                     <li>
                        <a href="#">${product.weight} </a>
                     </li>

                  </ul>
               </div>
               <div class="pro-details-categories-info pro-details-same-style d-flex m-0">
                  <span>Dimensions: </span>
                  <ul class="d-flex">
                     <li>
                        <a href="#">${product.dimensions}</a>
                     </li>
                  </ul>
               </div>
               <div class="pro-details-categories-info pro-details-same-style d-flex m-0">
                  <span>Material: </span>
                  <ul class="d-flex">
                     <li>
                        <a href="#">${product.material}</a>
                     </li>
                  </ul>
               </div>
               <div class="pro-details-quality">
               	<form method="post" action="<c:url value = "${contextUrl}/cart.html" />" >
                  <div class="cart-plus-minus">
                     <input class="cart-plus-minus-box" type="text" name="qty" value="1" />
                  </div>
                  <div class="pro-details-cart">
                  		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" value="${product.productID}" name="id" >
						<button class="add-cart"> Add To Cart</button>
                  </div>
                  </form>
               </div>
            </div>
         </div>
         
      </div>
   </div>
</div>