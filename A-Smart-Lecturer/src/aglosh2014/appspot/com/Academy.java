package aglosh2014.appspot.com;
import java.util.Arrays;

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
	
	public String get_circles_in_spec_year(int year)
	{
		String circles="";
		
		for(int i=0; i<num_of_circles; i++)
			if(this.circles[i].get_circle_year()==year)
				circles+=this.circles[i].get_circle_name() + ",";
		
		circles=circles.substring(0, circles.length()-1); //remove last ','
		
		return circles;
	}
	
	public int user_login(int user_id, String password) //returns user-type, otherwise -1
	{
		for(int i=0; i<num_of_users_in_academy; i++)
		{
			if(users[i].get_id()==user_id)
				if(users[i].valid_password(password))
					return users[i].get_user_type();
		}
		
		return -1;
	}
	
	public String get_user_name_by_id(int user_id)
	{
		for(int i=0; i<num_of_users_in_academy; i++)
		{
			if(users[i].get_id()==user_id)
				return users[i].get_name();
		}
		
		return null;
	}
	
	public String get_courses_name_list_in_circle(int circle_id)
	{
		int circle_index=get_circle_index_in_array(circle_id);
		
		System.out.println(circle_index);
		
		if(circle_index==-1)
			return null;
		
		String courses = circles[circle_index].get_courses_in_circle_as_string();
				
		return courses;

	}
	
	public int get_course_id_by_name_circle_and_year(String course_name, int circle_id, int year)
	{
		int circle_index=get_circle_index_in_array(circle_id);
		
		return circles[circle_index].get_course_id_by_name(course_name);
	}
	
	public int[] get_students_id_in_course(int circle_id, int course_id)
	{
		int circle_index=get_circle_index_in_array(circle_id);
		
		System.out.println(circle_id + " " + course_id);
		
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
	
	public int[] get_circles_years()
	{
		if(num_of_circles==0)
			return null;
		
		int years[]=new int[num_of_circles];
		int next_year_index=0;
		boolean is_exist=false;
		
		for(int i=0; i<num_of_circles; i++)
		{
			int new_year=circles[i].get_circle_year(); //get year
			
			for(int j=0; j<next_year_index; j++) //check if year 
			{
				if(new_year==years[j]) //if year already exist 
				{
					is_exist=true;
					break;
				}
			}
			
			if(is_exist==false)
			{
				years[next_year_index]=new_year;
				next_year_index++;
			}
			else
				is_exist=false;
		}
		
		int new_years[]=new int[next_year_index];
		
		for(int i=0; i< next_year_index; i++)
			new_years[i]=years[i];
		
		Arrays.sort(new_years);

		return new_years;
	}
	
	public String get_circles_years_as_string()
	{
		int years[]=get_circles_years();
		
		if(years==null)
			return null;
		
		String years_as_string="";
		
		for(int i=0; i<years.length; i++)
				years_as_string+=years[i] + ",";
		
		years_as_string = years_as_string.substring(0, years_as_string.length()-1);
		
		return years_as_string;
	}
	
	public int get_circle_id_by_name_and_year(String circle_name, int year)
	{
		for(int i=0; i<num_of_circles; i++)
			if(circle_name.equals(circles[i].get_circle_name()) && year==circles[i].get_circle_year())
				return circles[i].get_circle_id();
		
		return -1;
	}
	
}
