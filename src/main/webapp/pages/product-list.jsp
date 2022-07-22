<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="shop-category-area pt-100px pb-100px">
   <div class="container">
      <div class="row">
         <div class="col-lg-9 order-lg-last col-md-12 order-md-first">
            <div class="shop-top-bar d-flex">
               <div class="col-lg-6 d-none d-lg-block">
                  <div class="search-element">
                     <form action = "<c:url value = "${contextUrl}/product-list.html" />" method = "post">
                     	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="text" name = "s" placeholder="Search for products" />
                        <button><i class="pe-7s-search"></i></button>
                     </form>
                  </div>
               </div>
               <div class="select-shoing-wrap d-flex align-items-center">
                  <div class="shot-product">
                     <p>Sort By:</p>
                  </div>
                  <div class="header-bottom-set dropdown">
                     <button class="dropdown-toggle header-action-btn" data-bs-toggle="dropdown">
                     <i class="fa fa-angle-down"></i></button>
                     <ul class="dropdown-menu dropdown-menu-right">
                     	<li><a class="dropdown-item" href="#">Default</a></li>
                        <li><a class="dropdown-item" href="#">Name, A to Z</a></li>
                        <li><a class="dropdown-item" href="#">Name, Z to A</a></li>
                        <li><a class="dropdown-item" href="#">Price, low to high</a></li>
                        <li><a class="dropdown-item" href="#">Price, high to low</a></li>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="shop-bottom-area">
               <div class="row">
                  <div class="col">
                     <div class="tab-pane fade show active" id="shop-grid">
                        <div class="row mb-n-30px">
   						
                       	  <c:forEach var="o" items="${listProducts}">
                           <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6 mb-30px">
                              <div class="product">
                                 <div class="thumb">
                                    <a href="<c:url value = "${contextUrl}/product-detail.html/${o.productID}" />" class="image">
                                    <img src="<c:url value = "/static/images/product-image/${o.imageURL}" />" alt="${o.imageURL}" />
                                    <img class="hover-image"
                                       src="<c:url value = "/static/images/product-image/${o.imageURL}" />" alt="${o.productName}" />
                                    </a>
                                 </div>
                                 <div class="content">
                                    <span class="category"><a href="<c:url value = "${contextUrl}/product-detail.html/${o.productID}" />" >${o.category.categoryName}</a></span>
                                    <h5 class="title"><a href="product-detail.html">${o.productName} </a>
                                    </h5>
                                    <span class="price">
                                    <span class="new">${o.price}</span>
                                    </span>
                                 </div>
                              </div>
                           </div>
                           </c:forEach>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="pro-pagination-style text-center text-lg-end" data-aos="fade-up"
                  data-aos-delay="200">
                  <div class="pages">
                     <ul>
                        <li class="li"><a class="page-link" href="#"><i
                           class="fa fa-angle-left"></i></a>
                        </li>
                        <li class="li"><a class="page-link" href="#">1</a></li>
                        <li class="li"><a class="page-link active" href="#">2</a></li>
                        <li class="li"><a class="page-link" href="#">3</a></li>
                        <li class="li"><a class="page-link" href="#"><i
                           class="fa fa-angle-right"></i></a>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-lg-3 order-lg-first col-md-12 order-md-last">
            <div class="shop-sidebar-wrap">
               <div class="sidebar-widget">
                  <h4 class="sidebar-title">Top Categories</h4>
                  <div class="sidebar-widget-category">
                     <ul>
                        <li><a href="<c:url value = "${contextUrl}/product-list.html" />" class="selected m-0"> All Products
                           <span></span> </a>
                        </li>
                        <li><a href="<c:url value = "${contextUrl}/product-list.html/SmartPhones" />" class=""> Smart Phones
                           <span></span> </a>
                        </li>
                        <li><a href="<c:url value = "${contextUrl}/product-list.html/HeadPhones" />" class=""  > Head Phones
                           <span></span> </a>
                        </li>
                        <li><a href="<c:url value = "${contextUrl}/product-list.html/SmartWatches"/>"  class="" > Smart Watches
                           <span></span> </a>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>