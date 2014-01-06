$(document).ready(function() {
		$("#addCourseForm").hide();
		$(".pageDesc").html("בחר שנה");
		$(".pageDesc").css({"color": "#ff0000"});
		 
  		$( "#year" ).change(function() {
  			
  			$(".pageDesc").html("בחר חוג");
  			$(".pageDesc").css({"color": "#ff0000"});
  			$("#gradeContent").html('');

  			if (this.value==='n') {

  				$(".pageDesc").html("בחר שנה");
  				
  				$("#circle").html('<option value="0" style="background-color: #CCCfff">בחר חוג</option>');
  				$("#course").html('<option value="0" style="background-color: #CCCfff">בחר קורס</option>');
  				$("#course").attr("disabled", "disabled");
  				$("#circle").attr("disabled", "disabled");
	  			return false;
  			}
  			
  			//ajax
  			var dataString = 'year='+ this.value;
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
	  			
	  			$(".pageDesc").css({"color": "#ff0000"});

	  			$(".pageDesc").html("בחר קורס");
	  			$("#gradeContent").html('');
	  			var circleId =  $("#circle").val();
	  			var year= $("#year").val();
	  			var Name= $("#circle option:selected").text();
	  			if (this.value=='n') {

	  				$(".pageDesc").html("בחר חוג");
	  				$("#course").html('<option value="0" style="background-color: #CCCfff">בחר קורס</option>');
	  				$("#course").attr("disabled", "disabled");
		  			return false;
	  			}
	  			$("#addCourseForm").show();
	  			$("#EditCircleId").val(circleId);
	  			$("#EditCircleYear").val(year);
	  			$("#EditCircleName").val(Name.trim());
	  			
	  	});
	  	
		/*$( "#course" ).change(function() {
			//<% if (isView==false) { %>

				$("#gradeContent").html('');
				var circleId =  $("#circle").val();
				var courseId =  $("#course").val();
				var year = $("#year").val();

				if (courseId=='n') {
					$(".pageDesc").html("בחר קורס");
					$(".gradeContent").html("");
		  			return false;
	  			}
				
				var dataString = 'circleId='+ circleId + '&courseId='+ courseId;
				$.ajax({
	  				async: false,
	  				type: "POST",
	  				url: "/getStudentsInCourse",
	  				data: dataString,
	  				success: function(ret){
	  					// success

  						$(".gradeContent").html(ret);
  						$(".pageDesc").css({"color":"green"});
  						$(".pageDesc").html("שנה: " + year + " | " +  "חוג: "+circleId + " | " +  "קורס: " + courseId);
  						
  				
  						initSliders();

	  				}
	  			});
			//<% } %>
		});*/
  	});
