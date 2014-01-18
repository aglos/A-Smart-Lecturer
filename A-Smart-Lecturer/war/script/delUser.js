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
	  				var checkerId =  $("#checkers").val();
	  			
		  			$("#UserId").val(checkerId);
	  		});
  			$( "#students" ).change(function() {
	  				$('.delUser').show();
	  			
	  		});
  			$( "#lecturers" ).change(function() {
	  				$('.delUser').show();
	  			
	  		});
  		
  			
  		});
});