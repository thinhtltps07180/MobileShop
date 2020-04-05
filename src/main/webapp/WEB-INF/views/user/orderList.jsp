<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> Data Table Orders
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>

						<th>OrderDate</th>
						<th>Amount</th>
						<th>OrderBy</th>
						<th>Status</th>
						<th>OrderDetails</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="ldt" items="${listDetailByUser}" varStatus="loopCounter">
						<tr>

							<td>${ldt.orderDate}</td>
							<c:set var="basecost"
							value="ldt.amount" />
							<td><fmt:formatNumber pattern="##,###,###.####"
							value="${ldt.amount}" /></td>
							<td>${ldt.user.id}</td>
							<c:set var="st" scope="session" value="${ldt.status.id}" />
							<c:if test="${st == 1}">
								<td>${ldt.status.name} <a class="check-list"
											href="/user/cancle/${loopCounter.count}/${ldt.id}"
											id="${loopCounter.count}"><button
													style="font-size: 24px; color: red">
													<i class="far fa-trash-alt"></i>
										</button></a> </td>
							</c:if>
							<c:if test="${st > 1}">
								<td>${ldt.status.name}</td>
							</c:if>



							<td><a href="/user/orderDetail/${ldt.id}/${ldt.id}">Detail</a>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<div class="card-footer small text-muted">Updated yesterday at
		11:59 PM</div>
</div>
