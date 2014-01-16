package aglosh2014.appspot.com;

import java.util.ArrayList;

public class Circle {

        private int circle_id;
        private int circle_year;
        private String  circle_name;

        public ArrayList<Course> courses;

        public Circle(int id , String name, int year)
        {
                this.circle_id = id;
                this.circle_name = name;
                this.circle_year = year;

                courses = new ArrayList<>();
        }
        
        public int get_circle_year()
        {
                return this.circle_year;
        }

        public int get_circle_id()
        {
                return this.circle_id;
        }

        public String get_circle_name()
        {
                return this.circle_name;
        }
        
        public int get_num_of_courses_in_circle()
        {
                return courses.size();
        }

        public int get_course_id_by_name(String name)
        {
                for(Course course: courses)
                        if(name.equals(course.get_course_name()))
                                return course.get_course_id();
                
                return -1;
        }
        
        private int get_course_index_in_array(int course_id) //return -1 if not found
        {
                for(int i=0; i<courses.size(); i++)
                        if(course_id==courses.get(i).get_course_id())
                                return i;

                return -1;
        }

        public int add_new_course_to_circle(String course_name, int course_id, Lecturer lecturer, Checker checker)
        {
                //check if course already exist
                int course_index=get_course_index_in_array(course_id);

                if(course_index!=-1)
                        return 0; //course exist

                this.courses.add(new Course(course_name, course_id, lecturer, checker));
                
                if(lecturer!=null)
                        lecturer.add_circle(this);
                
                if(checker!=null)
                        checker.add_circle(this);

                return courses.size()-1; //course added
        }

        public Student[] get_student_list_in_course(int course_id)
        {
                int course_index=get_course_index_in_array(course_id);

                
                if(course_index==-1) //if not in courses
                        return null;        

                return courses.get(course_index).get_students_in_course();
        }
        
        public int[] get_student_id_list_in_course(int course_id)
        {
                int course_index=get_course_index_in_array(course_id);

                if(course_index==-1) //if not in courses
                        return null;
                
                Student students[]=courses.get(course_index).get_students_in_course();
                int students_id_list[]=new int[courses.get(course_index).get_num_of_students_in_course()];
                
                for(int i=0; i<courses.get(course_index).get_num_of_students_in_course(); i++)
                        students_id_list[i]=students[i].get_id();
                
                return students_id_list;

        }

        public int add_new_student_to_course(int course_id, Student student)
        {
                int course_index=get_course_index_in_array(course_id);

                if(course_index==-1)
                        return -1; //course doesn't exist
                

                int ret_val =  courses.get(course_index).add_student_to_course(student);

                if(ret_val==1) //if new student, add this circle to his circles list
                        student.add_circle(this);
                
                return ret_val;
        }

        public void set_course_lecturer(int course_id, Lecturer lecturer)
        {
                int course_index=get_course_index_in_array(course_id);

                if(course_index==-1)
                        return;
                
                if(lecturer!=null)
                        lecturer.add_circle(this);

                courses.get(course_index).set_course_lecturer(lecturer);
        }

        public void set_course_checker(int course_id, Checker checker)
        {
                int course_index=get_course_index_in_array(course_id);

                if(course_index==-1)
                        return;
                
                if(checker!=null)
                        checker.add_circle(this);

                courses.get(course_index).set_course_checker(checker);
        }

        public String get_course_lecturer_name(int course_id)
        {
                int course_index=get_course_index_in_array(course_id);

                if(course_index==-1)
                        return null;

                return courses.get(course_index).get_course_lecturer().get_name();
        }

        public String get_course_checker_name(int course_id)
        {
                int course_index=get_course_index_in_array(course_id);

                if(course_index==-1)
                        return null;

                return courses.get(course_index).get_course_checker().get_name();
        }

        public Course[] get_courses_in_circle()
        {
                Course[] array = courses.toArray(new Course[courses.size()]);
                return array;
        }
        
        public String get_courses_in_circle_as_string() //separated by comma ',' returns name & id, course1_name, course1_id
        {
                String list="";
                
                for(int i=0; i<courses.size(); i++)
                {
                        if(i!=0)
                                list+=","; //add comma
                        
                        list+=courses.get(i).get_course_name() + ",";
                        list+=courses.get(i).get_course_id();
                }
                
                return list;
        }
        
        public void remove_course_by_id(int course_id)
        {
        	for(Course course: courses)
        	{
        		if(course.get_course_id()==course_id)
        		{
        			course.remove_student_from_course();
        			courses.remove(course);
        			break;
        		}
        	}
        }
        
        public void remove_all_courses()
        {
        	for(Course course: courses)
        	{
        		course.remove_student_from_course();
        		courses.remove(course);
        	}
        }
        
}