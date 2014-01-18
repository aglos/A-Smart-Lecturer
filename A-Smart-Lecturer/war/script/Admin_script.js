

$(document).ready(function() {
	
	//ADDCircle validity
	$('#addCircleMsg').html("");

	$('#addCircleForm').hide();
	$('#addCircleForm').fadeIn('slow');
	
	$('#addCircleForm').submit(function() {
		var $Circle_name = $.trim($('#CircleName').val());
		var $CircleNum = $.trim($('#CircleNum').val());
		var $CircleYear= $.trim($('#CircleYear').val());
		var $msg = $("#addCircleMsg");
        
		if($Circle_name === '' || $CircleNum ===''||$CircleYear==='' )
		{
				$msg.html("אנא מלא את כל השדות");
				return false;
		}
		
		else if(isNaN($CircleNum))
		{
			$msg.html("מספר החוג יכול להכיל מספרים בלבד");
			return false;
		}
		else if(isNaN($CircleYear))
		{
			$msg.html("השנה יכולה להכיל מספרים בלבד");
			return false;
		}
		else if($CircleYear.length !== 4)
		{
			$msg.html("אורך השנה צריך להיות בדיוק  4 ספרות בלבד");
			return false;
		}
		
		
		return true;
	});
	

	
	
	
	//ADDCourse validity
	$('#addCourseMsg').html("");

	$('#addCourseForm').hide();
	$('#addCourseForm').fadeIn('slow');
	
	$('#addCourseForm').submit(function() {
		var $CourseName = $.trim($('#CourseName').val());
		var $CourseNum = $.trim($('#CourseNum').val());
		var $CheckerName= $.trim($('#checkerName').val());
		var $lecturerName= $.trim($('#lecturerName').val());
		var $msg = $("#addCourseMsg");
        
		if($CourseName === '' || $CourseNum ===''||$lecturerName===''||$CheckerName==='' )
		{		
				
				$msg.html("אנא מלא את כל השדות").css("font-size", "60 px");
				return false;
		}
		else if(isNaN($CourseNum))
		{
			$msg.html("מספר הקורס יכול להכיל מספרים בלבד");
			return false;
		}
		
		else if (isNaN($CheckerName)) {
			$msg.html("תעודת הזהות של הבודק אינה תקינה");
			return false;
		}
		else if (isNaN($lecturerName)) {
			$msg.html("תעודת הזהות של המרצה אינה תקינה");
			return false;
		}
		
			
		return true;
	});
	
	
	
	//ADDUser validity
	$('#addUserMsg').html("");

	$('#addUserForm').hide();
	$('#addUserForm').fadeIn('slow');
	
	$('#addUserForm').submit(function() {
   		

		var $UserName = $.trim($('#UserName').val());
		var $UserId = $.trim($('#UserId').val());
		var $UserType= $.trim($('#UserType').val());
		var $Userpass= $.trim($('#Userpass').val());
		var $msg = $("#addUserMsg");
        
		if($UserName === '' || $UserId ===''||$UserType===''||$Userpass==='' )
		{
				$msg.html("אנא מלא את כל השדות");
				return false;
		}
		else if(isNaN($UserId))
		{
			$msg.html("מספר תעודת זהות יכול להכיל מספרים בלבד");
			return false;
		}
		
		else if (!$UserName.match(/^[א-ת\s]*$/)) {
			$msg.html("שם חייב להיות מורכב מאותיות עבריות בלבד");
			return false;
		}
		else if ($UserType!=="מנהל"&&$UserType!=="בודק"&&$UserType!=="מרצה"&&$UserType!=="סטודנט") {
			$msg.html("סוג משתמש לא הוקלד בהתאם לאופציות");
			return false;
		}
		

	
			
		return true;
	});
	
	
	//delUser validity
	$('#delUserMsg').html("");

	$('#delUserForm').hide();
	$('#delUserForm').fadeIn('slow');
	
	$('#delUserForm').submit(function() {
		
		var $UserId = $.trim($('#UserId').val());
		
		var $msg = $("#delUserMsg");
        
		if($UserId === '')
		{
				$msg.html("תעודת זהות ריקה");
				return false;
		}
		else if(isNaN($UserId))
		{
			$msg.html("מספר תעודת זהות יכול להכיל מספרים בלבד");
			return false;
		}
								
		return true;
	});
	
	//delCourse validity
	$('#delCourseMsg').html("");

	$('#delCourseForm').hide();
	$('#delCourseForm').fadeIn('slow');
	
	$('#delCourseForm').submit(function() {
		
		var $CourseId = $.trim($('#delCourseId').val());
		
		var $msg = $("#delCourseMsg");
        
		if($CourseId === '')
		{
				$msg.html( " מספר קורס ריקה ");
				return false;
		}
		else if(isNaN($CourseId))
		{
			$msg.html("מספר קורס יכול להכיל מספרים בלבד");
			return false;
		}
								
		return true;
	});
	
	//delCircle validity
	$('#delCircleButton').focus();	
	$('#delCircleMsg').html("");

	$('#delCircleForm').hide();
	$('#delCircleForm').fadeIn('slow');
	
	$('#delCircleForm').submit(function() {
		
		var $CircleId = $.trim($('#delCircle').val());
		
		var $msg = $("#delCircleMsg");
        
		if($CircleId === '')
		{
				$msg.html( " מספר חוג אינו תקין ");
				return false;
		}
		else if(isNaN($CircleId))
		{
			$msg.html("מספר חוג יכול להכיל מספרים בלבד");
			return false;
		}
								
		return true;
	});
	
	
	

	
});

