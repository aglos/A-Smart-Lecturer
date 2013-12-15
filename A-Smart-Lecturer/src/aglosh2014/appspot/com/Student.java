package aglosh2014.appspot.com;

public class Student extends User{

	private Course Courses[];
	private Grade Grades[];
	private int number_of_courses;
	private int number_of_grades;
	
	public Student(int id, String name, String password, int num_of_Courses,int num_of_grade)
	{
		
		super(id,name, password, STUDENT);
		Courses = new Course[num_of_Courses];
		Grades = new Grade[num_of_grade];
		
		for(int i = 0; i < Courses.length; i++)
			Courses[i] = null;
		
		for(int i = 0; i < Grades.length; i++)
			Grades[i] = null;
		
		number_of_courses = 0;
		number_of_grades = 0;
	}
	
	public Student get_student()
	{
		return this;
	}
	
	public Grade[] get_student_grades()
	{
		return Grades;
	}
	
	public Course[] get_student_courses()
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

	public int add_grade(Grade grade)
	{
		if(number_of_grades >= Grades.length)
			return -1;
		Grades[number_of_grades] = grade;
		number_of_grades++;
		return 0;
	}
	
	public int get_student_grade_by_exercise (Exercise ex)
	{
		for(int i = 0; i < number_of_grades; i++)
			if(Grades[i].get_exercise() == ex)
				return Grades[i].get_grade();
		return -1;
	}
	
	
	
	
	
	
	
	
}
