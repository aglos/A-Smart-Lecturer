$(document).ready(function() {
	var d = new Date();
	var months = ["ינואר", "פברואר", "מרץ", "אפריל", "מאי", "יולי", "יוני", "אוגוסט", "ספטמבר", "אוקטובר", "נובמבר", "דצמבר"];
	var days = ["ראשון", "שני", "שלישי", "רביעי", "חמישי", "שישי", "שבת"];
	var newDate = "יום ";
	newDate+=days[d.getDay()] + ", ";
	newDate+=d.getDate() + " ";
	newDate+="ב" + months[d.getMonth()] + " ";
	newDate+=d.getFullYear() + ", ";
	newDate+=d.getHours() + ":";
	
	if(d.getMinutes()<10)
		newDate+="0";
	
	newDate+=d.getMinutes();
	
	$('#displayDate').html(newDate);
});