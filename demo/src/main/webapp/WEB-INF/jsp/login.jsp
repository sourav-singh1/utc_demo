<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<link rel="stylesheet" href="css/main.css">
<meta charset="ISO-8859-1">
<title>${title }</title>
</head>
<body>
	<div class="" id="page-container" style="margin-top: 70px">
		<div id="content-wrap">
		
			<div class="form-popup" id="myForm">
				<form action="/login" class="form-container">
					<h1 style="text-align: center">Login</h1>

					<label for="email"><b>Email</b></label> <input type="text"
						placeholder="Enter Email" name="email" required> <label
						for="psw"><b>Password</b></label> <input type="password"
						placeholder="Enter Password" name="psw" required>

					<button type="submit" class="btn">Login</button>
					<button type="submit" class="btn" id="regBtn" onclick="regForm()">Register
						Here!</button>
				</form>
			</div>

			<div class="form-popup" id="regForm">
				<form:form method="post" modelAttribute="employee"
					action="/registration" class="form-container">
					<h1>Registration</h1>
					<label for="name"><b>Employee Name</b> <span
						class="required">*</span><span id="hmsg" class="hidden">this
							field is required</span> <form:input type="text" id="empname"
							path="empName" name="empname" placeholder="Enter employee name" onkeydown="getData()"/></label>
					<label for="code"><b>Employee Code</b></label>
					<span class="required">*</span>
					<form:input id="empcode" path="empCode" />
					<label for="dept"><b>Employee Department</b></label>
					<span class="required" id="test">*</span>
					<form:input id="dept" path="dept"  disabled="true"/>
					<label for="address"><b>Employee Address</b></label>
					<span class="required">*</span>
					<form:input id="address" path="Address" />
					<label for="designation"><b>Employee Designation</b></label>
					<span class="required">*</span>
					<form:input id="desig" path="desig" />
					<label for="salary"><b>Employee Salary</b></label>
					<span class="required">*</span>
					<form:input id="salary" path="salary" />
					<button type="button" class="btn" id="previewData">Register</button>
					<button type="button" class="btn cancel" onclick="closeForm()">Cancel</button>
				</form:form>
			</div>

			<div class="form-popup" id="preview">
				<form:form method="post" id="previewForm" action="/registration"
					modelAttribute="employee" class="form-container">
					<h1 id="datasubmitted" class="hidden">Data Submitted</h1>
					<h1 id="modifydata" class="hidden">Modify Data</h1>
				</form:form>
			</div>
			
			<!-- end of content -->
		</div>
		<!-- end of page container -->
	</div>
	
</body>
</html>