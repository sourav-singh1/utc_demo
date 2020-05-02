/**
 * 
*/
function openForm() {
			document.getElementById("myForm").style.display = "block";
			document.getElementById("loginBtn").style.display = "none";
		}

		function regForm() {
			//document.getElementById("regForm").style.display = "block";
			$("#regForm").show(1000, "linear");
			document.getElementById("regForm").reset();
			document.getElementById("myForm").style.display = "none";
			document.getElementById("loginBtn").style.display = "none";
		}
		function closeForm() {
			//document.getElementById("regForm").style.display = "none";
			//using jquery inbuilt show fadei  and out function to hide and sipaly the div
			$("#myForm").fadeTo(1000, .6);
			$("#regForm").fadeOut(200);
			//document.getElementById("myForm").style.display = "block";
		}
		
		

		function closePreview() {
			location.reload(true);
		}
		function editPreview() {
			$('input').prop('readonly', false);
			$('#datasubmitted').addClass('hidden')
			$('#modifydata').removeClass('hidden')
		}
	
		$("document").ready(
				function() {
					document.getElementById("previewData").addEventListener(
							"click", function(evt) {
								preview();
							});
					
				});
		
		function preview() {
			//making data submitted unhiden
			$('#datasubmitted').removeClass('hidden')
			//making all input fields mandatory here
			
			//making hideen span display style
			if (document.getElementById('empname').value == '') {
				$('#hmsg').removeClass('hidden');
				return
			}
			
			//alerting style
			if (document.getElementById('empcode').value == '') {
				alert('missing employee code');
				return
			}
			if (document.getElementById('dept').value == '') {
				alert('missing employee department');
				return
			}
			if (document.getElementById('address').value == '') {
				alert('missing address');
				return
			}
			if (document.getElementById('desig').value == '') {
				alert('missing designation');
				return
			}
			//using regular expression for checking salary 
			 var $regexname=/^([0-9]{3,16})$/;
			 if (!$(document.getElementById('salary')).val().match($regexname)) {
			                 alert('salary shoud be minimum 3 digits number');
			            	  return;
			             }

			var close = $('<button type="button" class="btn cancel" onclick="closePreview()">CLOSE</button>');
			var edit = $('<button type="button" class="btn" onclick="editPreview()">EDIT</button>');
			var submit = $('<button type="submit" class="btn">SUBMIT</button>');

			document.getElementById("preview").style.display = "block";
			document.getElementById("regForm").style.display = "none";

			$("#previewForm").append("<b>Employee Name </b>").append(
					$("#empname"));
			$("#previewForm").append("<b>Employee Code </b>").append(
					$("#empcode"));
			$("#previewForm").append("<b>Employee Department </b>").append(
					$("#dept"));
			$("#previewForm").append("<b>Employee Address </b>").append(
					$("#address"));
			$("#previewForm").append("<b>Employee Designation </b>").append(
					$("#desig"));
			$("#previewForm").append("<b>Employee Salary </b>").append(
					$("#salary"));
			$("#previewForm").append(submit);
			$("#previewForm").append(edit);
			$("#previewForm").append(close);
			$('input').prop('readonly', true);
		}
		
		
		//using ajax call to fill one of the input field
		function getData(){
			var f = "ajax.txt";
			$.get("http://localhost:8080/js/"+f, successFn);
		}
		//upon success ajax this function will get called
		function successFn(result){
			$("#dept").val(result);
		}
		
//		$("document").ready(function(){
//			$("#target").addEventListener("click", function(evt){
//				targetMethod();
//			});
//		});
		
		
