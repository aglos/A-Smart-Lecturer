package aglosh2014.appspot.com;

public class Exercises_grades {
public static final int LENGTH = 5;
	
	private int grades_of_student[][] = new int[2][LENGTH];
	private int course_id;
	private int circle_id;
	private String year;
	
	public Exercises_grades(int circle_id, int course_id, String year)
	{
		this.circle_id = circle_id;
		this.course_id = course_id;
		this.year = year;
		
	}
	
	public void set_student_grades(int students[] , int grades[])
	{
		int i = 0;
		
		for(i = 0; i < LENGTH; i++)
		{
			 grades_of_student[0][i] = students[i];
			 grades_of_student[1][i] = grades[i];
		}
		
	}
	
	public int[][] get_student_grade(int circle_id, int course_id, String year)
	{
		if(this.circle_id != circle_id || this.course_id != course_id || this.year.equalsIgnoreCase(year))
			return  new int[1][1];
		return grades_of_student;
	}
	
}

