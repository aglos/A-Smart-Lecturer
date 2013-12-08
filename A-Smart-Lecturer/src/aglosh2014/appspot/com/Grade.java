package aglosh2014.appspot.com;

public class Grade {

	private Exercise ex;
	private int grade;
	
	public Grade(Exercise ex)
	{
		this.ex = ex;
		grade = 0;
	}
	
	public int get_grade()
	{
		return grade;
	}
	
	public void set_grade(int grade)
	{
		this.grade = grade;
	}
	
	public Exercise get_exercise()
	{
		return ex;
	}
	
	
	
	
}
