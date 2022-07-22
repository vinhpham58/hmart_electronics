<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="checkout-area pt-100px pb-100px">
   <div class="container">
      <div class="row">
         <div class="col-lg-7">
            <div class="billing-info-wrap">
               <h3>Billing Details</h3>
               <div class="row">
                  <div class="col-lg-6 col-md-6">
                     <div class="billing-info mb-4">
                        <label>First Name</label>
                        <input type="text" placeholder= "Please input!" />
                     </div>
                  </div>
                  <div class="col-lg-6 col-md-6">
                     <div class="billing-info mb-4">
                        <label>Last Name</label>
                        <input type="text" placeholder= "Please input!" />
                     </div>
                  </div>
                  <div class="col-lg-12">
                     <div class="billing-info mb-4">
                        <label>Address</label>
                        <input class="billing-address" placeholder= "Please input!" type="text" />
                     </div>
                  </div>
                  <div class="col-lg-6 col-md-6">
                     <div class="billing-info mb-4">
                        <label>Phone</label>
                        <input type="text" placeholder = "Please input!" />
                     </div>
                  </div>
                  <div class="col-lg-6 col-md-6">
                     <div class="billing-info mb-4">
                        <label>Email Address</label>
                        <input type="text" placeholder = "Please input!"/>
                     </div>
                  </div>
               </div>
               <div class="checkout-account mb-30px">
                  <input class="checkout-toggle2 w-auto h-auto" type="checkbox" />
                  <label>Create an account?</label>
               </div>
               <div class="checkout-account-toggle open-toggle2 mb-30">
                  <input placeholder="Username" type="text" />
                  <input placeholder="Password" type="password" />
                  <input placeholder="Confirm your password" type="password" />
                  <button class="btn-hover checkout-btn" type="submit">register</button>
               </div>
               <div class="additional-info-wrap">
                  <h4>Additional information</h4>
                  <div class="additional-info">
                     <label>Order notes</label>
                     <textarea placeholder="Notes about your order, e.g. special notes for delivery. " name="message"></textarea>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-lg-5 mt-md-30px mt-lm-30px ">
            <div class="your-order-area">
               <h3>Your order</h3>
               <div class="your-order-wrap gray-bg-4">
                  <div class="your-order-product-info">
                     <div class="your-order-top">
                        <ul>
                           <li>Product</li>
                           <li>Total</li>
                        </ul>
                     </div>
                     <div class="your-order-middle">
                        <ul>
                           <li><span class="order-middle-left">Product Name X 1</span> <span
                              class="order-price">$100 </span></li>
                           <li><span class="order-middle-left">Product Name X 1</span> <span
                              class="order-price">$100 </span></li>
                        </ul>
                     </div>
                     <div class="your-order-bottom">
                        <ul>
                           <li class="your-order-shipping">Shipping</li>
                           <li>Free shipping</li>
                        </ul>
                     </div>
                     <div class="your-order-total">
                        <ul>
                           <li class="order-total">Total</li>
                           <li>$100</li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="Place-order mt-25">
                  <a class="btn-hover" href="#">Place Order</a>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>