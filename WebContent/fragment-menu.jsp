<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title">
              <a href="index.jsp" class="site_title"><i class="fa fa-credit-card"></i> <span>Expenses</span></a>
            </div>

            <div class="clearfix"></div>

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <ul class="nav side-menu">
                  <li><a href="index.jsp"><i class="fa fa-home"></i> Home </a></li>                
                  
                  <li><a href="settings.jsp"><i class="fa fa-user"></i> User Profile </span></a></li>
                  
                  <li><a><i class="fa fa-cart-arrow-down"></i> Expenses <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="expenses-details.jsp">Expenses</a></li>
                      <li><a href="expenses-categories.jsp">Categories</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-line-chart"></i> Incomes <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="incomes-details.jsp">Incomes</a></li>
                      <li><a href="incomes-categories.jsp">Categories</a></li>
                    </ul>
                  </li>
                  <li><a href="budgets-details.jsp"><i class="fa fa-bar-chart"></i> Budgets</a>
                  
                  </li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->


          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle">
                    	<form action="logout" method="post">
                    <input class="btn btn-primary" value="Log Out" type="submit">
                    </form>
                  </a>
                  
                </li>


              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->