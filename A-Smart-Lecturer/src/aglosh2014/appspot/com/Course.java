package aglosh2014.appspot.com;

import com.google.appengine.api.search.query.ExpressionParser.num_return;

public class Course 
{
	public static final int MAX_NUM_OF_EXERCISES=30;
	
	//properties
	private int num_of_exercises_in_course;
	private int num_of_students_in_course;
	private int max_num_of_students_in_course;
	
	private String course_name;
	private int course_id;
	private Lecturer course_lecturer;
	private Checker course_checker;
	private Student students_in_course[];
	private Exercise exercises_in_course[];
	
	public Course(String course_name, int course_id, Lecturer lecturer, Checker checker, int max_num_of_students)
	{
		this.num_of_students_in_course=0;
		this.num_of_exercises_in_course=0;
		this.course_id=course_id;
		
		this.course_name=course_name;
		this.max_num_of_students_in_course=max_num_of_students;
		
		set_course_checker(checker);
		set_course_lecturer(lecturer);
		
		this.exercises_in_course=new Exercise[MAX_NUM_OF_EXERCISES];
		this.students_in_course=new Student[max_num_of_students];
	}
	
	public void set_course_lecturer(Lecturer lecturer)
	{
		if(lecturer==null)
			return;
		
		this.course_lecturer=lecturer;
	}
	
	public void set_course_checker(Checker checker)
	{
		if(checker==null)
			return;
		
		this.course_checker=checker;
	}
	
	public Lecturer get_course_lecturer()
	{
		return this.course_lecturer;
	}
	
	public Checker get_course_checker()
	{
		return this.course_checker;
	}
	
	public String get_course_name()
	{
		return this.course_name;
	}
	
	public int get_course_id()
	{
		this.course_id;
	}
	
	public int add_student_to_course(Student student) //return -1 if no room, return 0 if already in course, return 1 if added to course
	{
		if(student==null || this.num_of_students_in_course>=this.max_num_of_students_in_course) //if null or no more room in course
			return -1;
		
		//check if student is already in course
		for(int i=0; i<num_of_students_in_course; i++)
		{
			if(students_in_course[i]==student) //compare address, if student in course do nothing
				return 0;
		}
		
		//add student
		students_in_course[num_of_students_in_course]=student;
		num_of_students_in_course++;
		
		return 1;
	}
	
	public Student[] get_students_in_course()
	{
		return students_in_course;
	}
	
	public int get_num_of_students_in_course()
	{
		return num_of_students_in_course;
	}
	
	public Exercise[] get_exercises_in_course()
	{
		return exercises_in_course;
	}
	
	public int add_new_exercise_to_course() //return -1 if no more room for exercises, return 0 if added
	{
		if(this.num_of_exercises_in_course>=MAX_NUM_OF_EXERCISES)
			return -1;
		
		exercises_in_course[this.num_of_exercises_in_course]=new Exercise(num_of_exercises_in_course);
		
		num_of_exercises_in_course++;
		
		return 0;
	}
}
