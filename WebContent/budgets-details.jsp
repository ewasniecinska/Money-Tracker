<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="fragment-authorization.jsp" />
    
       
<!DOCTYPE html>
<html lang="en">
  <head>
 	<jsp:include page="fragment-body.jsp" />
    <title>Expenses | Budgets</title>
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
                <h3>Budgets <small>Set goals for your finances</small></h3>
            </div>
		</div>

        <div class="clearfix"></div>
			<div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Add new budget <small></small></h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">
                    <br />
                    
                    <!-- Form to add new income category -->
                    <form class="form-horizontal form-label-left" action="createBuget" method="post" novalidate>

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Budget name<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" type="text" name="budget-name" data-validate-length-range="60" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Category </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="select2_group form-control" name="category-name">

		                  <!-- get mySql connection -->
		                 <%	Connection conn= DBManager.getConnection(); %>
		                      	
		                   
		                 <% try {
							String query = "SELECT * FROM expenses_categories WHERE user = '" + session.getAttribute("id") + "'" + "or user is null";
							Statement stmt=conn.createStatement();
							ResultSet rs=stmt.executeQuery(query);
							while(rs.next()){
						%>
							<option value=<%=rs.getInt("id")%>><%=rs.getString("name") %></option>
						<%}%>
							    <%
							rs.close();
							stmt.close();
						} catch(Exception e) {
							e.printStackTrace();
						} %>
                          
                         </select>
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Start date <span class="required"></span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="date" id="date" name="start-date" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Frequency (in months) <span class="required"></span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="number" id="number" name="frequency" data-validate-minmax="1,12"  required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Budget <span class="required"></span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="number" id="number" name="budget" required="required" class="form-control col-md-7 col-xs-12">
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
                    <!-- End - Form to add new income category -->
                    
                  </div>
                </div>
              </div>
            </div>


            <div class="col-md-12 col-sm-12 col-xs-12">
            		<div class="x_panel">
                  <div class="x_title">
                    <h2>All budgets</h2>
                    
                    <div class="clearfix"></div>
                  </div>
                 
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                    </p>
                    
                    <!-- Table with all income categories -->
                    <table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Name</th>
                          <th>Category</th>
                          <th>Budget</th>
                          <th>Start date</th>
                          <th>End date</th>
                          <th>Action</th>
                        </tr>
                      </thead>
					 <tbody>
                  
                  	<!-- get mySql connection -->                 
	                 <% try {
						String query = "SELECT bud.id, bud.name, cat.name, budget, start_date, DATE_ADD(start_date, INTERVAL frequency MONTH) AS end_date FROM budgets bud JOIN expenses_categories cat ON bud.category = cat.id where bud.user = " + session.getAttribute("id");
						Statement stmt=conn.createStatement();
						ResultSet rs=stmt.executeQuery(query);
						while(rs.next()) {
					%>
					<tr>
    						<td><%=rs.getString("bud.name") %></td>
						<td><%=rs.getString("cat.name") %></td>
						<td><%=rs.getString("budget") %> zł</td>
						<td><%=rs.getString("start_date") %></td>
						<td><%=rs.getString("end_date") %></td>
						<td value="<%=rs.getString("id") %>">						
									<div class="button-container">
										<form action="deleteBuget" method="post">
											<input name="budget-id" style="display:none;" value="<%=rs.getString("bud.id") %>">
											<input type="submit" class="btn btn-danger" value="Delete">
										</form>
										<form action="getBudget" method="post">
											<input name="budget-id" style="display:none;" value="<%=rs.getString("bud.id") %>">
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
                   <!-- End -Table with all income categories -->
                   
                 </div>
               </div>
              </div>
             </div>
            </div>
            
            
			  <!-- The Modal -->
			  <div class="modal" id="myModal">
			    <div class="modal-dialog">
			      <div class="modal-content">
      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">Edit your budget</h4>
		        </div>
        
			    <!-- Modal body -->
			    <div class="modal-body">
			    		/// TO-DO
			    </div>
			        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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