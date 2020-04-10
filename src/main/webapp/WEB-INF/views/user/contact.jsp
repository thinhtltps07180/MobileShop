<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<section class="section-margin--small">
	<div class="container">
		<div class="d-none d-sm-block mb-5 pb-4">
			<div id="map" style="height: 420px;"></div>
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.266898219578!2d106.67997221474903!3d10.79085869231172!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528d35939c66f%3A0xe52e3ed732b15272!2sFPT%20Polytechnic%20HCM!5e0!3m2!1sen!2s!4v1586537586483!5m2!1sen!2s"
				width="100%" height="450" frameborder="0" style="border: 0;"
				allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
		</div>


		<div class="row">
			<div class="col-md-4 col-lg-3 mb-4 mb-md-0">
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-home"></i></span>
					<div class="media-body">
						<h3>Ho Chi Minh city</h3>
						<p>391A Nam Kỳ Khởi Nghĩa, Phường 8, Quận 3, Hồ Chí Minh</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-headphone"></i></span>
					<div class="media-body">
						<h3>
							<a href="tel:454545654"> (84) 337 039 857</a>
						</h3>
						<p>Mon to Fri 9am to 6pm</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-email"></i></span>
					<div class="media-body">
						<h3>
							<a href="mailto:support@colorlib.com">tranlethanhthinh@gmail.com</a>
						</h3>
						<p>Send us your query anytime!</p>
					</div>
				</div>
			</div>
			<div class="col-md-8 col-lg-9">
				<form class="row tracking_form" action="/user/contact" method="post"
					novalidate="novalidate" enctype="multipart/form-data">
					<div class="row">
						<div class="col-lg-5">
							<div class="form-group">
								<input class="form-control" name="id" id="id" type="text"
									placeholder="Enter your name">
							</div>
							<div class="form-group">
								<input class="form-control" name="email" id="email" type="email"
									placeholder="Enter email address">
							</div>
							<div class="form-group">
								<input class="form-control" name="subject" id="subject"
									type="text" placeholder="Enter Subject">
							</div>
						</div>
						<div class="col-lg-7">
							<div class="form-group">
								<textarea class="form-control different-control w-100"
									name="message" id="message" cols="30" rows="5"
									placeholder="Enter Message"></textarea>
							</div>
						</div>
					</div>
					<div class="form-group text-center text-md-right mt-3">
						<button type="submit"
							class="button button--active button-contactForm">Send
							Message</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
