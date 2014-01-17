$(document).ready(function() {
		$(".delUser").hide();
  		$( "#type" ).change(function() {
  			
  			$("#gradeContent").html('');
  			$("#name").removeAttr("disabled");
  			
  			
  		
  			$( "#name" ).change(function() {
  				
  			
				$('.delUser').show();
	  		
	  		
	  		
	  			
  			});
  			
  		});
});