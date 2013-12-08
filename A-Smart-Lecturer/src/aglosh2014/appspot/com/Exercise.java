package aglosh2014.appspot.com;

public class Exercise {
	
	//properties
	private int exercise_id;
	private double exercise_avg;
	
	public Exercise(int new_id)
	{
		this.exercise_id=new_id;
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
