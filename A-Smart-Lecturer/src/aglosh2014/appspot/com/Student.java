package aglosh2014.appspot.com;

import java.util.ArrayList;

public class Student extends User{

	public ArrayList<Grade> Grades;
	
	public Student(int id, String name, String password)
	{
		
		super(id,name, password, STUDENT);
		Grades = new ArrayList<>();
	}
	
	public Student(Student s)
	{
		
		super(s.get_id(),s.get_name(), s.get_password(), STUDENT);
		Grades = new ArrayList<>();
		
	}
	
	public Grade get_student_grade(Exercise e)
	{
		
		for(int i = 0; i < this.Grades.size(); i++) {
			if (Grades.get(i).get_exercise().equals(e)) {
				return Grades.get(i);
			}
				
		}
		
		return null;
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
<<<<<<< HEAD
	public int add_grade(Grade grade)
	{
		
		
		Grades.add(grade);
		
		return 0;
	}
=======
//	public int add_grade(Grade grade)
//	{
	//	if(number_of_grades >= Grades.length)
		//	return -1;
//		Grades[number_of_grades] = grade;
	//	number_of_grades++;
//		return 0;
	//}
>>>>>>> 69a9afdd8e28cc7cd9d63e8253478f294b220321
	
//	public int get_student_grade_by_exercise (Exercise ex)
//	{
//		for(int i = 0; i < number_of_grades; i++)
//			if(Grades[i].get_exercise() == ex)
//				return Grades[i].get_grade();
//		return -1;
//	}
}
