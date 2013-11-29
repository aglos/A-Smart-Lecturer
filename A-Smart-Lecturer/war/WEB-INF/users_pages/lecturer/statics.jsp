<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he" dir="rtl">
<head>   
	<link href="../../style/main.css" rel="stylesheet" type="text/css" media="screen" />
   	<link href="../../style/index.css" rel="stylesheet" type="text/css" media="screen" />
    
    <meta name="viewport" content="width=1031, maximum-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Content-Language" content="he" />
    
	<title>A Smart Lecturer</title>
    
    <link rel="shortcut icon" href="../images/unlock-it.ico" type="image/x-icon" />
    <link rel="image_src" href="../images/share.png" />

	 <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['××× ××××', 3],
          ['×××', 1],
          ['×××¢× ×××', 1],
          ['××¡×¤××§', 1],
          ['×× ××¡×¤××§', 2]
        ]);

        // Set chart options
        var options = {'title':'',
                       'width':700,
					   'is3D':true,
                       'height':600};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

</head>
<body>

	<div id="main_site_div">

            <!-- START HEADER -->
        	<div id="header">
            	<div class="headerTitle">
                    <h3>×©××× ××××××,</h3>
                    ××× ×¨××©××, 22 ×× ×××××¨ 2013, 22:00
                </div>
                
               <a href="../../login.html" class="logout">××¦×××</a>
            </div>
            <!-- END HEADER -->

            <!-- START TOP BAR -->
            <div class="imei_box_cell">
                
                
                <!-- START IMEI TEXT BOX -->
                <div id="top_bar"> 
  					<div class="logo"></div>
                </div>
                <!-- END IMEI TEXT BOX  -->
            </div>
            
 			<div class="header_fade">
            	<a href="../index_lecturer.html">×¢××× ×¨××©×</a> -
                ×¦×¤××× ××¡××××¡×××§××ª
            </div>
            <!-- END TOP BAR -->
        	
            
            <!-- START SITE MAIN -->   
            <div id="warp">	
                
                        <div class="menuDiv">
                            <div class="menuTitle">× ×××× ××××¨ ×©××××ª</div>
                            <a href="add_question.html"><div class="menuItem">×××¡×¤×ª ×©×××</div></a>
                            <a href="edit_question.html"><div class="menuItem">×¢×¨×××ª ×©×××</div></a>
                            <a href="del_question.html"><div class="menuItem">××××§×ª ×©×××</div></a>
                            <div class="menuTitle">× ×××× ××××¨ ×ª×¨×××××</div>
                            <a href="add_exericse.html"><div class="menuItem">×××¡×¤×ª ×ª×¨×××</div></a>
                            <a href="edit_exericse.html"><div class="menuItem">×¢×¨×××ª ×ª×¨×××</div></a>
                            <a href="del_exericse.html"><div class="menuItem">××××§×ª ×ª×¨×××</div></a>
                            <div class="menuTitle">×¡××××¡×××§××ª ××¦××× ××</div>
                            <div class="SelectedmenuItem">×¦×¤××× ××¡××××¡×××§××ª</div>                 
                        </div>
                        
                        <div class="mainContent">
                        	<h2>×¦×¤××× ××¡××××¡×××§××ª</h2>
                            <div class="exericse_filterDiv">
                                <h3>×××: &nbsp;&nbsp;&nbsp;
                                
                                <select name="subject" id="subject" class="formField">
                                    <option value="0" style="background-color:#CCCfff">×××¨ ×××</option>
                                    <option id="1" value="">×× ××¡×ª ×ª×¢×©××× ×× ××××</option>
                                    <option id="2" value="">×× ××¡×ª ×ª××× ×</option>
                                </select>
                                
                                &nbsp;&nbsp;&nbsp;×§××¨×¡: &nbsp;&nbsp;&nbsp;
                                <select name="subject" id="subject" class="formField">
                                    <option value="0" style="background-color:#CCCfff">×××¨ ×××</option>
                                    <option id="1" value="">×× ××¡×ª ×ª××× ×</option>
                                    <option id="2" value="">××¢×¨×××ª ××¤×¢××</option>
                                </select>
                                
                               &nbsp;&nbsp;&nbsp; ×ª×¨××× ××¡×¤×¨: &nbsp;&nbsp;&nbsp;
                                
                                <select name="subject" id="subject" class="formField" style="width:100px">
                                    <option value="0" style="background-color:#CCCfff">×××¨ ×ª×¨×××</option>
                                    <option id="1" value="">1</option>
                                    <option id="2" value="">2</option>
                                </select>
                                </h3>
                            </div>
                            
                             <!--Div that will hold the pie chart-->
                            <div id="chart_div" align="center"></div>
                            
                        </div>
                        
                        <div style="clear:both"></div>
			
                
            </div>
            <!-- END SITE MAIN -->   
       
            <!-- START FOOTER -->
            <div id="footer">
                
                <a href="http://www.unlock-it.co.il/tutorial/iphone_unlock.php" title="×××¨××××">×¤×ª×¨×× ×ª×§×××ª</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="http://www.unlock-it.co.il/contact/contact.php" title="×¦××¨ ×§×©×¨">×¦××¨ ×§×©×¨ ×¢× ×× ××</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#" title="××£ ××××ª">×©××××ª ××ª×©××××ª</a>    
            </div>
            <!-- END FOOTER -->
    
    
	</div>
    </div>
    
    <script type="text/javascript" src="../script/jquery.easing.1.3.js.js"></script>
  	<script type="text/javascript" src="../script/jquery-ui.js"></script>
</body>
</html>
