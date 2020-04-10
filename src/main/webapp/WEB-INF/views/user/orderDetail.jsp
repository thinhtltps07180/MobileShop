<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<style>
 @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

 body {
     background-color: #eeeeee;
     font-family: 'Open Sans', serif
 }
 
 .order_details_table {
    width: 100%;
}

i.fa.fa-shopping-cart {
    margin: 10px;
}

i.fa.fa-truck {
    margin: 10px;
}

i.fab.fa-amazon-pay {
    margin: 10px;
}

i.fas.fa-handshake {
    margin: 10;
}

 .card {
     position: relative;
     display: -webkit-box;
     display: -ms-flexbox;
     display: flex;
     -webkit-box-orient: vertical;
     -webkit-box-direction: normal;
     -ms-flex-direction: column;
     flex-direction: column;
     min-width: 0;
     word-wrap: break-word;
     background-color: #fff;
     background-clip: border-box;
     border: 1px solid rgba(0, 0, 0, 0.1);
     border-radius: 0.10rem
 }

 .card-header:first-child {
     border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0
 }

 .card-header {
     padding: 0.75rem 1.25rem;
     margin-bottom: 0;
     background-color: #fff;
     border-bottom: 1px solid rgba(0, 0, 0, 0.1)
 }

 .track {
     position: relative;
     background-color: #ddd;
     height: 7px;
     display: -webkit-box;
     display: -ms-flexbox;
     display: flex;
     margin-bottom: 60px;
     margin-top: 50px
 }

 .track .step {
     -webkit-box-flex: 1;
     -ms-flex-positive: 1;
     flex-grow: 1;
     width: 25%;
     margin-top: -18px;
     text-align: center;
     position: relative
 }
 article.card {
    padding-top: 20px;
}

.container {padding-top: 20px;}
 i.fa.fa-check {
    margin: 10px;
}

 .track .step.active:before {
     background: #FF5722
 }

 .track .step::before {
     height: 7px;
     position: absolute;
     content: "";
     width: 100%;
     left: 0;
     top: 18px
 }
 
  .track .step.cancel:before {
     background: #FF0000
 }

i.fas.fa-trash {
    margin: 10px;
}

 .track .step.cancel .icon {
     background: #FF0000;
     color: #fff
 }
 
  .track .step.active .icon {
     background: #ee5435;
     color: #fff
 }

 .track .icon {
     display: inline-block;
     width: 40px;
     height: 40px;
     line-height: 40px;
     position: relative;
     border-radius: 100%;
     background: #ddd
 }

 .track .step.active .text {
     font-weight: 400;
     color: #000
 }

 .track .text {
     display: block;
     margin-top: 7px
 }

 .itemside {
     position: relative;
     display: -webkit-box;
     display: -ms-flexbox;
     display: flex;
     width: 100%
 }

 .itemside .aside {
     position: relative;
     -ms-flex-negative: 0;
     flex-shrink: 0
 }

 .img-sm {
     width: 80px;
     height: 80px;
     padding: 7px
 }

 ul.row,
 ul.row-sm {
     list-style: none;
     padding: 0
 }

 .itemside .info {
     padding-left: 15px;
     padding-right: 7px
 }

 .itemside .title {
     display: block;
     margin-bottom: 5px;
     color: #212529
 }

 p {
     margin-top: 0;
     margin-bottom: 1rem
 }

 .btn-warning {
     color: #ffffff;
     background-color: #ee5435;
     border-color: #ee5435;
     border-radius: 1px
 }

 .btn-warning:hover {
     color: #ffffff;
     background-color: #ff2b00;
     border-color: #ff2b00;
     border-radius: 1px
 }
 
 
</style>
<!-- ================ start banner area ================= -->

<!-- ================ end banner area ================= -->

<!--================Order Details Area =================-->
<div class="container">
    <article class="card">
        <header class="card-header"> My Orders / Tracking </header>
        <div class="card-body">
            <h6>Order ID: ${order.id}</h6>
            <a href="/user/rejectOrder/${order.id}/${order.id}" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Cancel orders</a>
            <article class="card">
                <div class="card-body row">
                    <div class="col"> <strong>Order Date:</strong> <br>${order.orderDate} </div>
                   <div class="col"> <strong>Status:</strong> <br>${order.status.name} </div>
                    <div class="col"> <strong>Total:</strong> <br> <c:set var="basecost"
							value="order.amount" /><fmt:formatNumber pattern="##,###,###.####"
							value="${order.amount}" /> Vnđ</div> 
                    <div class="col"> <strong>OrderBy :</strong> <br> ${order.user.id} </div>
                </div>
            </article>
            <div class="track">
            <c:if test="${order.status.id == 1}">
			<div class="step active"> <span class="icon"> <i class="fa fa-shopping-cart"></i> </span> <span class="text">Order</span> </div>
                <div class="step"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Order confirmed</span> </div>
                <div class="step "> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> delivery</span> </div>
                <div class="step "> <span class="icon"> <i class="fab fa-amazon-pay"></i> </span> <span class="text">Paid</span> </div>
                <div class="step"> <span class="icon"> <i class="fas fa-handshake"></i> </span> <span class="text">Done</span> </div>
			</c:if>
			
			<c:if test="${order.status.id == 2}">
			<div class="step active"> <span class="icon"> <i class="fa fa-shopping-cart"></i> </span> <span class="text">Order</span> </div>
                <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Order confirmed</span> </div>
                <div class="step active"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> delivery</span> </div>
                <div class="step "> <span class="icon"> <i class="fab fa-amazon-pay"></i> </span> <span class="text">Paid</span> </div>
                <div class="step"> <span class="icon"> <i class="fas fa-handshake"></i> </span> <span class="text">Done</span> </div>
			</c:if>
			
			<c:if test="${order.status.id == 3}">
			<div class="step active"> <span class="icon"> <i class="fa fa-shopping-cart"></i> </span> <span class="text">Order</span> </div>
                <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Order confirmed</span> </div>
                <div class="step active"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> delivery</span> </div>
                <div class="step active"> <span class="icon"> <i class="fab fa-amazon-pay"></i> </span> <span class="text">Paid</span> </div>
                <div class="step"> <span class="icon"> <i class="fas fa-handshake"></i> </span> <span class="text">Done</span> </div>
			</c:if>
			
			<c:if test="${order.status.id == 4}">
			<div class="step cancel"> <span class="icon"> <i class="fas fa-trash"></i> </span> <span class="text">Cancel order</span> </div>
			</c:if>
			
			            <c:if test="${order.status.id == 5}">
			<div class="step active"> <span class="icon"> <i class="fa fa-shopping-cart"></i> </span> <span class="text">Order</span> </div>
                <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Order confirmed</span> </div>
                <div class="step active "> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> delivery</span> </div>
                <div class="step active"> <span class="icon"> <i class="fab fa-amazon-pay"></i> </span> <span class="text">Paid</span> </div>
                <div class="step active"> <span class="icon"> <i class="fas fa-handshake"></i> </span> <span class="text">Done</span> </div>
			</c:if>






            </div>
            <hr>
            <ul class="row">
            <div class="order_details_table">
			<h2>Order Details</h2>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Product</th>
							<th scope="col">Quantity</th>
							<th scope="col">Price</th>
							<th scope="col">Promotion</th>
							<th scope="col">Total</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ldt" items="${listDetail}">
							<tr>
								<td>${ldt.product.name}</td>
								<td>${ldt.quantity}</td>
								<c:set var="basecost" value="ldt.product.unitPrice" />
								<td><fmt:formatNumber pattern="##,###,###.####"
								value="${ldt.product.unitPrice}" /> Vnđ</td>
								<td>${ldt.product.promotion.name}</td>
								<c:set var="basecost" value="ldt.product.unitPrice" />
								<td><fmt:formatNumber pattern="##,###,###.####"
								value="${(ldt.product.unitPrice-(ldt.product.unitPrice/100*ldt.product.promotion.discount))*ldt.quantity}" /> Vnđ</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
            </ul>
            <hr>
            <a href="/user/orderList" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Back to orders</a>
        </div>
    </article>
</div>



<!--================End Order Details Area =================-->