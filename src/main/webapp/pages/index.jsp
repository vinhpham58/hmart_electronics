<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="section ">
   <div class="hero-slider swiper-container slider-nav-style-1 slider-dot-style-1">
      <div class="swiper-wrapper">
         <div class="hero-slide-item slider-height swiper-slide bg-color1" data-bg-image= "<c:url value = "/static/images/hero/bg/hero-bg-1.webp" />">
            <div class="container h-100">
               <div class="row h-100">
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 align-self-center sm-center-view">
                     <div class="hero-slide-content slider-animated-1">
                        <span class="category">Welcome To Hmart</span>
                        <h2 class="title-1">Your Home <br>
                           Smart Devices & <br>
                           Best Solution 
                        </h2>
                        <a href="product-list.html" class="btn btn-primary text-capitalize">Shop All Devices</a>
                     </div>
                  </div>
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 d-flex justify-content-center position-relative align-items-end">
                     <div class="show-case">
                        <div class="hero-slide-image">
                           <img src="<c:url value = "/static/images/hero/inner-img/hero-1-1.png" />" alt="" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="hero-slide-item slider-height swiper-slide bg-color1" data-bg-image= "<c:url value ="/static/images/hero/bg/hero-bg-1.webp" />" s>
            <div class="container h-100">
               <div class="row h-100">
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 align-self-center sm-center-view">
                     <div class="hero-slide-content slider-animated-1">
                        <span class="category">Welcome To Hmart</span>
                        <h2 class="title-1">Your Home <br>
                           Smart Devices & <br>
                           Best Solution 
                        </h2>
                        <a href="product-list.html" class="btn btn-primary text-capitalize">Shop All Devices</a>
                     </div>
                  </div>
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 d-flex justify-content-center position-relative align-items-end">
                     <div class="show-case">
                        <div class="hero-slide-image">
                           <img src= "<c:url value = "/static/images/hero/inner-img/hero-1-2.png" />" alt="" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="swiper-pagination swiper-pagination-white"></div>
      <div class="swiper-buttons">
         <div class="swiper-button-next"></div>
         <div class="swiper-button-prev"></div>
      </div>
   </div>
</div>
<div class="banner-area style-one pt-100px pb-100px">
   <div class="container">
      <div class="row">
         <div class="col-md-6">
            <div class="single-banner nth-child-1">
               <img src="
               <c:url value = "/static/images/banner/3.webp" />
               " alt="">
               <div class="banner-content nth-child-1">
                  <h3 class="title">Smart Watch For <br>
                     Your Hand
                  </h3>
                  <span class="category">From $29.00</span>
                  <a href="<c:url value = "${contextUrl}/product-list.html/SmartWatches" />" class="shop-link"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
               </div>
            </div>
         </div>
         <div class="col-md-6">
            <div class="single-banner nth-child-2 mb-30px mb-lm-30px mt-lm-30px ">
               <img src="
               <c:url value = "/static/images/banner/4.webp" />
               " alt="">
               <div class="banner-content nth-child-2">
                  <h3 class="title">Headphones</h3>
                  <span class="category">From $19.00</span>
                  <a href="<c:url value = "${contextUrl}/product-list.html/HeadPhones" />" class="shop-link"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
               </div>
            </div>
            <div class="single-banner nth-child-2">
               <img src="
               <c:url value = "/static/images/banner/5.webp" />
               " alt="">
               <div class="banner-content nth-child-3">
                  <h3 class="title">Smartphone</h3>
                  <span class="category">From $69.00</span>
                  <a href="<c:url value = "${contextUrl}/product-list.html/SmartPhones" />" class="shop-link"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>