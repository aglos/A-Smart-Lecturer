package aglosh2014.appspot.com;

import java.util.ArrayList;

public class Course 
{
        private String course_name;
        private int course_id;
        private Lecturer course_lecturer;
        private Checker course_checker;
        public ArrayList<Student> students_in_course;
        public ArrayList<Exercise> exercises_in_course;
        private ArrayList<Integer> total;
        
        public Course(String course_name, int course_id, Lecturer lecturer, Checker checker)
        {
                this.course_id=course_id;
                this.course_name=course_name;
                
                set_course_checker(checker);
                set_course_lecturer(lecturer);
                
                this.exercises_in_course=new ArrayList<>();
                this.students_in_course=new ArrayList<>();
                this.total=new ArrayList<>();
        }
        
        public void set_course_lecturer(Lecturer lecturer)
        {
                if(lecturer==null)
                        return;
                
                lecturer.add_course(this);
                
                this.course_lecturer=lecturer;
        }
        
        public void set_course_checker(Checker checker)
        {
                if(checker==null)
                        return;
                
                checker.add_course(this);
                
                this.course_checker=checker;
        }
        
        public Lecturer get_course_lecturer()
        {
                return this.course_lecturer;
        }
        
        public Checker get_course_checker()
        {
                return this.course_checker;
        }
        
        public String get_course_name()
        {
                return this.course_name;
        }
        
        public int get_course_id()
        {
                return this.course_id;
        }
        
        public int[] get_course_total()
        {
                int[] ret = new int[total.size()];
            for (int i=0; i < ret.length; i++)
            {
                ret[i] = total.get(i).intValue();
            }
            return ret;
        }
        
        public void set_course_total(int[] array)
        {
                for (int i = 0; i < array.length; i++)
            {
                total.add(array[i]);
            }

        }
        
        public int add_student_to_course(Student student) //return -1 if no room, return 0 if already in course, return 1 if added to course
        {
                if(student==null) //if null or no more room in course
                        return -1;
                
                //check if student is already in course
                if(students_in_course.contains(student))
                        return 0;
                
                //add student
                students_in_course.add(student);
                student.user_courses.add(this);
                
                return 1;
        }
        
        public Student[] get_students_in_course()
        {
                Student[] array = students_in_course.toArray(new Student[students_in_course.size()]);
                return array;
        }
        
        public int get_num_of_students_in_course()
        {
                return students_in_course.size();
        }
        
        public Exercise[] get_exercises_in_course()
        {
                Exercise[] array = exercises_in_course.toArray(new Exercise[exercises_in_course.size()]);
                return array;
        }
        
        public int add_new_exercise_to_course(String title,boolean checked) //return -1 if no more room for exercises, return 0 if added
        {
                exercises_in_course.add(new Exercise(exercises_in_course.size(), title,checked));
                
                return exercises_in_course.size()-1;
        }

		
		public void remove_student_from_course()
		{
		   	for (Student student: students_in_course)
			{
		   		if (student!=null)
		   			student.user_courses.remove(this);
			}
		}
}