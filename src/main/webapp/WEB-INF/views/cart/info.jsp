<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
${sessionScope['scopedTarget.cartService'].count} items
x
${sessionScope['scopedTarget.cartService'].amount} USD

<a href="/cart/view">View Cart</a>
