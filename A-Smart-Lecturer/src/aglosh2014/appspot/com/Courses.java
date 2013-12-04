package aglosh2014.appspot.com;

public class Courses {

//this class represent a list of courses & a course object
 static final int NUM_OF_STUDENTS_IN_COURSE=20;
	
	public int new_course_id; //next course to be created
	public Course Courses_table[]; //list of courses
	
	public Courses(int num_of_courses) //creates a new list of courses the size of n
	{
		if(num_of_courses<1)
			return;
		
		Courses_table=new Course[num_of_courses];
		new_course_id=0;
	}
	
	public int add_new_course(String course_name, String course_year, String lecturer, String checker) //add new course to list
	{
		if (new_course_id>=Courses_table.length)
		{
			System.out.println("max number of courses is reached, did not create a new course!");
			return -1;
		}
		
		int temp=new_course_id; //course id
		
		Courses_table[new_course_id]=new Course(course_name, course_year, lecturer, checker); //create new course
		
		if(Courses_table[temp]==null) //if not created
		{
			System.out.println("No string for course name");
			return -1;
		}
		
		return Courses_table[new_course_id-1].course_id; //return new course id
	}
	
	public String get_courses_list()
	{
		if(new_course_id==0)
			return null;
		
		String course_list="";
		
		for(int i=0; i<new_course_id; i++)
			course_list+=get_course_name(i) + ",";
		
		return course_list;
			
	}
	
	public String get_course_name(int id)
	{
		return Courses_table[id].get_course_name(id);
	}
	
	public int get_course_id(String course_name)
	{
		for(int i=0; i<new_course_id; i++)
		{
			if(Courses_table[i].course_name.equals(course_name))
				return i;
		}
		
		return -1;
	}
	
	public int[] get_student_list_in_course(String course_name)
	{
		if(course_name.isEmpty())
			return null;
		
		int course_id=get_course_id(course_name);
		
		if(course_id<0)
			return null;
		
		return Courses_table[course_id].get_students_list();
	}
	
	public void add_new_student_to_course(int id, String course_name)
	{
		if(course_name.isEmpty() || id<=0)
			return;
		
		int course_id=get_course_id(course_name);
		
		if(course_id<0)
			return;
		
		Courses_table[course_id].add_student_to_course(id);
	}
	
	public void set_course_lecturer(String course_name, String lecturer)
	{
		if(course_name.isEmpty() || lecturer.isEmpty())
			return;
		
		int course_id=get_course_id(course_name);
		
		if(course_id<0)
			return;
		
		Courses_table[course_id].set_course_lecturer(lecturer);
	}
	
	public void set_course_checker(String course_name, String checker)
	{
		if(course_name.isEmpty() || checker.isEmpty())
			return;
		
		int course_id=get_course_id(course_name);
		
		if(course_id<0)
			return;
		
		Courses_table[course_id].set_course_checker(checker);
	}
	
	public String get_course_lecturer_name(String course_name)
	{
		if(course_name.isEmpty())
			return null;
		
		int course_id=get_course_id(course_name);
		
		if(course_id<0)
			return null;
		
		return Courses_table[course_id].get_course_lecturer();
	}
	
	public String get_course_checker_name(String course_name)
	{
		if(course_name.isEmpty())
			return null;
		
		int course_id=get_course_id(course_name);
		
		if(course_id<0)
			return null;
		
		return Courses_table[course_id].get_course_checker();
	}
	
	public String get_course_year(String course_name)
	{
		if(course_name.isEmpty())
			return null;
		
		int course_id=get_course_id(course_name);
		
		if(course_id<0)
			return null;
		
		return Courses_table[course_id].get_course_year();
	}
	
	public class Course {
		private String course_name;
		private int course_id;
		private String course_year;
		private int students_in_course[];
		private String lecturer, checker;
		
		public Course(String course_name, String year, String lecturer, String checker)
		{
			if (course_name.equals("") || year.equals(""))
				return;
			
			this.set_course_lecturer(lecturer);
			this.set_course_checker(checker);
			this.course_name=course_name;
			this.course_id=new_course_id++;
			this.course_year=year;
			
			students_in_course=new int[NUM_OF_STUDENTS_IN_COURSE];
		}
		
		public String get_course_year()
		{
			return course_year;
		}
		
		public void set_course_lecturer(String name)
		{
			lecturer=name;
		}
		
		public void set_course_checker(String name)
		{
			checker=name;
		}
		
		public String get_course_lecturer()
		{
			return lecturer;
		}
		
		public String get_course_checker()
		{
			return checker;
		}
		
		public String get_course_name(int course_id)
		{
				if (course_id<0 || Courses_table.length<course_id)
					return null;
				
				return this.course_name;
		}
		
		public void add_student_to_course(int student_id)
		{
			int i;
			
			if(student_id<1) //invalid id
				return;
			
			for(i=0; i<NUM_OF_STUDENTS_IN_COURSE; i++)
			{
				if(this.students_in_course[i]==student_id) //if id is already in the course
				{
					System.out.println("the id is already in this course");
					return;
				}
				else if(this.students_in_course[i]==0)
				{
					this.students_in_course[i]=student_id;
					break;
				}
			}
		}
		
		public int[] get_students_list()
		{
			return students_in_course;
		}
		
		public int get_num_of_students_in_course() //num of students in course
		{
			for(int i=0; i<NUM_OF_STUDENTS_IN_COURSE; i++)
				if(this.students_in_course[i]==0)
					return i;
			
			return NUM_OF_STUDENTS_IN_COURSE;
		}
	}
}