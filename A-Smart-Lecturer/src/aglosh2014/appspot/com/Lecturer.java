package aglosh2014.appspot.com;

import aglosh2014.appspot.com.Courses.Course;

public class Lecturer extends Users {
	
	private Course Courses[];
	private int number_of_courses;
	
	public Lecturer(int id, int password, String name, int type, int num_of_Courses)
	{
		super(id,password,name,type);
		Courses = new Course[num_of_Courses];
		for(int i = 0; i < Courses.length; i++)
			Courses[i] = null;
		
		number_of_courses = 0; 
	}
	
	public Course[] get_lecturer_courses()
	{
		return Courses;
	}
	public int add_course(Course course)
	{
		if(number_of_courses >= Courses.length)
			return -1;
		Courses[number_of_courses] = course;
		number_of_courses++;
		return 0;
	}
}

