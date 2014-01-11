package aglosh2014.appspot.com;

import java.util.ArrayList;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

//all String data is returned with ',' between each element

public class static_db {

	public final int NUM_OF_CIRCLES=3;
	public final int NUM_OF_COURSES=5;

	public static Academy jce=new Academy("Jerusalem collage of engineering");
	
	public static boolean was_init=false;

	public static void db_init()  //set a static db
	{
		if(was_init==true)
			return;

		was_init=true;
		int j = jce.add_new_circle_to_academy(13, "הנדסת תוכנה", 2013);
		jce.add_new_circle_to_academy(21, "הנדסת חומרים", 2013);
		jce.add_new_circle_to_academy(5, "הנדסת תרופות", 2010);


		Lecturer lecturer;
		Checker checker;
		Student student,st2;
		Admin admin;
		Course engineeringSoft;

		lecturer=jce.add_new_lecturer(888888888, "lecturer ", "hahaha");
		checker=jce.add_new_checker(111111111, "checker", "hahaha");
		admin=jce.add_new_admin(222222222, "מנהל", "hahaha");

		int k = jce.add_new_course_to_circle(13,"מבוא לחדוא", 175, lecturer, checker);
		int p;// = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("נגזרות חלקיות",false);
		
		jce.add_new_course_to_circle(13, "חדוא 2", 136, lecturer, checker);


		student=jce.add_new_student(333333333, "חיים דוידו", "hahaha");
		st2=jce.add_new_student(555555555, "student", "aaaaaa");

		if(student==null)
			System.out.println("kaki on ma face");

		jce.add_new_student_to_course(13, 175, student);
		jce.add_new_student_to_course(13, 136, student);

		student=jce.add_new_student(666666666, "יוני מותק", "kekeeeeeeeeee");
		jce.add_new_student_to_course(13, 175, student);



		//add groups





		k = jce.add_new_course_to_circle(13, "הנדסת תוכנה", 100, lecturer, checker);
		//array of student id's
		int[] idArr = {218941000,325734200,347080320,365978470,367958960,368926280
				,200518256,200706265,200708832,200806602,201575701,201581436
				,201638673,203047857,203307756,203880000,204174643,300308939
				,300393121,300503398,300664703,300667003,300897709,301451258
				,301589263,301678405,302050265,302520648,302540612,302771258
				,303093918,303176085,303724371,307889287,308225598,308667385
				,310520952,311825590,320457807,321131708,328786462,329042527};
		System.out.println("*****************-------------------->************\n"+idArr.length);


		//*********************************************************************************************************************************************//		
		//*********************************************************************************************************************************************//		


		int[] personal_task_Git = {100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100
				,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100
				,100,100,100,0,0,0};

		int[] personal_task_Hello = {100,105,101,100,102,101,101,100,103,100,101,101,101,100,101,
				101,100,105,100,101,101,102,100,100,100,105,102,100,105,100,100,100,103,105,105,
				105,100,100,102,101,101,0};

		int[] inception = {0,0,0,0,0,85,85,95,95,95,95,100,100,100,100,100,100,100,100,100,100,
				100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100
				,100};

		int[] prototype = {90,90,90,90,90,102,102,102,102,92,92,92,92,100,100,100,100,100,93,93,
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

		int[] srs = {95,95,95,95,95,95,95,95,95,97,97,97,97,100,100,100,100,100,100,100,100,100,
				100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,
		};

		int[] sds = {95,95,95,95,95,95,95,95,95,95,95,95,95,95,100,100,100,100,100,100,100,100,
				100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,
		};

		int[] zfr = {50,50,50,50,70,70,70,70,70,70,70,70,70,70,70,80,80,80,80,85,85,85,85,95,95,
				95,95,95,95,95,95,95,100,100,100,100,100,100,100,100,100,100};

		int[] total=new int[idArr.length];
		for(int l=0;l<total.length;l++){
			total[l]=(personal_task_Hello[l]+inception[l]+srs[l]+sds[l]+prototype[l]+personal_task_Git[l]+zfr[l])/7;
		}

		jce.get_circles_in_academy()[j].get_courses_in_circle()[k].set_course_total(total);

		//*********************************************************************************************************************************************//		
		//*********************************************************************************************************************************************//		


		for(int i=0;i<idArr.length;i++){//add student to course
			jce.add_new_student_to_course(13, 100, jce.add_new_student(idArr[i], "חיים דוידו", "hahaha"));
		}


		System.out.println("**" + j + "**");


		//*********************************************************************************************************************************************//		

		

		p = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("Inception",true);
		Student[] students =  jce.get_students_array_in_course(13, 100);


		for(int i=0;students != null && i<students.length;i++) {
			Exercise e = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].get_exercises_in_course()[p];
			Grade g = new Grade(e);
			g.set_grade(inception[i]);

			System.out.println(students[i].Grades.add(g));
			System.out.println("Add grade to student " + i + " in circle : 13 in course: 100 in exec" + p);
		}

		//*********************************************************************************************************************************************//		



		p = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("SRS",true);

		for(int i=0;students != null && i<students.length;i++) {
			Exercise e = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].get_exercises_in_course()[p];
			Grade g = new Grade(e);
			g.set_grade(srs[i]);

			System.out.println(students[i].Grades.add(g));
			System.out.println("Add grade to student " + i + " in circle : 13 in course: 100 in exec" + p);
		}

		//*********************************************************************************************************************************************//		


		p = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("Personal task - HELLO",true);

		for(int i=0;students != null && i<students.length;i++) {
			Exercise e = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].get_exercises_in_course()[p];
			Grade g = new Grade(e);
			g.set_grade(personal_task_Hello[i]);

			System.out.println(students[i].Grades.add(g));
			System.out.println("Add grade to student " + i + " in circle : 13 in course: 100 in exec" + p);
		}
		//*********************************************************************************************************************************************//		


		p = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("SDS",true);

		for(int i=0;students != null && i<students.length;i++) {
			Exercise e = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].get_exercises_in_course()[p];
			Grade g = new Grade(e);
			g.set_grade(sds[i]);

			System.out.println(students[i].Grades.add(g));
			System.out.println("Add grade to student " + i + " in circle : 13 in course: 100 in exec" + p);
		}
		//*********************************************************************************************************************************************//		


		p = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("PROTOTYPE",true);

		for(int i=0;students != null && i<students.length;i++) {
			Exercise e = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].get_exercises_in_course()[p];
			Grade g = new Grade(e);
			g.set_grade(prototype[i]);

			System.out.println(students[i].Grades.add(g));
			System.out.println("Add grade to student " + i + " in circle : 13 in course: 100 in exec" + p);
		}

		//*********************************************************************************************************************************************//		


		p = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("Personal task - Github",true);

		for(int i=0;students != null && i<students.length;i++) {
			Exercise e = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].get_exercises_in_course()[p];
			Grade g = new Grade(e);
			g.set_grade(personal_task_Git[i]);

			System.out.println(students[i].Grades.add(g));
			System.out.println("Add grade to student " + i + " in circle : 13 in course: 100 in exec" + p);
		}

		//*********************************************************************************************************************************************//		


		p = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("ZFR",true);

		for(int i=0;students != null && i<students.length;i++) {
			Exercise e = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].get_exercises_in_course()[p];
			Grade g = new Grade(e);
			g.set_grade(zfr[i]);

			System.out.println(students[i].Grades.add(g));
			System.out.println("Add grade to student " + i + " in circle : 13 in course: 100 in exec" + p);
		}
		
		//*********************************************************************************************************************************************//		
		
		
		/*p = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("Total",true);

		for(int i=0;students != null && i<students.length;i++) {
			Exercise e = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].get_exercises_in_course()[p];
			Grade g = new Grade(e);
			g.set_grade((personal_task_Hello[i]+inception[i]+srs[i]+sds[i]+prototype[i]+personal_task_Git[i]+zfr[i])/7);

			System.out.println(students[i].Grades.add(g));
			System.out.println("Add grade to student " + i + " in circle : 13 in course: 100 in exec" + p);
		}*/
		
		//*********************************************************************************************************************************************//		
		
		
		jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("Iteration 1",false);
		jce.get_circles_in_academy()[j].get_courses_in_circle()[k].add_new_exercise_to_course("Iteration 2",false);


		students =  jce.get_students_array_in_course(13, 100);


		for(int i=0;students != null && i<students.length;i++) {
			Exercise e = jce.get_circles_in_academy()[j].get_courses_in_circle()[k].get_exercises_in_course()[p];
			Grade g = new Grade(e);
			g.set_grade((6*i + 10));

			System.out.println(students[i].Grades.add(g));
			System.out.println("Add grade to student " + i + " in circle : 13 in course: 100 in exec" + p);
		}

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
