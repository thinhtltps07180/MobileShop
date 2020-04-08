<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="nav-profile-image">
                  <img src="/static/user/photo/${user.photo}" alt="profile">
                  <span class="login-status online"></span>
                  <!--change to offline or busy as needed-->
                </div>
                <div class="nav-profile-text d-flex flex-column">
                  <span class="font-weight-bold mb-2">${user.name}</span>
                  <span class="text-secondary text-small">Admin Manager</span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/admin/index">
                <span class="menu-title">Dashboard</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/admin/users">
                <span class="menu-title">Users</span>
                <i class="mdi mdi-contacts menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/admin/products">
                <span class="menu-title">Products</span>
                <i class="mdi mdi-basket menu-icon"></i>
              </a>
            </li>
             <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">Management Orders</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-crosshairs-gps menu-icon"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/admin/order">Orders</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/admin/orderStatus">Order Pending</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/admin/isDelivery">Order Paid</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/admin/isPaid">Order Done</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#general-chart" aria-expanded="false" aria-controls="general-chart">
                <span class="menu-title"> Chart</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-medical-bag menu-icon"></i>
              </a>
              <div class="collapse" id="general-chart">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/admin/revenueByDate"> Revenue By Date </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/admin/users">Revenue By Month</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/admin/products"> Revenue By Year </a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#general-pages" aria-expanded="false" aria-controls="general-pages">
                <span class="menu-title"> Pages</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-medical-bag menu-icon"></i>
              </a>
              <div class="collapse" id="general-pages">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/admin/index"> Dashboard </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/admin/users"> User List </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/admin/products"> Product List </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/admin/order"> Orders List </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/admin/orderStatus"> Orders List Pending </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/admin/isDelivery"> Orders List Paid </a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item sidebar-actions">
              <span class="nav-link">
                <div class="border-bottom">
                  <h6 class="font-weight-normal mb-3">Projects</h6>
                </div>
                <button class="btn btn-block btn-lg btn-gradient-primary mt-4">+ Add a project</button>
                <div class="mt-4">
                  <div class="border-bottom">
                    <p class="text-secondary">Categories</p>
                  </div>
                  <ul class="gradient-bullet-list mt-4">
                    <li>Free</li>
                    <li>Pro</li>
                  </ul>
                </div>
              </span>
            </li>
          </ul>
        </nav>