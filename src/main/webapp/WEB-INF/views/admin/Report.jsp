<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Report</title>
</head>
<body>

	<table class="table">
		<thead>
			<tr>
				<th scope="col">Category</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price</th>
				<th scope="col">Min</th>
				<th scope="col">Max</th>
				<th scope="col">Average</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="array" items="${data}">
				<tr>
					<td>${array[0]}</td>
					<td>${array[1]}</td>
					<td>${array[2]}</td>
					<td>${array[3]}</td>
					<td>${array[4]}</td>
					<td>${array[5]}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>

</body>
</html>