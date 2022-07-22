<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="login-register-area pt-100px pb-100px">
   <div class="container">
      <div class="row">
         <div class="col-lg-7 col-md-12 ml-auto mr-auto">
            <div class="login-register-wrapper">
               <div class="login-register-tab-list nav">
                  <a class="active" data-bs-toggle="tab" href="#lg1">
                     <h4>login</h4>
                  </a>
               </div>
               
                  <div id="lg1" class="tab-pane active">
                     <div class="login-form-container">
                        <div class="login-register-form">
                           <form method="post">
                           	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                              <input type="text" name="userName" placeholder="Username" />
                              <input type="password" name="passWord" placeholder="Password" />
                              <div class="button-box">
                                 <div class="login-toggle-btn">
                                    <input type="checkbox" />
                                    <a class="flote-none" href="javascript:void(0)">Remember me</a>
                                    <a href="#">Forgot Password?</a>
                                 </div>
                                 <button type="submit"><span>Login</span></button>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
                  
               
            </div>
         </div>
      </div>
   </div>
</div>