<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="login-register-area pt-100px pb-100px">
   <div class="container">
      <div class="row">
         <div class="col-lg-7 col-md-12 ml-auto mr-auto">
            <div class="login-register-wrapper">
               <div class="login-register-tab-list nav">
                  <a data-bs-toggle="tab" href="#lg2">
                     <h4>register</h4>
                  </a>
               </div>
                  <div id="lg2" class="tab-pane">
                     <div class="login-form-container">
                        <div class="login-register-form">
                          
                           <form action="<c:url value = "${contextUrl}/register.html" />"  method="post">
                              <input type="text" name="userName" placeholder="Username" />
                              <input type="password" name="passWord" placeholder="Password" />
                              <input type="email" name="email" placeholder="Email" />
                              <input type="text" name="firstName"placeholder="First Name" />
                              <input type="text" name="lastName" placeholder="Last Name" />
                              <input type="text" name="address" placeholder="Address" />
                              <input type="text" name="tel" placeholder="Phone Number" />
                              <select name="roleID">
           	  					<option>Choose your role</option>
					             <c:forEach var="role" items="${listRoles}">
					               	<option value="${role.roleID}">${role.roleName}</option>
					             </c:forEach>
					           </select>
                              <div class="button-box">
                                 <button type="submit"><span>Register</span></button>
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