package aglosh2014.appspot.com;

public class Circle {

	private int circle_id;
	private int circle_year;
	private String  circle_name;

	private int num_of_courses, max_num_of_courses;

	private Course courses[];

	public Circle(int id , String name, int year, int max_num_of_courses)
	{
		this.circle_id = id;
		this.circle_name = name;
		this.circle_year = year;

		this.max_num_of_courses=max_num_of_courses;
		this.num_of_courses=0;

		courses = new Course[max_num_of_courses];
	}
	
	public int get_circle_year()
	{
		return this.circle_year;
	}

	public int get_circle_id()
	{
		return this.circle_id;
	}

	public String get_circle_name()
	{
		return this.circle_name;
	}

	private int get_course_index_in_array(int course_id) //return -1 if not found
	{
		for(int i=0; i<num_of_courses; i++)
			if(course_id==courses[i].get_course_id())
				return i;

		return -1;
	}

	public int add_new_course_to_circle(String course_name, int course_id, Lecturer lecturer, Checker checker, int max_num_of_students)
	{
		if(this.num_of_courses>=max_num_of_courses) //no more room for a new course
			return -1;

		//check if course already exist
		int course_index=get_course_index_in_array(course_id);

		if(course_index!=-1)
			return 0; //course exist

		this.courses[num_of_courses]=new Course(course_name, course_id, lecturer, checker, max_num_of_students);

		num_of_courses++;

		return 1; //course added
	}

	public Student[] get_student_list_in_course(int course_id)
	{
		int course_index=get_course_index_in_array(course_id);

		if(course_index==-1) //if not in courses
			return null;

		return courses[course_index].get_students_in_course();
	}
	
	public int[] get_student_id_list_in_course(int course_id)
	{
		int course_index=get_course_index_in_array(course_id);

		if(course_index==-1) //if not in courses
			return null;
		
		Student students[]=courses[course_index].get_students_in_course();
		int students_id_list[]=new int[courses[course_index].get_num_of_students_in_course()];
		
		for(int i=0; i<courses[course_index].get_num_of_students_in_course(); i++)
			students_id_list[i]=students[i].get_id();
		
		return students_id_list;

	}

	public int add_new_student_to_course(int course_id, Student student)
	{
		int course_index=get_course_index_in_array(course_id);

		if(course_index==-1)
			return -1; //course doesn't exist

		return courses[course_index].add_student_to_course(student);
	}

	public void set_course_lecturer(int course_id, Lecturer lecturer)
	{
		int course_index=get_course_index_in_array(course_id);

		if(course_index==-1)
			return;

		courses[course_index].set_course_lecturer(lecturer);
	}

	public void set_course_checker(int course_id, Checker checker)
	{
		int course_index=get_course_index_in_array(course_id);

		if(course_index==-1)
			return;

		courses[course_index].set_course_checker(checker);
	}

	public String get_course_lecturer_name(int course_id)
	{
		int course_index=get_course_index_in_array(course_id);

		if(course_index==-1)
			return null;

		return courses[course_index].get_course_lecturer().get_name();
	}

	public String get_course_checker_name(int course_id)
	{
		int course_index=get_course_index_in_array(course_id);

		if(course_index==-1)
			return null;

		return courses[course_index].get_course_checker().get_name();
	}

	public Course[] get_courses_in_circle()
	{
		return courses;
	}
	
	public String get_courses_in_circle_as_string() //separated by comma ','
	{
		String list="";
		
		for(int i=0; i<num_of_courses; i++)
		{
			if(i!=0)
				list+=","; //add comma
			
			list+=courses[i].get_course_name();
		}
		
		return list;
	}
}
