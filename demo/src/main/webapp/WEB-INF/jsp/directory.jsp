<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
table, td, th{
	border: 1px grey solid;
}

.inputSubmitIndex {
	display: none;
}

label {
	border: 1px solid;
	background-color: #dad4d4
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="ISO-8859-1">
<title>Employee Directory</title>
</head>
<body>
	<h1 style="text-align: center">WELCOME</h1>
	<p>-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
	
	<h2>Add Employee</h2>
	<form id ="addEmpForm">
	<table>
	<tr>
	<th>Employee Name</th>
	<td><input type="text" name="empName" id="empInput"/></td>
	</tr>
	<tr>
	<th>Employee Department</th>
	<td><input type="text" name="dept"/></td>
	</tr>
	<tr>
	<th>Employee Salary</th>
	<td><input type="text" name="salary" /></td>
	</tr>
	<tr>
	<th>Employee Designation</th>
	<td>	<input type="text" name="desig" /><//td>
	</tr>
	<tr>
	<th>Employee Address</th>
	<td><input type="text" name="address"/></td>
	</tr>
	<tr>
	<tr></tr>
	<tr></tr>
	<td></td>
	<td><input type="button" id="addEmpBtn" value="ADD EMP"/>
	<input type="button" id="addEmpCancel" value="CANCEL"  onClick="addEmployeeCancel()"/></td>
	</tr>
	</table>
	</form>
	
	<h2>Employee Directory</h2>
	<label for="empCode">Please Enter Employee ID</label>
	<input type="text" name="empCode" id="empCode" class="inputText" />
	<input type="button" id="searchBtn" value="SEARCH"/>
	<br>

	<div id="searchResult" style="display: none">
		<p>
			_________________________________________________________________________________________________________________________________________________
			<br>_________________________________________________________________________________________________________________________________________________
		</p>
		<h2>Employee Search Result</h2>
		<h3>
			<input type="button" id="employeeList" value="EMPLOYEE LIST"
				style="display: none" />
		</h3>
		<form>
			<div id="head">
			<label><strong># &nbsp&nbsp&nbsp&nbsp</strong></label>
			<label><strong>EMPLOYEE NAME</strong></label>
			 <label><strong>EMPLOYEE ID</strong></label> 
			<label><strong>DEPARTMENT</strong></label>
			 <label><strong>SALARY</strong></label>
			<label><strong>DESIGNATION&nbsp</strong></label>
			 <label><strong>ADDRESS&nbsp</strong></label>
			<label><strong>ACTION&nbsp</strong></label>
			</div>
		</form>
	</div>
	<div id="footer">
		<p>
			_________________________________________________________________________________________________________________________________________________
			<br>_________________________________________________________________________________________________________________________________________________
		</p>
		<p>Footer</p>
		<p>
			_________________________________________________________________________________________________________________________________________________
			<br>_________________________________________________________________________________________________________________________________________________
		</p>
	</div>
</body>
<script type="text/javascript">


$("document").ready(
		function() {
			$("#addEmpBtn").on("click",
					function(evt) {
						addEmployee();
					});

		});
		
function addEmployee(){
	 var jsonData = {};

  	 var formData = $("#addEmpForm").serializeArray();
 	  console.log(formData);

  	 $.each(formData, function() {
        if (jsonData[this.name]) {
           if (!jsonData[this.name].push) {
               jsonData[this.name] = [jsonData[this.name]];
           }
           jsonData[this.name].push(this.value || '');
       } else {
           jsonData[this.name] = this.value || '';
       }


   });
	//sending data to server 		
	$.ajax({
		url:"http://localhost:8080/api/employees",
		type:"POST",
		dataType:"json",
		data: jsonData,
		success:addEmployeeSuccess
	});
	
}
function addEmployeeSuccess(){
	$("#addEmpForm").trigger("reset");
	window.alert('added');
}
function addEmployeeCancel(){
	$("#addEmpForm").trigger("reset");
}

	$("document").ready(
			function() {
				$("#searchBtn").on("click",
						function(evt) {
							fetchEmployee();
						});

			});
	$("document").ready(
			function() {
				$(".inputText").on("change",
						function(evt) {
							$("#searchBtn").prop("value","SEARCH BY ID");
						});

			});

	function fetchEmployee() {
		//use remove for removing not empty it will give mapping error
		$(".searchResultForm").remove();
		var empID = document.getElementById("empCode").value;
		console.log(empID);
		$.ajax({
			url : "http://localhost:8080/api/employees/" + empID,
			type : "GET",
			error: function(jqXHR, textStatus, errorthrown){
				if (jqXHR.readyState == 0) {
					window.alert('Network Issue');
				       //Network error, i.e.  server stopped, timeout, connection refused, CORS, etc.
				    }
				    else if (jqXHR.readyState == 4) {
				       //HTTP error, i.e. 404 Not found, Internal Server 500, etc.
				       window.alert('Employee Not Found');
				    }
			},
			success : function(result) {
				console.log(result);
				if (result.length == 0) {
					alert("NO EMPLOYEE FOUND");
					return;
				}
				if (result.length > 1) {
					displayEmployees(result);
					return;
				} else {
					if(Array.isArray(result))
						 result = result[0];
					console.log(result);
					$("#employeeList").show();
					var index =0;
					$("#searchResult").show();
					var form = $("<form/>", 
			                 { action:'/action/'+result.empCode ,
								id:'searchForm0',
								class:'searchResultForm'
			                 }
			            );
					form.append( 
							$("<input>", 
							    { type:'text',
								  readonly:'true',
								 	class:'inputIndex'+index,
							      style:'width:2%',
							      value:''+index+1}
							)
							);
					form.append( 
							$("<input>", 
							    { type:'text',
								  readonly:'true',
								 	class:'inputIndex'+index,
							      name:'empName', 
							      style:'width:11%',
							      value:''+result.empName}
							)
							);
					form.append( 
							$("<input>", 
							    { type:'text',
								readonly:'true',
							      name:'empCode', 
							      style:'width:9%',
							      value:''+result.empCode}
							)
							);
					form.append( 
							$("<input>", 
							    { type:'text',
								readonly:'true', 
								class:'inputIndex'+index,
							      name:'dept', 
							      style:'width:8%',
							      value:''+result.dept}
							)
							);
					form.append( 
							$("<input>", 
							    { type:'text', 
								class:'inputIndex'+index,
								readonly:'true',
								name:'salary',
							      style:'width:5.5%',
							      value:''+result.salary}
							)
							);
					form.append( 
							$("<input>", 
							    { type:'text', 
								readonly:'true',
								class:'inputIndex'+index,
								name:'desig',
							      style:'width:9%',
							      value:''+result.desig}
							)
							);
							form.append( 
									$("<input>", 
									     { type:'text',
										class:'inputIndex'+index,
										       name:'address', 
									       style:'width:5.5%',
									       readonly:'true',
									       value:''+result.address}
									  )
									);


							form.append( 
							$("<input>", 
							     { type:'button', 
							       value:'EDIT', 
							       id:'edit'+index,
							       style:'width:5%',
							       class:'editBtn',
							       onClick:'editInput('+index+')',
							       }
							  )
							);
							var empId = result.empCode;
							form.append( 
							$("<input>", 
								     { type:'button', 
								       value:'SUBMIT', 
								       class:'inputSubmitIndex',
								       id:'submit'+index,
								       onClick:'submitModifiedInput('+index+')'
								        }
								  )
								);
							form.append( 
							$("<input>", 
								     { type:'button', 
								       value:'CANCEL', 
								       class:'inputSubmitIndex',
								       id:'cancel'+index,
								   //    type: 'hidden',
								       onClick:'cancelInputE()'
								        }
								  )
								);

							$("#searchResult").append(form);

				}
			}

		});
	}
	
	$("document").ready(function(){
		document.getElementById("employeeList").addEventListener("click", function(evt){
			fetchEmployeeList();
			
		});
	});
	
	function fetchEmployeeList(){
		$(".searchResultForm").remove();
		$.ajax({
			url:"http://localhost:8080/api/employees",
			type:"GET",
			dataType:"json",
			success:displayEmployees,
			//error: errorFn
		});
		
	}
	
	function displayEmployees(employees){
		$("#searchResult").show();
		$.each(employees, function(index, result){
			/* $("#editbtn").append('<tr>'+'<td>'+'<input type= "button" value="EDIT" id="edit"/>'+'</td>'+'</tr>');
			$("#editbtn").append('<tr>'+'<td>'+'<input type= "button" value="SUBMIT" id="submitEdit"/>'+'</td>'+'</tr>');
			$("#empname").append('<tr>'+'<td>'+result.empName+'</td>'+'</tr>');
			$("#empcode").append('<tr>'+'<td>'+result.empCode+'</td>'+'</tr>');
			$("#dept").append('<tr>'+'<td>'+result.dept+'</td>'+'</tr>');
			$("#salary").append('<tr>'+'<td>'+result.salary+'</td>'+'</tr>');
			$("#desig").append('<tr>'+'<td>'+result.desig+'</td>'+'</tr>');
			$("#address").append('<tr>'+'<td>'+result.address+'</td>'+'</tr>'); */
			var serialnum = (+index)+1;
			$("#employeeList").hide();
			var form = $("<form/>", 
	                 { action:'/action/'+result.empCode ,
						id:'searchForm'+index,
						class:'searchResultForm',
	                 }
	            );
			form.append( 
					$("<input>", 
					    { type:'text',
						  readonly:'true',
						 	class:'inputIndex'+index,
					      style:'width:2%',
					      value:''+serialnum}
					)
					);
			form.append( 
					$("<input>", 
					    { type:'text',
						  readonly:'true',
						 	class:'inputIndex'+index,
					      name:'empName', 
					      style:'width:11%',
					      value:''+result.empName}
					)
					);
			form.append( 
					$("<input>", 
					    { type:'text',
						readonly:'true',
					      name:'empCode', 
					      id:'empidindex'+index,
					      style:'width:9%',
					      value:''+result.empCode}
					)
					);
			form.append( 
					$("<input>", 
					    { type:'text',
						readonly:'true', 
						class:'inputIndex'+index,
					      name:'dept', 
					      style:'width:8%',
					      value:''+result.dept}
					)
					);
			form.append( 
					$("<input>", 
					    { type:'text', 
						class:'inputIndex'+index,
						readonly:'true',
						name:'salary',
					      style:'width:5.5%',
					      value:''+result.salary}
					)
					);
			form.append( 
					$("<input>", 
					    { type:'text', 
						readonly:'true',
						class:'inputIndex'+index,
						name:'desig',
					      style:'width:9%',
					      value:''+result.desig}
					)
					);
					form.append( 
							$("<input>", 
							     { type:'text',
								class:'inputIndex'+index,
								       name:'address', 
							       style:'width:5.5%',
							       readonly:'true',
							       value:''+result.address}
							  )
							);


					form.append( 
					$("<input>", 
					     { type:'button', 
					       value:'EDIT', 
					       id:'edit'+index,
					       style:'width:5%',
					       class:'editBtn',
					       onClick:'editInput('+index+')',
					       }
					  )
					);
					form.append( 
					$("<input>", 
					     { type:'button', 
					       value:'DELETE', 
					       id:'delete'+index,
					       style:'width:5%',
					       class:'deleteBtn',
					       onClick:'deleteInput('+index+')',
					       }
					  )
					);
					var empId = result.empCode;
					form.append( 
					$("<input>", 
						     { type:'button', 
						       value:'SUBMIT', 
						       class:'inputSubmitIndex',
						       id:'submit'+index,
						       onClick:'submitModifiedInput('+index+')'
						        }
						  )
						);
					form.append( 
					$("<input>", 
						     { type:'button', 
						       value:'CANCEL', 
						       class:'inputSubmitIndex',
						       id:'cancel'+index,
						   //    type: 'hidden',
						       onClick:'cancelInput()'
						        }
						  )
						);

					$("#searchResult").append(form);
		})
		}
	
	function submitModifiedInput(index){
		console.log('submitted Index: '+index);
		//get and convert data of the particular index form
		 var jsonData = {};

	  	 var formData = $("#searchForm"+index).serializeArray();
	 	  console.log(formData);

	  	 $.each(formData, function() {
	        if (jsonData[this.name]) {
	           if (!jsonData[this.name].push) {
	               jsonData[this.name] = [jsonData[this.name]];
	           }
	           jsonData[this.name].push(this.value || '');
	       } else {
	           jsonData[this.name] = this.value || '';
	       }


	   });
	  	 //fetching the employee id from json data
	  	 var empId="";
	  	$.each(jsonData, function(k, v) {
	  		if(k=='empCode'){
	  			empId = v;
	  			return;
	  		}
       });
	  	
	  	console.log('index'+index);
	  	console.log('empID'+empId);
		//sending modify data to server 		
		$.ajax({
			url:"http://localhost:8080/api/employees/"+empId,
			type:"PUT",
			dataType:"json",
			data: jsonData,
			success:modifySearchResult(index)
				
		});
	}
	function modifySearchResult(index){
		$('#submit'+index).hide();
		$('#cancel'+index).hide();
		$('#edit'+index).show();
		$('.inputIndex'+index).prop('readonly', true);
		$('.editBtn').prop('disabled', false);
		
	}
	function cancelInput(){
		fetchEmployeeList();
	}
	function cancelInputE(){
		fetchEmployee();
	}
	function editInput(index){
		$('#submit'+index).show();
		$('#cancel'+index).show();
		console.log("testing edit button"+index);
		$('.inputIndex'+index).prop('readonly', false);
		$('.editBtn').prop('disabled', true);
		
		$('#edit'+index).hide();
	}
	function deleteInput(index){
		var empid = document.getElementById("empidindex"+index).value;
		$.ajax({
			url:"http://localhost:8080/api/employees/"+empid,
			type:"DELETE",
			success:deleteSuccess
			});
	}
	function deleteSuccess(){
		//add bootstrap
		fetchEmployeeList();
	}

</script>
</html>