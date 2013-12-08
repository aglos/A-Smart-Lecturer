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

		this.circles[circle_index]=new Circle(circle_id, circle_name, circle_year, max_num_of_courses_in_circle);

		this.num_of_circles++;

		return 1; //course added
	}
	
	





}
