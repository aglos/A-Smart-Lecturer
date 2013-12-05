<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he"
	dir="rtl">
<head>

<meta name="viewport" content="width=1031, maximum-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="he" />

<title>A Smart Lecturer</title>

<link href="../../style/main.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../../style/index.css" rel="stylesheet" type="text/css"
	media="screen" />



<link rel="stylesheet" type="text/css"
	href="../../style/jquery-ui-slider-pips.css">
<link rel="stylesheet" type="text/css"
	href="../../style/jquery-ui-1.10.1.custom.css">

</head>
<body>

	<div id="main_site_div">

		<%@ include file="../../inc/header.jsp"%>


		<!-- START SITE MAIN -->
		<div id="warp">


			<div class="mainContent"
				style="width: 971px; float: right; padding: 0 10px 10px 10px;">
				<h2>הזנת ציונים</h2>

				<%@ include file="../../inc/ExecriseFilter.jsp"%>

				<form id="formcontact" method="post">

					<table border="0" cellpadding="0" cellspacing="0" width="100%"
						style="border-bottom: 1px dotted #999">
						<% for (int i=0;i<10;i++) {%>
						<tr>
							<td align="center" width="15%"
								style="padding:10px;border-right:1px dotted #999;border-top:1px dotted #999<%
                                        
                                        if (i==0) { %>;border-top-right-radius: 25px 25px;<%}
                                        %>">000000000</td>
							<td width="77%"
								style="padding: 20px; border-top: 1px dotted #999"">
								<div class="slider" id="s<%=i%>"></div>
							</td>
							<td width="8%" align="center"
								style="border-left:1px dotted #999;border-top:1px dotted #999<%
                                        
                                        if (i==0) { %>;border-top-left-radius: 25px 25px;<%}
                                        %>">
								<input class="textVal" maxlength="3" value="0" type="text"
								align="center" id="val<%=i%>"
								style="width: 30px; text-align: center;" />
							</td>
						</tr>
						<% } %>
					</table>
					<br />
					<br /> הערות למתרגל:<br />
					<textarea id="context" name="context" dir="rtl"></textarea>
					<br />
					<br /> <input type="submit" id="cmdsend" name="cmdsend"
						value="שלח" class="form_button"
						onClick="javascript:alert('אישור הפרטים');" /> <input
						type="reset" id="cmdreset" name="reset" value="נקה"
						class="form_button" />
				</form>
			</div>

			<div style="clear: both"></div>


		</div>
		<!-- END SITE MAIN -->

		<%@ include file="../../inc/footer.jsp"%>


	</div>
	</div>


	<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>

	<script src="../../script/jquery-ui-slider-pips.js"></script>


	<script>
	$(document).ready( function() {

		$.extend( $.ui.slider.prototype.options, { animate: true });
		$('.slider').slider({ 
			max: 100, 
			min: 0, 
			value: 0,
			range: "min",
			slide: function( event, ui ) {

					var id = $(this).attr("id");
					id = id.substring(1,id.length);
				    $("#val"+id).val(ui.value);
		    }	
		}).slider('pips');

		$('.textVal').change(function () {
			var obj = this.id;
			var id = obj.substring(3,obj.length);
		    var value = this.value;
		    selector = $("#s"+id);
		    selector.slider("value", value);
		})

	});

	

  	$(document).ready(function() {
	  	$( "#circle" ).change(function() {
	  	  
				//////////////////////////////////////////////////
	  			//var _ret;
	  			var dataString = 'circleId='+ this.value;

	  			if (this.value=='n') {

	  				$("#course").html('<option value="0" style="background-color: #CCCfff">בחר קורס</option>');
		  			return false;
	  			}
	  			
	  			$.ajax({
	  				async: false,
	  				type: "POST",
	  				url: "/getCourse",
	  				data: dataString,
	  				success: function(ret){
	  					// success
	  					
	  					//_ret=ret;
	  					//
	  					var res = ret.split(",");
	  					var options = '';
	  					for (var i = 0; i < res.length; i++) {
  							options += '<option value="' + i + '">' + res[i] + '</option>';
  							
  						}
  						$("#course").html(options);
  						//$('#ctlPerson option:first').attr('selected', 'selected');
	  					
	  				}
	  			});
	  		
				//////////////////////////////////////////////////

	  		
	  	});
  	});
  	

  	</script>

</body>
</html>
