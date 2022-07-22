<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><tiles:insertAttribute name="title" /></title>
    <meta name="robots" content="index, follow" />
    <meta name="description" content="Hmart-Smart Product eCommerce html Template">
    <link rel="shortcut icon" type="image/x-icon" href=  "<c:url value = "/static/images/favicon.ico" />"  /> 
    <link rel="stylesheet" href="<c:url value = "/static/css/plugins.min.css" />" >
    <link rel="stylesheet" href="<c:url value = "/static/css/style.min.css" />" >  
     
</head>
<body>
	<div class="main-wrapper">
        <header>
            <div class="header-top">
                <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col">
                            <div class="welcome-text">
                                <p>World Wide Completely Free Returns and Shipping</p>
                            </div>
                        </div>
                        <div class="col d-none d-lg-block">
                            <div class="top-nav">
                                <ul>
                                	<c:choose>
                                		<c:when test = "${not empty pageContext.request.userPrincipal.name}">
		                                	<li style ="color: wheat">Welcome ${pageContext.request.userPrincipal.name}!<li>
		                                	<li>
												<form class="form-hidden" method="post" action="<c:url value = "${contextUrl}/logout.html" />" >
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
													<button style ="color: wheat" >Log out</button>	fa fa-arrow-circle-o-right
												</form> 
											</li>
	                                    </c:when>
	                                    <c:otherwise>
		                                    <li><a href="<c:url value = "${contextUrl}/login.html" />" ><i class="fa fa-user"></i>Login</a></li>
		                                    <li><a href="<c:url value = "${contextUrl}/register.html" />" ><i class="fa fa-user"></i>Register</a></li>
                                		</c:otherwise>
                                	</c:choose>
                                </ul>         
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="header-bottom  d-none d-lg-block">
                <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-3 col">
                            <div class="header-logo">
                                <a href="<c:url value = "${contextUrl}/index.html" />" ><img src="<c:url value = "/static/images/logo/logo.png" />" alt="Site Logo" /></a>
                            </div>
                        </div>
                       <!--  <div class="col-lg-6 d-none d-lg-block">
                            <div class="search-element">
                                <form action="#">
                                    <input type="text" placeholder="Search for products" />
                                    <button><i class="pe-7s-search"></i></button>
                                </form>
                            </div>
                        </div> -->
                        <div class="col-lg-3 col">
                            <div class="header-actions">
                                <a href="#offcanvas-cart" class="header-action-btn header-action-btn-cart offcanvas-toggle pr-0">
                                    <i class="pe-7s-shopbag"></i>
                                    <span class="header-action-num">01</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-nav-area d-none d-lg-block sticky-nav">
                <div class="container">
                    <div class="header-nav">
                        <div class="main-menu position-relative">
                            <ul>
                                <li><a href="<c:url value = "${contextUrl}/index.html" />" >Home</a></li>
                                <li><a href="<c:url value = "${contextUrl}/product-list.html" />" >Product List</a></li>
                                <li><a href="<c:url value = "${contextUrl}/check-out.html"/>" >Check Out</a></li>
                                <li><a href="<c:url value = "${contextUrl}/admin/product-list.html"/>" >Product Management (For Admins)</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div id="offcanvas-cart" class="offcanvas offcanvas-cart">
            <div class="inner">
                <div class="head">
                    <span class="title">Cart</span>
                    <button class="offcanvas-close">×</button>
                </div>
                <div class="body customScroll">
                    <ul class="minicart-product-list">
                    	<c:forEach var="o" items="${listCart}" >
                        <li>
                            <a href="<c:url value = "${contextUrl}/product-detail.html/${o.product.productID}" />" class="image"><img src="<c:url value = "/static/images/product-image/${o.imageUrl}" />" alt="${o.productName}"></a>
                            <div class="content">
                                <a href="<c:url value = "${contextUrl}/product-detail.html/${o.product.productID}" />" class="title">${o.productName}</a>
                                <span class="quantity-price">${o.quantity} x <span class="amount">${o.price}</span></span>
                                <a href="#" class="remove">×</a>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="foot">
                    <div class="buttons mt-30px">
                        <a href="<c:url value = "${contextUrl}/cart.html" />" class="btn btn-dark btn-hover-primary mb-30px">view cart</a>
                        <a href="<c:url value = "${contextUrl}/checkout.html" />" class="btn btn-outline-dark current-btn">checkout</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="main">
			<tiles:insertAttribute name="content" />
		</div>
    </div>

    <script src="<c:url value = "/static/js/vendor.min.js" />" ></script>
    <script src="<c:url value = "/static/js/plugins.min.js" />" ></script>
    <script src="<c:url value = "/static/js/main.min.js" />" ></script>
</body>
</html>