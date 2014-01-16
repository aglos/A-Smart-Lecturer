package aglosh2014.appspot.com;

import java.util.ArrayList;

public class Course 
{
	private String course_name;
	private int course_id;
	public int course_num=0;
	public int a[];
	//private Lecturer course_lecturer;
//	private Checker course_checker;
	
	
	private int course_lecturer;
	private int course_checker;
	private ArrayList<Integer> total;
	//private int[] students_in_course;
//	private int[] exercises_in_course;
	
	private ArrayList<Integer> students_in_course;
	private ArrayList<Integer> exercises_in_course;
	/*public Course(String course_name, int course_id, Lecturer lecturer, Checker checker)
	{
		this.course_id=course_id;
		this.course_name=course_name;
		
		set_course_checker(checker);
		set_course_lecturer(lecturer);
		
		this.exercises_in_course=new ArrayList<>();
		this.students_in_course=new ArrayList<>();
		this.total=new ArrayList<>();
	}*/
	
	public Course(String course_name, int course_id,int lecturer_id, int checker_id)
	{
		
		this.course_id=course_id;
		this.course_name=course_name;
		course_num++;
		this.course_checker=checker_id;
		this.course_lecturer=lecturer_id;
		this.exercises_in_course=new ArrayList<>();
		this.students_in_course=new ArrayList<>();
		this.total=new ArrayList<>();
	}
	
	
	/*public void set_course_lecturer(Lecturer lecturer)
	{
		if(lecturer==null)
			return;
		
		lecturer.add_course(this);
		
		this.course_lecturer=lecturer;
	}
	
	public void set_course_checker(Checker checker)
	{
		if(checker==null)
			return;
		
		checker.add_course(this);
		
		this.course_checker=checker;
	}*/
	
	/*public Lecturer get_course_lecturer()
	{
		return this.course_lecturer;
	}*/
	public int get_course_lecturer()
	{
		return this.course_lecturer;
	}
	
/*	public Checker get_course_checker()
	{
		return this.course_checker;
	}*/
	
	public int get_course_checker()
	{
		return this.course_checker;
	}
	
	public String get_course_name()
	{
		return this.course_name;
	}
	
	public int get_course_id()
	{
		return this.course_id;
	}
	
	public int[] get_course_total()
	{
		int[] ret = new int[total.size()];
	    for (int i=0; i < ret.length; i++)
	    {
	        ret[i] = total.get(i).intValue();
	    }
	    return ret;
	}
	
	public void set_course_total(int[] array)
	{
		for (int i = 0; i < array.length; i++)
	    {
	        total.add(array[i]);
	    }

	}
	
	/*public int add_student_to_course(Student student) //return -1 if no room, return 0 if already in course, return 1 if added to course
	{
		if(student==null) //if null or no more room in course
			return -1;
		
		//check if student is already in course
		if(students_in_course.contains(student))
			return 0;
		
		//add student
		students_in_course.add(student);
		
		return 1;
	}*/
	public int add_student_to_course(Student student)
	{
		if(student==null) //if null or no more room in course
			return -1;
		
		//check if student is already in course
		if(students_in_course.contains(student))
			return 0;
		
		//add student
		students_in_course.add(student.get_id());
		
		return 1;
	}
	
	public Student[] get_students_in_course()
	{
		Student[] array = students_in_course.toArray(new Student[students_in_course.size()]);
		return array;
	}
	
	public int get_num_of_students_in_course()
	{
		return students_in_course.size();
	}
	
	public Exercise[] get_exercises_in_course()
	{
		Exercise[] array = exercises_in_course.toArray(new Exercise[exercises_in_course.size()]);
		return array;
	}
	
	/*public int add_new_exercise_to_course(String title,boolean checked) //return -1 if no more room for exercises, return 0 if added
	{
		exercises_in_course.add(new Exercise(exercises_in_course.size(), title,checked));
		
		return exercises_in_course.size()-1;
	}*/
	
	
	public int add_new_exercise_to_course(Exercise exercise)
	{
		if(exercise==null) //if null or no more room in course
			return -1;
		
		//check if student is already in course
		if(exercises_in_course.contains(exercise))
			return 0;
		
		//add student
		exercises_in_course.add(exercise.get_exercise_id());
		
		return 1;
	}
}
