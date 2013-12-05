package aglosh2014.appspot.com;

//all String data is returned with ',' between each element

public class static_db {
	
	public final int NUM_OF_CIRCLES=3;
	public final int NUM_OF_COURSES=5;
	
	public Circles circles[];
	public Courses courses[];
	
	public static_db() //set a static db
	{
		circles=new Circles[NUM_OF_CIRCLES];
		
		//init db
		
		//add 2 circles
		circles[0]=new Circles(0, "הנדסת תוכנה");
		circles[1]=new Circles(1, "הנדסת חומרים");
		
		
		//add 3 courses to each circle
		circles[0].add_new_course("מבוא לתכנות", "תשעג", "שי תבור", "דן חמדן");
		circles[0].add_new_course("אלגברה ליניארית 1", "תשעג", "אלכס אייזנדברגיסקי", "ביאנה שטיינבוכפלצת");
		circles[0].add_new_course("מבוא לחדוא", "תשעג", "מרים בנק", "אבי לוי");
		
		circles[1].add_new_course("מבוא לחומרים", "תשעג", "ברי סחרוף", "דן חמדן");
		circles[1].add_new_course("אלגברה חומרנית 1", "תשעג", "אלכס אייזנדברגיסקי", "ביאנה שטיינבוכפלצת");
		circles[1].add_new_course("מבוא לחדוא חומרים", "תשעג", "מרים בנק", "אבי לוי");
		
		//add 3 students to each course :(
		
		circles[0].add_new_student_to_course(300393121, "מבוא לתכנות");
		circles[0].add_new_student_to_course(123331231, "מבוא לתכנות");
		circles[0].add_new_student_to_course(993221232, "מבוא לתכנות");
		
		circles[0].add_new_student_to_course(300393121, "אלגברה ליניארית 1");
		circles[0].add_new_student_to_course(123331231, "אלגברה ליניארית 1");
		circles[0].add_new_student_to_course(993221232, "אלגברה ליניארית 1");
		
		circles[0].add_new_student_to_course(300393121, "מבוא לחדוא");
		circles[0].add_new_student_to_course(123331231, "מבוא לחדוא");
		circles[0].add_new_student_to_course(993221232, "מבוא לחדוא");
		//
		circles[1].add_new_student_to_course(300393121, "מבוא לחומרים");
		circles[1].add_new_student_to_course(123331231, "מבוא לחומרים");
		circles[1].add_new_student_to_course(993221232, "מבוא לחומרים");
		
		circles[1].add_new_student_to_course(300393121, "אלגברה חומרנית 1");
		circles[1].add_new_student_to_course(123331231, "אלגברה חומרנית 1");
		circles[1].add_new_student_to_course(993221232, "אלגברה חומרנית 1");
		
		circles[1].add_new_student_to_course(300393121, "מבוא לחדוא חומרים");
		circles[1].add_new_student_to_course(123331231, "מבוא לחדוא חומרים");
		circles[1].add_new_student_to_course(993221232, "מבוא לחדוא חומרים");
	}
	
	public String get_circles_list()
	{
		String list="";
		
		for(int i=0; i<circles.length; i++)
			if(circles[i]!=null)
				list+=circles[i].get_name()+ ",";
			
		list = list.substring(0,list.length()-1);
		return list;
	}
	
	public String get_courses_in_circle(int circle)
	{
		for(int i=0; i<circles.length; i++)
			if(circles[i]!=null && circles[i].get_id() == circle)
				return circles[i].get_courses_in_circle();
						
		return null;
	}
	
	public int[] get_students_in_course(int circle, int course)
	{
		for(int i=0; i<circles.length; i++)
			if(circles[i]!=null && circles[i].get_id() == circle)
				return circles[i].get_student_list_in_course(course);
		
		return null;
	}
	
	
	//public String get_course(int course)
	//{
		//return circles[course].g
	//}
	
//	public static void main(String[] args) {
//		static_db db=new static_db();
//		
//		System.out.println(db.get_circles_list());
//		System.out.println(db.get_courses_in_circle("הנדסת תוכנה"));
//		int blah[]=db.get_students_in_course("הנדסת תוכנה", "מבוא לתכנות");
//		for(int i=0; i<blah.length; i++)
//			System.out.println(blah[i]);
//	}

}
