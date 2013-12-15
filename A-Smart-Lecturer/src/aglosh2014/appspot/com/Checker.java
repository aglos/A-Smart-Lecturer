package aglosh2014.appspot.com;

public class Checker extends User {

	private Course Courses[];
	private int number_of_courses;
	
	public Checker(int id, String name, String password, int num_of_Courses)
	{
		super(id,name,password, CHECKER);
		Courses = new Course[num_of_Courses];
		for(int i = 0; i < Courses.length; i++)
			Courses[i] = null;
		
		number_of_courses = 0; 
	}
	
	public Course[] get_checker_courses()
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
