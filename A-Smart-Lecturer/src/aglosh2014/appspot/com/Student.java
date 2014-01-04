package aglosh2014.appspot.com;

import java.util.ArrayList;

public class Student extends User{

	public ArrayList<Grade> Grades;
	
	public Student(int id, String name, String password)
	{
		
		super(id,name, password, STUDENT);
		Grades = new ArrayList<>();
	}
	
//	public Grade[] get_student_grades()
//	{
//		return Grades;
//	}
	
//	public Course[] get_student_courses()
//	{
//		return Courses;
//	}
//
//	public int add_grade(Grade grade)
//	{
//		if(number_of_grades >= Grades.length)
//			return -1;
//		Grades[number_of_grades] = grade;
//		number_of_grades++;
//		return 0;
//	}
	
//	public int get_student_grade_by_exercise (Exercise ex)
//	{
//		for(int i = 0; i < number_of_grades; i++)
//			if(Grades[i].get_exercise() == ex)
//				return Grades[i].get_grade();
//		return -1;
//	}
}
