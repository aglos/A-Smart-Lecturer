package aglosh2014.appspot.com;

public class Users {

	protected int user_id;
	protected String password;
	protected String name;
	protected int user_type;	// '1 = student' '2 = lecturer' '3 = tester'
	
	public Users(int id, String password, String name, int type)
	{
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

