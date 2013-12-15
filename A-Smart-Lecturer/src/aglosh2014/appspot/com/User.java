package aglosh2014.appspot.com;

public class User {
	//user types
	public static final int STUDENT=1, LECTURER=2, CHECKER=3;
	
	public static final int MIN_NAME_LEGNTH=4;
	public static final int MIN_PASSWORD_LEGNTH=6;
	public static final int ID_LEGNTH=9; //if less than 9, put zeros

	protected int user_id;
	protected String password;
	protected String name;
	protected int user_type;	// '1 = student' '2 = lecturer' '3 = checker'
	
	public User(int id, String name, String password, int type)
	{
		//name verification
		if(name==null || name.isEmpty())
		{
			System.out.println("Please enter name.");
			return;
		}
		
		else if(name.length()<MIN_NAME_LEGNTH)
		{
			System.out.println("Min name legnth is: " + MIN_NAME_LEGNTH);
			return;
		}
		//password verification
		if(password==null || password.isEmpty())
		{
			System.out.println("Please enter password.");
			return;
		}
		else if(password.length()<MIN_PASSWORD_LEGNTH)
		{
			System.out.println("Min password legnth is: " + MIN_PASSWORD_LEGNTH);
			return;
		}
		//id verification
		if(id<0 || (Integer.toString(id)).length()!=ID_LEGNTH)
		{
			System.out.println("Illegal ID.");
			return;
		}
		//type verification
		if(user_type!=LECTURER && user_type!=CHECKER && user_type!=STUDENT)
		{
			System.out.println("User type is undifiend");
			return;
		}
		
		user_id = id;
		this.password = password;
		this.name = name;
		user_type = type;
	}
	
	public String get_name()
	{
		return name;
	}
	
	public int get_id()
	{
		return user_id;
	}
	
	public int get_user_type()
	{
		return user_type;
	}
	
	public String get_password()
	{
		return password;
	}
	
	public int valid_password(String pass)
	{
		if(this.password.equals(pass))
			return 0;
		
		return -1;
		
	}
	
}

