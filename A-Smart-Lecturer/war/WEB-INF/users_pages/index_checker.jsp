<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he" dir="rtl">
<head>   
	<link href="../style/main.css" rel="stylesheet" type="text/css" media="screen" />
   	<link href="../style/index.css" rel="stylesheet" type="text/css" media="screen" />
    
    <meta name="viewport" content="width=1031, maximum-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Content-Language" content="he" />
    
	<title>A Smart Lecturer</title>

	 <script type='text/javascript' src='https://www.google.com/jsapi'></script>
    <script type='text/javascript'>
      google.load('visualization', '1', {packages:['table']});
      google.setOnLoadCallback(drawTable);
      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'שם קורס');
        data.addColumn('string', 'שם חוג');
        data.addColumn('number', 'מספר תרגיל');
        data.addColumn('boolean', 'הוזנו ציונים');
        data.addColumn('string', 'ניהול');
        data.addRows([
                      <% for (int i=0;i<10;i++) { %>
         			  ['תקשורת מחשבים', 'הנדסת תוכנה',  {v: 1, f: '1'}, true,
         			   '<a href="Edit/<%=i%>">ערוך</a>&nbsp;<a href="Delete/<%=i%>">מחק</a>'],
        	     	  <% } %>
        ]);

        var table = new google.visualization.Table(document.getElementById('table_div'));
        table.draw(data, {allowHtml: true});
      }
    </script>

</head>
<body>

	<div id="main_site_div">

           <%@ include file="../header.jsp" %>
        	
            
            <!-- START SITE MAIN -->   
            <div id="warp">	
                
                        <div class="menuDiv">
                            <div class="menuTitle">מדדי ציונים</div>
                            <a href="/Checker/Add"><div class="menuItem">הוספת מדדים לתרגיל חדש</div></a>                          
                        </div>
                        
                        <div class="mainContent">
                            <div id='table_div'></div>
                        </div>
                        
                        <div style="clear:both"></div>
			
                
            </div>
            <!-- END SITE MAIN -->   
       
            <%@ include file="../footer.jsp" %>
    
    
	</div>
    </div>
    
    <script type="text/javascript" src="script/jquery.easing.1.3.js.js"></script>
  	<script type="text/javascript" src="script/jquery-ui.js"></script>
</body>
</html>
