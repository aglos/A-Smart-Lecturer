$(document).ready(function() {

		$(".pageDesc").html("בחר שנה");
		$(".pageDesc").css({"color": "#ff0000"});
		 
  		$( "#year" ).change(function() {
  			
  			$(".pageDesc").html("בחר חוג");
  			$("#gradeContent").html('');
  			var dataString = 'year='+ this.value;

  			if (this.value=='n') {

  				$(".pageDesc").html("בחר שנה");
  				
  				$("#circle").html('<option value="0" style="background-color: #CCCfff">בחר חוג</option>');
  				$("#course").html('<option value="0" style="background-color: #CCCfff">בחר קורס</option>');
  				$("#course").attr("disabled", "disabled");
  				$("#circle").attr("disabled", "disabled");
	  			return false;
  			}
  			
  			$.ajax({
  				async: false,
  				type: "POST",
  				url: "/getCircle",
  				data: dataString,
  				success: function(ret){
  					// success
  					
  					var res = ret.split(","); //res[i]=name, res[i+1]=id

  					var options = '<option value="n">בחר חוג</option>';
  					
  					//disable courses options
  					$("#course").html('<option value="0" style="background-color: #CCCfff">בחר קורס</option>');
  					$("#course").attr("disabled", "disabled");

  					
  					for (var i = 0; i < res.length; i+=2) {
				  		// success
						options += '<option value="' + res[i+1] + '">' + res[i] + '</option>';
						}
						$("#circle").html(options);
						$("#circle").removeAttr("disabled");
  				}
  			});
  	});
  	  	
	  	$( "#circle" ).change(function() {

	  			$(".pageDesc").html("בחר קורס");
	  			$("#gradeContent").html('');
	  			var circleId =  $("#circle").val();
	  			var year= $("#year").val();
	  			var dataString = 'circleId='+ this.value;
	  			
	  			if (this.value=='n') {

	  				$(".pageDesc").html("בחר חוג");
	  				$("#course").html('<option value="0" style="background-color: #CCCfff">בחר קורס</option>');
	  				$("#course").attr("disabled", "disabled");
		  			return false;
	  			}
	  			
	  			$.ajax({
	  				async: false,
	  				type: "POST",
	  				url: "/getCourse",
	  				data: dataString,
	  				success: function(ret){
	  					// success
	  					var res = ret.split(",");
	  					
	  					if(res.length === 1) //if no courses in circle
	  						{
	  						$("#course").html('<option value="0" style="background-color: #CCCfff">אין קורסים בחוג</option>');
	  							$("#course").attr("disabled", "disabled");
	  							return false;
	  						}
	  					
	  					var options = '<option value="n">בחר קורס</option>';
	  					for (var i = 0; i < res.length; i+=2) {
				  					// success
									options += '<option value="' + res[i+1] + '">' + res[i] + '</option>';
				  				}
	  						$("#course").html(options);
  							$("#course").removeAttr("disabled");
	  				}
	  			});
	  	});
		$( "#course" ).change(function() {
			//<% if (isView==false) { %>

				$("#gradeContent").html('');
				var circleId =  $("#circle").val();
				var courseId =  $("#course").val();
				var year = $("#year").val();
				var dataString = 'circleId='+ circleId + '&courseId='+ courseId;

				if (courseId=='n') {
					$(".pageDesc").html("בחר קורס");
					$(".gradeContent").html("");
		  			return false;
	  			}
				
				$.ajax({
	  				async: false,
	  				type: "POST",
	  				url: "/getStudentsInCourse",
	  				data: dataString,
	  				success: function(ret){
	  					// success

  						$(".gradeContent").html(ret);	
  						$(".pageDesc").html("שנה: " + year + " | " +  "חוג: "+circleId + " | " +  "קורס: " + courseId);
  						initSliders();  					
	  				}
	  			});
			//<% } %>
		});
  	});
