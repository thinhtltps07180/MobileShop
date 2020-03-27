<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<table class="table">
		<thead>
			<tr>
				<th scope="col">Category</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price</th>
				<th scope="col">Min (Product price)</th>
				<th scope="col">Max (Product price)</th>
				<th scope="col">Average (Product price)</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="array" items="${data}">
				<tr>
					<td>${array[0]}</td>
					<td>${array[1]}</td>
					<td><fmt:formatNumber pattern="##,###,###.####"
							value="${array[2]}" /> VND</td>
					<td><fmt:formatNumber pattern="##,###,###.####"
							value="${array[3]}" /> VND</td>
					<td><fmt:formatNumber pattern="##,###,###.####"
							value="${array[4]}" /> VND</td>
					<td><fmt:formatNumber pattern="##,###,###.####"
							value="${array[5]}" /> VND</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br/>
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    var mydata = [
    	['Product', 'Inventory'],
    	<c:forEach var="array" items="${data}">
        ["${array[0]}", ${array[1]}],
        </c:forEach>
      ];
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable(mydata);

        var options = {
          chart: {
            title: 'Inventory',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
	<div id="columnchart_material" style="width: 800px; height: 400px;"></div>
</body>
</html>
