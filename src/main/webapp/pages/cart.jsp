<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="cart-main-area pt-100px pb-100px">
   <div class="container">
      <h3 class="cart-page-title">Your cart items</h3>
      <div class="row">
         <div class="col-lg-12 col-md-12 col-sm-12 col-12">
            <form action="#">
               <div class="table-content table-responsive cart-table-content">
                  <table>
                     <thead>
                        <tr>
                           <th>Image</th>
                           <th>Product Name</th>
                           <th>Quantity</th>
                           <th>Price</th>
                           <th>Action</th>
                        </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="o" items="${listCart}" >
                        <tr>
                           <td class="product-thumbnail">
                              <a href="<c:url value = "${contextUrl}/product-detail.html/${o.product.productID}" />" ><img class="img-responsive ml-15px" src="<c:url value = "/static/images/product-image/${o.imageUrl}" />" alt="" /></a>
                           </td>
                           <td class="product-name"><a href="<c:url value = "${contextUrl}/product-detail.html/${o.product.productID}" />" >${o.productName}</a></td>
                           <td class="product-quantity">
                              <div class="cart-plus-minus">
                                 <input class="cart-plus-minus-box" type="text" value="${o.quantity}" name="qty" class="qty" data-id="${o.product.productID}" />
                              </div>
                           </td>
                           <td class="product-subtotal">${o.price}</td>
                           <td class="product-remove">
                              <a href="#"><i class="fa fa-pencil"></i></a>
                              <a href="<c:url value = "${contextUrl}/cart.html/del/${o.product.productID}" />" ><i class="fa fa-times"></i></a>
                           </td>
                        </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
               <div class="row">
                  <div class="col-lg-12">
                     <div class="cart-shiping-update-wrapper">
                        <div class="cart-shiping-update">
                           <a href="<c:url value = "${contextUrl}/product-list.html" />" >Continue Shopping</a>
                        </div>
                        <div class="cart-clear">
                           <a href="<c:url value = "${contextUrl}/cart.html" />">Update Shopping Cart</a>
                           <a href="<c:url value = "${contextUrl}/cart.html/del/-1" />">Clear Shopping Cart</a>
                        </div>
                     </div>
                  </div>
               </div>
            </form>
            <div class="row">
               <div class="col-lg-4 col-md-12 mt-md-30px">
                  <div class="grand-totall">
                     <a href="<c:url value = "${contextUrl}/checkout.html" />">Proceed to Checkout</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<script type="text/javascript">
			var qties = document.getElementsByClassName('qty');
				for(var i = qties.length - 1; i >= 0; i--){
					qties[i].oninput = function(){
						var qty = this.value;
						var id = this.getAttribute('data-id');
						var xhr = new XMLHttpRequest();
						/* xhr.onload = function(){
							alert(xhr.response);
				} */
				xhr.open('POST', '${contextUrl}/cart.html/edit');
				xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
				xhr.send('id=' + id +'&qty='+qty);
				}
			}
		</script> 