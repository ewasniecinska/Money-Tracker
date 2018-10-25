<!DOCTYPE html>
<html lang="en">
  <head>
	<jsp:include page="fragment-body.jsp" />
    <title>Expenses | Login</title>   
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        
        	<!-- Login -->
        <div class="animate form login_form">
          <section class="login_content">
            <form action="loginAction" method="post">
              <h1>Login Form</h1>
              <div>
                <input type="text" name="username" class="form-control" placeholder="Username" required="" />
              </div>
              <div>
                <input type="password" name="password" class="form-control" placeholder="Password" required="" />
              </div>
              <div>
                <input class="btn btn-primary"  type="submit" value="Log in">
              </div>
              
              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>
                
                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-credit-card"></i> Expenses</h1>
                  <p>©2018 All Rights Reserved.</p>
                </div>
              </div>
            </form>
        	</section>
       </div>
        
        
	   <!-- Register -->
       <div id="register" class="animate form registration_form">
         <section class="login_content">
           <form action="registrationAction" method="post">
              <h1>Create Account</h1>
              <div>
                <input type="text" name="username" class="form-control" placeholder="Username" required="" />
              </div>
              <div>
                <input type="email" name="email" class="form-control" placeholder="Email" required="" />
              </div>
              <div>
                <input type="password" name="password" class="form-control" placeholder="Password" required="" />
              </div>
              <div>
                <input class="btn btn-primary" type="submit" value="Register">
              </div>
              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> Login </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-credit-card"></i> Expenses</h1>
                  <p>©2018 All Rights Reserved.</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      
      </div>
   
    </div>
  </body>
</html>
