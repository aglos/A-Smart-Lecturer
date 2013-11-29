package aglosh2014.appspot.com;

public class Courses {

//this class represent a list of courses & a course object
 static final int NUM_OF_STUDENTS_IN_COURSE=20;
	
	static public int new_course_id; //next course to be created
	public Course Courses_table[]; //list of courses
	
	public Courses(int num_of_courses) //creates a new list of courses the size of n
	{
		if(num_of_courses<1)
			return;
		
		Courses_table=new Course[num_of_courses];
		new_course_id=0;
	}
	
	public int add_new_course(String course_name, String course_year) //add new course to list
	{
		if (new_course_id>=Courses_table.length)
		{
			System.out.println("max number of courses is reached, did not create a new course!");
			return -1;
		}
		
		int temp=new_course_id; //course id
		
		Courses_table[new_course_id]=new Course(course_name, course_year); //create new course
		
		if(Courses_table[temp]==null) //if not created
		{
			System.out.println("No string for course name");
			return -1;
		}
		
		return Courses_table[new_course_id-1].course_id; //return new course id
	}
	
	public String get_course_name(int id)
	{
		return Courses_table[id].get_course_name(id);
	}
	
	public class Course {
		private String course_name;
		private int course_id;
		private String course_year;
		private int students_in_course[];
		
		public Course(String course_name, String year)
		{
			if (course_name.equals("") || year.equals(""))
				return;
			
			this.course_name=course_name;
			this.course_id=new_course_id++;
			this.course_year=year;
			
			students_in_course=new int[NUM_OF_STUDENTS_IN_COURSE];
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