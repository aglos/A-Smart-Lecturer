package aglosh2014.appspot.com;

import java.util.Arrays;

import aglosh2014.appspot.com.Courses.Course;

//all String data is returned with ',' between each element

public class static_db {
	
	public final int NUM_OF_CIRCLES=5;
	public final int NUM_OF_COURSES=5;
	
	public Circles circles[];
	public Courses courses[];
	
	public static_db() //set a static db
	{
		circles=new Circles[NUM_OF_CIRCLES];
		
		//init db
		
		//add 2 circles
		circles[0]=new Circles(0, "הנדסת תוכנה",2010);
		circles[1]=new Circles(1, "הנדסת חומרים",2011);
		circles[2]=new Circles(2, "הנדסת תרופות",2012);
		circles[3]=new Circles(3, "הנדסת כימיה",2013);
		circles[4]=new Circles(4, "הנדסת תעשייה וניהול",2010);
		
		//add 3 courses to each circle
		circles[0].add_new_course("מבוא לתכנות", "שי שבור", "דן חמדן");
		circles[0].add_new_course("אלגברה ליניארית 1", "אלכס אייזנדברגיסקי", "ביאנה שטיינבוכפלצת");
		circles[0].add_new_course("מבוא לחדוא", "מרים בנג", "אבי לוי");
		
		circles[1].add_new_course("מבוא לחומרים", "ברי סחרוף", "דן חמדן");
		circles[1].add_new_course("אלגברה חומרנית 1", "אלכס אייזנדברגיסקי", "ביאנה שטיינבוכפלצת");
		circles[1].add_new_course("מבוא לחדוא חומרים", "מרים בנק", "אבי לוי");
		
		//add 3 students to each course :(
		
		circles[0].add_new_student_to_course(300393121, "מבוא לתכנות");
		circles[0].add_new_student_to_course(123331231, "מבוא לתכנות");
		circles[0].add_new_student_to_course(993221232, "מבוא לתכנות");
		circles[0].add_new_student_to_course(123132132, "מבוא לתכנות");
		circles[0].add_new_student_to_course(234343333, "מבוא לתכנות");
		circles[0].add_new_student_to_course(444445555, "מבוא לתכנות");
		circles[0].add_new_student_to_course(324234343, "מבוא לתכנות");
		circles[0].add_new_student_to_course(667677676, "מבוא לתכנות");
		
		
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
	
	
	public String get_circles_year_list()
	{
		String list="";
		int[] intArray = new int[NUM_OF_CIRCLES];
		
		for(int i=0; i<circles.length; i++) {
			intArray[i] = circles[i].get_year();
		}
		
		Arrays.sort(intArray);
		
		for(int i=0; i<circles.length; i++) {
			
				if (i==0){
					list+=intArray[i]+ ",";
				}
				else if (i > 0 && intArray[i] != intArray[i-1])
					list+=intArray[i]+ ",";
		}
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
	
	public String get_courses_id_in_circle(int circle)
	{
		for(int i=0; i<circles.length; i++)
			if(circles[i]!=null && circles[i].get_id() == circle)
				return circles[i].get_courses_id_in_circle();
						
		return null;
	}
	
	
	public int[] get_students_in_course(int circle, int course)
	{
		for(int i=0; i<circles.length; i++)
			if(circles[i]!=null && circles[i].get_id() == circle)
				return circles[i].get_student_list_in_course(course);
		
		return null;
	}
	
	
	
	public String get_circle_name(int circle)
	{
		return circles[circle].get_name();
	}
	
	public String get_circles_by_year(int year)
	{
		String list="";
		
		for(int i=0; i<circles.length; i++)
			if(circles[i]!=null && circles[i].get_year()==year)
				list+=circles[i].get_name()+ ",";
			
		list = list.substring(0,list.length()-1);
		return list;
	}
	
	public String get_circles_id_by_year(int year)
	{
		String list="";
		
		for(int i=0; i<circles.length; i++)
			if(circles[i]!=null && circles[i].get_year()==year)
				list+=circles[i].get_id()+ ",";
			
		list = list.substring(0,list.length()-1);
		return list;
	}
	
	
	public String get_course_name(int course, int circle)
	{
		return circles[circle].get_course_name(course);
	}
	
	public int get_circle_year(int circle)
	{
		return circles[circle].get_year();
	}
	
	public int get_circle_id(String circle)
	{
		for(int i=0; i<circles.length; i++)
			if(circles[i]!=null && circles[i].get_name().equals(circle))
				return circles[i].get_id();
		
		return -1;
	}
	
//	public int get_course_year(int course)
	//{
	//	return circles[course].get
//	}
	
//	public String get_circle_name(int circle)
//	{
	//	return circles[course].get_name();
//	}
	
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
