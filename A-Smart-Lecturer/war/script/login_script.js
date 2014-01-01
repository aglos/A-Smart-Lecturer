$(document).ready(function() {
	$('#loginMsg').html("");
	$('#loginForm').hide();
	$('#loginForm').fadeIn('slow');
	$('#user_id_as_string').focus(); //set focus on user_name

	$('#loginForm').submit(function() {
		var $user_name = $.trim($('#user_id_as_string').val());
		var $password = $.trim($('#pass').val());
        var $msg = $("#loginMsg");
        
		if($user_name === '' && $password ==='')
			{
				$msg.html("שדות תעודת זהות וסיסמה ריקים");
				return false;
			}
		else if($user_name === '')
			{
				$msg.html("שדה תעודת זהות ריק");
				return false;
			}
		else if($password === '')
			{
				$msg.html("שדה סיסמה ריק");
				return false;
			}
		else if(isNaN($user_name))
			{
				$msg.html("על תעודת הזהות להכיל מספרים בלבד");
				return false;
			}
		else if($password.length < 6)
			{
				$msg.html("אורך הסיסמה צריך להיות לפחות 6 תווים");
				return false;
			}
		
		
		return true;
	});
});