<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<div style="display: none;">
${sessionScope['scopedTarget.cartService'].count} items
x
${sessionScope['scopedTarget.cartService'].amount} USD
</div>



