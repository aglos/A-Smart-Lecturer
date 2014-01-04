package aglosh2014.appspot.com;

public class Exercise {
	
	//properties
	private int exercise_id;
	private String exercise_title;
	private double exercise_avg;
	
	public Exercise(int new_id,String title)
	{
		this.exercise_id=new_id;
		this.exercise_title=title;
	}
	
	public int get_exercise_id()
	{
		return this.exercise_id;
	}
	
	public String get_exercise_title()
	{
		return this.exercise_title;
	}
	
	public double get_exercise_avg()
	{
		return exercise_avg;
	}
	
	public void set_exercise_avg(double new_avg)
	{
		if(new_avg<0)
			return;
		
		this.exercise_avg=new_avg;
	}

}
