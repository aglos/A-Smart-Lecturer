package aglosh2014.appspot.com;

public class Academy 
{	
	private String academy_name;

	public Circle circles[]; //list of circles in academy
	private int num_of_circles;
	private int max_num_of_circles_in_academy;

	private User users[];
	private int max_num_of_users_in_academy;
	private int num_of_users_in_academy;


	public Academy(String academy_name, int max_num_of_circles, int max_num_of_users)
	{
		this.academy_name=academy_name;

		this.max_num_of_users_in_academy=max_num_of_users;
		this.num_of_users_in_academy=0;

		this.max_num_of_circles_in_academy=max_num_of_circles;
		this.num_of_circles=0;
		
		users=new User[max_num_of_users];
		circles=new Circle[max_num_of_circles];
	}
	
	public String get_academy_name()
	{
		return academy_name;
	}
	
	public int get_num_of_users_in_academy()
	{
		return this.num_of_users_in_academy;
	}
	
	public int get_num_of_circles_in_academy()
	{
		return this.num_of_circles;
	}

	public Circle[] get_circles_in_academy()
	{
		return this.circles;
	}

	public String get_circles_in_academy_as_string() //separated by comma ","
	{
		String list="";

		for(int i=0; i<num_of_circles; i++)
		{
			if(i!=0)
				list+=","; //add comma

			list+=circles[i].get_circle_name();
		}

		return list;
	}
	
	public String get_courses_name_list_in_circle(int circle_id)
	{
		int circle_index=get_circle_index_in_array(circle_id);
		
		System.out.println(circle_index);
		
		if(circle_index==-1)
			return null;
		
		String courses = circles[circle_index].get_courses_in_circle_as_string();
		
		System.out.println("The courses are:" + courses);
		return courses;

	}
	
	public int[] get_students_id_in_course(int circle_id, int course_id)
	{
		int circle_index=get_circle_index_in_array(circle_id);
		
		if(circle_index==-1)
			return null;
		
		return circles[circle_index].get_student_id_list_in_course(course_id);
	}
	
	private int get_circle_index_in_array(int circle_id) //return -1 if not found
	{	
		for(int i=0; i<num_of_circles; i++)
			if(circle_id==circles[i].get_circle_id())
				return i;

		return -1;
	}
	
	public int add_new_circle_to_academy(int circle_id , String circle_name, int circle_year, int max_num_of_courses_in_circle) //return -1 if no room
	{
		if(this.num_of_circles>=max_num_of_circles_in_academy) //no more room for a new circle
			return -1;

		//check if course already exist
		int circle_index=get_circle_index_in_array(circle_id);
		
		if(circle_index!=-1)
			return 0; //circle exist

		this.circles[num_of_circles]=new Circle(circle_id, circle_name, circle_year, max_num_of_courses_in_circle);

		this.num_of_circles++;

		return 1; //course added
	}
	
	public Lecturer add_new_lecturer(int id, String name, String password, int num_of_Courses)
	{
		if(num_of_users_in_academy>=max_num_of_users_in_academy)
			return null;
		
		users[num_of_users_in_academy]=new Lecturer(id, name, password, num_of_Courses);
		
		
		return (Lecturer)users[num_of_users_in_academy++];
	}
	

	public Student add_new_student(int id, String name, String password, int num_of_Courses, int num_of_grades)
	{
		if(num_of_users_in_academy>=max_num_of_users_in_academy)
			return null;
		
		users[num_of_users_in_academy]=new Student(id, name, password, num_of_Courses, num_of_grades);
		
		return (Student)users[num_of_users_in_academy++];
	}
	

	public Checker add_new_checker(int id, String name, String password, int num_of_Courses)
	{
		if(num_of_users_in_academy>=max_num_of_users_in_academy)
			return null;
		
		users[num_of_users_in_academy]=new Checker(id, name, password, num_of_Courses);
		
		return (Checker)users[num_of_users_in_academy++];
	}
}
