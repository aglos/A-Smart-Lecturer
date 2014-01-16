package aglosh2014.appspot.com;

public class Grade {

	private Exercise ex;
	private int ex_id;
	private int grade;
	
	public Grade(Exercise ex)
	{
		this.ex = ex;
		this.ex_id = ex.get_exercise_id();
		grade = 0;
	}
	
	public Grade(int Exercise_id)
	{
		this.ex_id=Exercise_id;
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
	
	public int get_exercise_id()
	{
		return ex_id;
	}
	
	
	
	
}
