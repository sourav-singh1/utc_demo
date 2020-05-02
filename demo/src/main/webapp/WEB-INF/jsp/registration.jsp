<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>
		<spring:message code="lbl.page" text="Add New Employee" />
	</h2>
	<br />
	<form:form method="post" modelAttribute="employee" action="/registration">
		<table>
			<tr>
				<td><spring:message code="lbl.firstName" text="Employee Name" /></td>
				<td><form:input path="empName" /></td>
			</tr>
			<tr>
				<td><spring:message code="lbl.lastName" text="Employee Code" /></td>
				<td><form:input path="empCode" /></td>
			</tr>
			<tr>
				<td><spring:message code="lbl.email" text="Employee Department" /></td>
				<td><form:input path="dept" /></td>
			</tr>
			<tr>
				<td><spring:message code="lbl.email" text="Employee Address" /></td>
				<td><form:input path="Address" /></td>
			</tr>
			<tr>
				<td><spring:message code="lbl.email" text="Employee Designation" /></td>
				<td><form:input path="desig" /></td>
			</tr>
			<tr>
				<td><spring:message code="lbl.email" text="Employee Salary" /></td>
				<td><form:input path="salary" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Add Employee" /></td>
			</tr>
		</table>
	</form:form>

</body>
</html>