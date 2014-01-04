package aglosh2014.appspot.com;

public class Exercise {
	
	//properties
	private int exercise_id;
	private String exercise_title;
	private double exercise_avg;
	private boolean checked;
	
	public Exercise(int new_id,String title, boolean checked)
	{
		this.exercise_id=new_id;
		this.exercise_title= new String(title);
		this.checked = checked;
	}
	
	public boolean is_checked()
	{
		if (this.checked==true)
			return true;
	
		return false;
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
