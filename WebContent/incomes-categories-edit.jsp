<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="fragment-authorization.jsp" />
    
       
<!DOCTYPE html>
<html lang="en">
  <head>
 	<jsp:include page="fragment-body.jsp" />
    <title>Expenses | Incomes</title>
  </head>

  <body class="nav-md">
 
  <!-- add fragment with menu -->
  <jsp:include page="fragment-menu.jsp" />
  
  <!-- import -->
  <%@ page import="com.mysql.jdbc.PreparedStatement"%>
  <%@ page import="java.sql.Connection" %>
  <%@ page import="java.sql.SQLException" %>
  <%@ page import="pl.wap.DBManager" %>	
  <%@ page import="java.sql.Statement" %>
  <%@ page import="java.sql.ResultSet" %>
  <%@ page import="pl.wap.incomes.*"%>
   
  <!-- page content -->
  <div class="right_col" role="main">
  	<div class="">
    		<div class="page-title">
        		<div class="title_left">
                <h3>Incomes <small>Categories</small></h3>
            </div>
		</div>

        <div class="clearfix"></div>
			<div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Edit category <small></small></h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">
                    
                    <!-- Form to add new income category -->
					<form class="form-horizontal form-label-left" action="updateIncomesCategory" method="post" novalidate>

					<input name="category-id" style="display:none;" value="<%=request.getAttribute("categoryID") %>">
						
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Category name<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" name="category-name" required="required" class="form-control col-md-7 col-xs-12" value="<%= request.getAttribute("categoryName") %>">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Description <span class="required"></span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" name="category-description" required="required" class="form-control col-md-7 col-xs-12" value="<%= request.getAttribute("descriptionName") %>">
                        </div>
                      </div>
                      
                      <div class="ln_solid"></div>
                      
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-3">
						 <input class="btn btn-primary" type="reset" value="Reset">
                          <input type="submit" class="btn btn-success" value="Update">
                        </div>
                      </div>

                    </form>
                    <!-- End - Form to add new income category -->
                    
                  </div>
                </div>
              </div>
            </div>


          
                 </div>
               </div>

            


    <!-- /page content -->
    
    <!-- footer content -->
 	<jsp:include page="fragment-footer.jsp" />
    <!-- /footer content -->
     <!-- jQuery -->
    <script src="extras/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="extras/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="extras/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="extras/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="extras/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="extras/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="extras/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="extras/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="extras/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="extras/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="extras/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="extras/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="extras/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="extras/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="extras/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="extras/jszip/dist/jszip.min.js"></script>
    <script src="extras/pdfmake/build/pdfmake.min.js"></script>
    <script src="extras/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="extras/js/custom.min.js"></script>
    
    <!-- validator -->
    <script src="extras/validator/validator.js"></script>


	</body>
</html>