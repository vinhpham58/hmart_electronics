<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="shop-category-area pt-100px pb-100px">
   <div class="container">
      <div class="row">
         <div class="col-lg-9 order-lg-last col-md-12 order-md-first">
            <div class="shop-top-bar d-flex">
               <div class="col-lg-6 d-none d-lg-block">
                  <div class="search-element">
                     <form action="#">
                        <input type="text" placeholder="Search for products" />
                        <button><i class="pe-7s-search"></i></button>
                     </form>
                  </div>
               </div>
               <div class="select-shoing-wrap d-flex align-items-center">
                  <div class="shot-product">
                     <p>Sort By:</p>
                  </div>
                  <div class="header-bottom-set dropdown">
                     <button class="dropdown-toggle header-action-btn" data-bs-toggle="dropdown">Default
                     <i class="fa fa-angle-down"></i></button>
                     <ul class="dropdown-menu dropdown-menu-right">
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
                     <div class="tab-content">
                        <div class="tab-pane fade show active mb-n-30px " id="shop-list">
                           <div class="shop-list-wrapper mb-30px">
                           <c:forEach var="o" items="${listProducts}">
                              <div class="row">
                                 <div class="col-md-5 col-lg-5 col-xl-4 mb-lm-30px">
                                    <div class="product">
                                       <div class="thumb">
                                          <a href="<c:url value = "${contextUrl}/admin/product-edit.html/${o.productID}" />" class="image">
                                          <img src="<c:url value = "/static/images/product-image/${o.imageURL}" />" alt="${o.productName}" />
                                          <img class="hover-image" src="<c:url value = "/static/images/product-image/${o.imageURL}" />" alt="${o.productName}" />
                                          </a>
                                          
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-md-7 col-lg-7 col-xl-8">
                                    <div class="content-desc-wrap">
                                       <div class="content">
                                          <span class="category"><a href="#">${o.category.categoryID}</a></span>
                                          <h5 class="title"><a href="<c:url value = "${contextUrl}/admin/product-edit.html/${o.productID}" />" >${o.productName}</a></h5>
                                          <p>${o.description}</p>
                                       </div>
                                       <div class="box-inner">
                                          <span class="price">
                                          <span class="new">${o.price}</span>
                                          </span>
                                          <div class="actions">
                                          	<form action = "<c:url value = "${contextUrl}/admin/product-edit.html/${o.productID}" />">
	                                             <button title="Edit" class="action add-to-cart" data-bs-toggle="modal" data-bs-target="#exampleModal-Cart"><i
	                                                class="pe-7s-pen"></i></button>
	                                          </form>
                                              
                                              <form action = "<c:url value = "${contextUrl}/admin/product-delete/${o.productID}" />">
	                                             <button class="action wishlist" title="Delete" data-bs-toggle="modal" data-bs-target="#exampleModal-Wishlist"><i
	                                                class="pe-7s-trash"></i></button>
                                             </form>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              </c:forEach>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="pro-pagination-style text-center text-lg-end" data-aos="fade-up" data-aos-delay="200">
                  <div class="pages">
                     <ul>
                        <li class="li"><a class="page-link" href="#"><i class="fa fa-angle-left"></i></a>
                        </li>
                        <li class="li"><a class="page-link" href="#">1</a></li>
                        <li class="li"><a class="page-link active" href="#">2</a></li>
                        <li class="li"><a class="page-link" href="#">3</a></li>
                        <li class="li"><a class="page-link" href="#"><i class="fa fa-angle-right"></i></a>
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
                        <li><a href="#" class="selected m-0"> All Products
                           <span></span> </a>
                        </li>
                        <li><a href="#" class=""> SmartPhones
                           <span></span> </a>
                        </li>
                        <li><a href="#" class=""> HeadPhones
                           <span></span> </a>
                        </li>
                        <li><a href="#" class=""> Watches
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