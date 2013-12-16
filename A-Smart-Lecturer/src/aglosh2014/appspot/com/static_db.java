package aglosh2014.appspot.com;

import java.util.ArrayList;

//all String data is returned with ',' between each element

public class static_db {

	public final int NUM_OF_CIRCLES=3;
	public final int NUM_OF_COURSES=5;

	public static Academy jce=new Academy("Jerusalem collage of engineering", 8, 100);
	public static boolean was_init=false;

	public static void db_init()  //set a static db
	{
		if(was_init==true)
			return;
		
		was_init=true;
		jce.add_new_circle_to_academy(13, "הנדסת תוכנה", 2013, 5);
		jce.add_new_circle_to_academy(21, "הנדסת חומרים", 2013, 5);
		jce.add_new_circle_to_academy(5, "הנדסת תרופות", 2010, 5);
		
		Lecturer lecturer;
		Checker checker;
		Student student;
		
		lecturer=jce.add_new_lecturer(300393121, "שי תבור", "hahaha", 3);
		checker=jce.add_new_checker(300664703, "יוסי כהן", "hahaha", 3);
		
		jce.circles[0].add_new_course_to_circle("מבוא לחדוא", 175, lecturer, checker, 30);
		jce.circles[0].add_new_course_to_circle("חדוא 2", 136, lecturer, checker, 20);
		
		student=jce.add_new_student(300667003, "חיים דוידו", "hahaha", 5, 20);
		
		if(student==null)
			System.out.println("kaki on ma face");
		
		jce.circles[0].add_new_student_to_course(175, student);
		
		student=jce.add_new_student(125555555, "יוני מותק", "kekeeeeeeeeee", 5, 20);
		jce.circles[0].add_new_student_to_course(175, student);

//		System.out.println(jce.get_circles_in_academy_as_string());

//		System.out.println(jce.circles[0].get_courses_in_circle_as_string());
	}
	
}


//	public static void main(String[] args) {
//		static_db a=new static_db();
//
//		ArrayList<Circle> b=new ArrayList<>();
//		System.out.println(b.size());
//		b.add(a.jce.circles[0]);
//		System.out.println(b.size());
//	}
//}
