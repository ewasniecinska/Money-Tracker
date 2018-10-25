<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="fragment-authorization.jsp" />

<!DOCTYPE html>
<html lang="en">
  <head>
 	<jsp:include page="fragment-body.jsp" />
    <title>Expenses | Dashboard</title>
  </head>
  

  <body class="nav-md">
 
  <!-- add fragment with menu -->
  <jsp:include page="fragment-menu.jsp" />
  
  <%@ page import="pl.wap.Summery"%>
  <% Object userId = session.getAttribute("id"); 
  	Summery summery = new Summery();
  %>
  <!-- page content -->
  <div class="right_col" role="main">
  	<div class="">
    	<div class="row top_tiles">
              <div class="animated flipInY col-lg-6 col-md-6 col-sm-6 col-xs-6">
                <div class="tile-stats">
                  <div class="count"> <%= summery.getExpensesSumMonth(userId) %> zł </div>
                  <h3 style="color:#993333;">Monthly expenses</h3>
                  <p>Last month you spent <%= summery.getExpensesSumLastMonth(userId) %> zł<p>
                </div>
              </div>
              <div class="animated flipInY col-lg-6 col-md-6 col-sm-6 col-xs-6">
                <div class="tile-stats">
                  <div class="count"><%= summery.getIncomesSumMonth(userId) %> zł</div>
                  <h3 style="color:green;">Monthly incomes</h3>
                  <p>Last month you earned <%= summery.getIncomesSumLastMonth(userId) %> zł<p>
                </div>
              </div>
            </div>

           
            
             <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Spendings: This week vs Last week<small></small></h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">
					<div id="summery" style="height: 300px; width: 100%;"></div>
                  </div>



                  </div>
                </div>
              </div>
              
               <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Budgets overview<small></small></h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">
					<div id="budgets" style="height: 300px; width: 100%;"></div>
                    </div>



                  </div>
                </div>
              </div>
            </div>

            
            <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Monthly expenses by category</h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content2">

					<div id="monthlyExpenses" style="height: 370px; width: 100%;"></div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Monthly incomes by category</h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content2">

					<div id="monthlyIncomes" style="height: 370px; width: 100%;"></div>
                  </div>
                </div>
              </div>
              
            </div>
 
        </div>

            


<!-- /page content -->
    
<!-- footer content -->
<jsp:include page="fragment-footer.jsp" />
<!-- /footer content -->
	 
<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="https://www.amcharts.com/lib/3/gauge.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>


<!-- Chart code -->


<script>
var monthlyIncomes = AmCharts.makeChart( "monthlyIncomes", {
	  "type": "pie",
	  "theme": "light",
	  "dataProvider": <%out.print(summery.getMonthlyIncomesByCategory(userId));%>,
	  "valueField": "y",
	  "titleField": "label",
	   "balloon":{
	   "fixedPosition":true
	  },
	  "export": {
	    "enabled": false
	  }
	} );
	
var monthlyExpenses = AmCharts.makeChart( "monthlyExpenses", {
	  "type": "pie",
	  "theme": "light",
	  "dataProvider": <%out.print(summery.getMonthlyExpensesByCategory(userId));%>,
	  "valueField": "y",
	  "titleField": "label",
	   "balloon":{
	   "fixedPosition":true
	  },
	  "export": {
	    "enabled": false
	  }
	} );
	
var budgetsCharts = AmCharts.makeChart( "budgets", {
	  "type": "serial",
	  "theme": "light",
	  "dataProvider": <% out.print(summery.getBudgetsSummery(userId));%>,
	  "valueAxes": [ {
	    "gridColor": "#FFFFFF",
	    "gridAlpha": 0.2,
	    "dashLength": 0
	  } ],
	  "gridAboveGraphs": true,
	  "startDuration": 1,
	  "graphs": [ {
	    "balloonText": "[[category]]: <b>[[value]] %</b>",
	    "fillAlphas": 0.8,
	    "lineAlpha": 0.2,
	    "type": "column",
	    "valueField": "y"
	  } ],
	  "chartCursor": {
	    "categoryBalloonEnabled": false,
	    "cursorAlpha": 0,
	    "zoomable": false
	  },
	  "categoryField": "label",
	  "categoryAxis": {
	    "gridPosition": "start",
	    "gridAlpha": 0,
	    "tickPosition": "start",
	    "tickLength": 20
	  },
	  "export": {
	    "enabled": false
	  }

	} );
	
	
var summery = AmCharts.makeChart("summery", {
    "theme": "light",
    "type": "serial",
    "dataProvider": [{
        "day": "Monday",
        "lastWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Monday", 0));%>,
        "thisWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Monday", 1));%>
    }, {
        "day": "Tuesday",
        "lastWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Tuesday", 0));%>,
        "thisWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Tuesday", 1));%>
    }, {
        "day": "Wednesday",
        "lastWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Wednesday", 0));%>,
        "thisWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Wednesday", 1));%>
    }, {
        "day": "Thursday",
        "lastWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Thursday", 0));%>,
        "thisWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Thursday", 1));%>
    }, {
        "day": "Friday",
        "lastWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Friday", 0));%>,
        "thisWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Friday", 1));%>
    }, {
        "day": "Saturday",
        "lastWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Saturday", 0));%>,
        "thisWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Saturday", 1));%>
    }, {
        "day": "Sunday",
        "lastWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Sunday", 0));%>,
        "thisWeek": <% out.print(summery.getExpensesByWeekDay(userId, "Sunday", 1));%>
    }],
    "valueAxes": [{
        "unit": "zł",
        "position": "left",
        "title": "expenses",
    }],
    "startDuration": 1,
    "graphs": [{
        "balloonText": "Last [[day]] you spent: <b>[[value]] zł</b>",
        "fillAlphas": 0.3,
        "lineAlpha": 0.2,
        "title": "Last Week",
        "type": "column",
        "valueField": "lastWeek"
    }, {
        "balloonText": "This [[day]] you spent: <b>[[value]] zł</b>",
        "fillAlphas": 0.9,
        "lineAlpha": 0.2,
        "title": "This Week",
        "type": "column",
        "clustered":false,
        "columnWidth":0.5,
        "valueField": "thisWeek"
    }],
    "plotAreaFillAlphas": 0.1,
    "categoryField": "day",
    "categoryAxis": {
        "gridPosition": "start"
    },


});
</script>

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
