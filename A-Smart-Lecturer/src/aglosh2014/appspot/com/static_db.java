package aglosh2014.appspot.com;

import java.util.ArrayList;

//all String data is returned with ',' between each element

public class static_db {

	public final int NUM_OF_CIRCLES=3;
	public final int NUM_OF_COURSES=5;

	public Academy jce;

	public static_db() //set a static db
	{
		jce=new Academy("Jerusalem collage of engineering", 8, 100);

		jce.add_new_circle_to_academy(15, "הנדסת תוכנה", 2013, 5);
		jce.add_new_circle_to_academy(18, "הנדסת חומרים", 2013, 5);
		jce.add_new_circle_to_academy(19, "הנדסת תרופות", 2010, 5);

		Lecturer lecturer;
		Checker checker;
		Student student;

		lecturer=jce.add_new_lecturer(300300303, "שי תבור", "bla", 3);
		checker=jce.add_new_checker(300312123, "יוסי כהן", "blahh", 3);

		jce.circles[0].add_new_course_to_circle("מבוא לחדוא", 123, lecturer, checker, 30);
		jce.circles[0].add_new_course_to_circle("חדוא 2", 122, lecturer, checker, 20);

		student=jce.add_new_student(123333333, "חיים דוידו", "keke", 5, 20);

		if(student==null)
			System.out.println("kaki on ma face");

		jce.circles[0].add_new_student_to_course(123, student);

		student=jce.add_new_student(123333333, "יוני מותק", "kekee", 5, 20);
		jce.circles[0].add_new_student_to_course(123, student);

		System.out.println(jce.get_circles_in_academy_as_string());

		System.out.println(jce.circles[0].get_courses_in_circle_as_string());
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
