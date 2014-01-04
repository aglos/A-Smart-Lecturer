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
		int j = jce.add_new_circle_to_academy(13, "הנדסת תוכנה", 2013, 5);
		jce.add_new_circle_to_academy(21, "הנדסת חומרים", 2013, 5);
		jce.add_new_circle_to_academy(5, "הנדסת תרופות", 2010, 5);

		
		Lecturer lecturer;
		Checker checker;
		Student student,st2;
		Admin admin;
		Course engineeringSoft;

		lecturer=jce.add_new_lecturer(300393121, "lecturer ", "hahaha");
		checker=jce.add_new_checker(300664703, "checker", "hahaha");
		admin=jce.add_new_admin(201581436, "מנהל", "hahaha");

		jce.add_new_course_to_circle(13,"מבוא לחדוא", 175, lecturer, checker, 30);
		jce.add_new_course_to_circle(13, "חדוא 2", 136, lecturer, checker, 20);


		student=jce.add_new_student(300667003, "חיים דוידו", "hahaha");
		st2=jce.add_new_student(111111111, "student", "aaaaaa");

		if(student==null)
			System.out.println("kaki on ma face");

		jce.add_new_student_to_course(13, 175, student);
		jce.add_new_student_to_course(13, 136, student);

		student=jce.add_new_student(125555555, "יוני מותק", "kekeeeeeeeeee");
		jce.add_new_student_to_course(13, 175, student);



		int k = jce.add_new_course_to_circle(13, "הנדסת תוכנה", 100, lecturer, checker, 100);
		System.out.println("**" + j + "**");
		//for(int i=0;i<10;i++){
		//	int n = 111121110;
		//	n+=i;
		//	jce.add_new_student_to_course(13, 100, jce.add_new_student(n, "חיים דוידו", "hahaha"));
		//}
		
		
		jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("ZFR");
		jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("SRS");
		
		//	System.out.println(jce.get_user_data_by_id(300664703));
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