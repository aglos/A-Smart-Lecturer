package aglosh2014.appspot.com;

public class Circles {
	
	public static final int NUM_OF_COURSES=5;
	
	private int circle_id;
	private String  circle_name;
	private int circle_year;
	
	private Courses courses;
	
	public Circles(int id , String name, int year)
	{
		circle_id = id;
		circle_name = name;
		circle_year = year;
		courses = new Courses(NUM_OF_COURSES);
	}
	
	public int get_id()
	{
		return circle_id;
	}
	
	public String get_name()
	{
		return circle_name;
	}
	
	public int get_year() 
	{
		return circle_year;
	}
	
	public String get_course_name(int course)
	{
		return this.courses.get_course_name(course);
	}
	
	public void add_new_course(String course_name, String lecturer, String checker)
	{
		courses.add_new_course(course_name, lecturer, checker);
	}
	
	public int[] get_student_list_in_course(int course_id)
	{
		return courses.get_student_list_in_course(course_id);
	}
	
	public void add_new_student_to_course(int id, String course_name)
	{
		courses.add_new_student_to_course(id, course_name);
	}
	
	public void set_course_lecturer(String course_name, String lecturer)
	{
		courses.set_course_lecturer(course_name, lecturer);
	}
	
	public void set_course_checker(String course_name, String checker)
	{
		courses.set_course_checker(course_name, checker);
	}
	
	public String get_course_lecturer_name(String course_name)
	{
		return courses.get_course_lecturer_name(course_name);
	}
	
	public String get_course_checker_name(String course_name)
	{
		return courses.get_course_checker_name(course_name);
	}
	
	public String get_courses_in_circle()
	{
		return courses.get_courses_list();
	}
	
	public String get_courses_id_in_circle()
	{
		return courses.get_courses_id_list();
	}
		

}
