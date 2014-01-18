$(document).ready(function() {
		$(".delUser").hide();
		$("#checkers").hide();
		$("#lecturers").hide();
  		$( "#type" ).change(function() {
  			
  			$("#gradeContent").html('');
  		
			var type = $("#type option:selected").text();
  			$("#Type").val(type.trim());
  			if(type.trim()=="מרצה")
  			{
  				$("#lecturers").show();
  				$("#students").hide();
  				$("#checkers").hide();
  				$("#lecturers").removeAttr("disabled");
  			
  			}
  			else if(type.trim()=="בודק")
  			{
  				$("#checkers").show();
  				$("#students").hide();
  				$("#lecturers").hide();
  				$("#checkers").removeAttr("disabled");
  				
  			}
  			else if(type.trim()=="סטודנט")
  			{
  				$("#students").show();
  				$("#lecturers").hide();
  				$("#checkers").hide();
  				$("#students").removeAttr("disabled");
  				
  			}
  	
  			$( "#checkers" ).change(function() {
	  				$('.delUser').show();
	  				var Name= $("#checkers option:selected").text();
	  				var checkerId =  $("#checkers").val();
	  				$("#UserId").val(checkerId);
	  				$("#EditUserName").val(Name.trim());
	  		});
  			$( "#students" ).change(function() {
	  				$('.delUser').show();
	  				var Name= $("#students option:selected").text();
	  				var studentId =  $("#students").val();
	  				$("#UserId").val(studentId);
	  				$("#EditUserName").val(Name.trim());
	  		});
  			$( "#lecturers" ).change(function() {
	  				$('.delUser').show();
	  				var Name= $("#lecturers option:selected").text();
	  				var lecturerId =  $("#lecturers").val();
	  				$("#UserId").val(lecturerId);
	  				$("#EditUserName").val(Name.trim());
	  		});
  			
  			
  		});
});