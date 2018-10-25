<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="fragment-authorization.jsp" />
    
       
<!DOCTYPE html>
<html lang="en">
  <head>
 	<jsp:include page="fragment-body.jsp" />
    <title>Expenses | Expenses</title>
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
   
  <!-- page content -->
  <div class="right_col" role="main">
  	<div class="">
    		<div class="page-title">
        		<div class="title_left">
            		<h3>Expenses <small>Categories</small></h3>
            </div>
		</div>

        <div class="clearfix"></div>

		<div class="row">
        		<div class="col-md-12 col-sm-12 col-xs-12">
            		<div class="x_panel">
                  <div class="x_title">
                    <h2>Add new category <small></small></h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">
                    
                    <!-- Form adding expenses category -->
                    <form class="form-horizontal form-label-left" action="addExpensesCategory" method="post" novalidate>

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Category name<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text"  name="category-name" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Description <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text"  name="category-description" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-8 col-md-offset-3">
						 <input class="btn btn-primary" type="reset" value="Reset">
                          <input type="submit" class="btn btn-success" value="Create">
                        </div>
                      </div>

                    </form>
                    <!-- Form adding expenses category -->
                    
                 </div>
               </div>
             </div>
           </div>


           <div class="col-md-12 col-sm-12 col-xs-12">
           	<div class="x_panel">
            		<div class="x_title">
                    <h2>All expenses</h2>

                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                    </p>
                    <table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Name</th>
                          <th>Description</th>
                          <th>Action</th>
                        </tr>
                      </thead>
					  <tbody>
                  
		                 <!-- get mySql connection -->
		                 <%	Connection conn= DBManager.getConnection(); %>
		                 
		                 <% try {
							String query = "SELECT * FROM expenses_categories WHERE user = '" + session.getAttribute("id") + "'" + "or user is null";
							Statement stmt=conn.createStatement();
							ResultSet rs=stmt.executeQuery(query);
							while(rs.next()) {
						%>
							<tr>
		    						<td><%=rs.getString("name") %></td>
								<td><%=rs.getString("description") %></td>
								<td>
									<div class="button-container">
										<form action="deleteExpensesCategory" method="post">
											<input name="category-id" style="display:none;" value="<%=rs.getString("id") %>">
											<input type="submit" class="btn btn-danger" value="Delete">
										</form>
										<form action="getExpenesesCategoryData" method="post">
											<input name="category-id" style="display:none;" value="<%=rs.getString("id") %>">
											<input type="submit" class="btn btn-warning" value="Edit">	
										</form>
									</div>	
								</td>
							</tr>
						<%}%>
							<%
							 rs.close();
							 stmt.close();
							 //conn.close();
						  } catch(Exception e) {
							    e.printStackTrace();
						  }%>
							
				
                    </tbody>
                   </table>
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