package aglosh2014.appspot.com;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class Academy 
{        
        private String academy_name;
        public ArrayList<Circle> circles; //list of circles in academy
        private ArrayList<User> users;

        public Academy(String academy_name)
        {
                this.academy_name=academy_name;

                users=new ArrayList<>();
                circles=new ArrayList<>();
        }

        public String get_academy_name()
        {
                return academy_name;
        }

        public int get_num_of_users_in_academy()
        {
                return users.size();
        }

        public int get_num_of_circles_in_academy()
        {
                return circles.size();
        }

        public Circle[] get_circles_in_academy() //returns an array of the circles (as objects)
        {
                Circle[] array = circles.toArray(new Circle[circles.size()]);
                return array;
        }

        public String get_circles_in_academy_as_string() //separated by comma "," returns: circle1_name, circle_id1,...
        {
                String list="";

                for(int i=0; i<circles.size(); i++)
                {
                        if(i!=0)
                                list+=","; //add comma

                        list+=circles.get(i).get_circle_name(); //adds circle name to string

                        list+="," + circles.get(i).get_circle_id(); //add circle id
                }

                return list;
        }


        public User get_user_by_id(int id)
        {
                for(int i=0; i<users.size(); i++)
                {
                        if(users.get(i).get_id()==id)
                                return users.get(i);
                        
                }

                return null;
        }


        public String get_circles_in_spec_year(int year) //returns circle1_name, circle1_id, ... 
        {
                String circles="";

                for(int i=0; i<this.circles.size(); i++)
                        if(this.circles.get(i).get_circle_year()==year){
                                circles+=this.circles.get(i).get_circle_name() + ","; //add name to string
                                circles+=this.circles.get(i).get_circle_id() + ","; //add id to string
                        }

                circles=circles.substring(0, circles.length()-1); //remove last ','

                return circles;
        }

        public int user_login(int user_id, String password) //returns user-type, otherwise -1
        {
                for(int i=0; i<users.size(); i++)
                {
                        if(users.get(i).get_id()==user_id)
                                if(users.get(i).valid_password(password))
                                        return users.get(i).get_user_type();
                }

                return -1;
        }

        public String get_user_name_by_id(int user_id)
        {
                User user=get_user_by_id(user_id);

                if(user!=null)
                        return user.get_name();

                return null;
        }

        public String get_courses_name_list_in_circle(int circle_id) //returns name & id, course1_name, course1_id
        {
                int circle_index=get_circle_index_in_array(circle_id);

                if(circle_index==-1)
                        return null;

                String courses = circles.get(circle_index).get_courses_in_circle_as_string();

                return courses;

        }

        public int[] get_students_id_in_course(int circle_id, int course_id)
        {
                int circle_index=get_circle_index_in_array(circle_id);

                System.out.println(circle_id + " " + course_id + " " + circle_index);

                if(circle_index==-1)
                        return null;

                return circles.get(circle_index).get_student_id_list_in_course(course_id);
        }
        
        public Student[] get_students_array_in_course(int circle_id, int course_id)
        {
                int circle_index=get_circle_index_in_array(circle_id);

                System.out.println(circle_id + " " + course_id + " " +circle_index);

                if(circle_index==-1)
                        return null;

                return circles.get(circle_index).get_student_list_in_course(course_id);
        }
        
        public String get_students_array_by_type(int user_type)
        {
        		String list="";
        		for (User user:users)
        		{
        			if(user!=null&&user.user_type==user_type)
        			{
        				 list+=user.name + ",";
        				
        			}
        		}
        		return list;
        }
        
        public String get_students_array()
        {
        		String list="";
        		for (User user:users)
        		{
        			if(user!=null)
        			{
        				 list+=user.name + ",";
        				
        			}
        		}
        		return list;
        }

        private int get_circle_index_in_array(int circle_id) //return -1 if not found
        {        
                for(int i=0; i<circles.size(); i++)
                        if(circle_id==circles.get(i).get_circle_id())
                                return i;

                return -1;
        }

        public int add_new_circle_to_academy(int circle_id , String circle_name, int circle_year) //return -1 if no room
        {
                int circle_index=get_circle_index_in_array(circle_id);

                if(circle_index!=-1)
                        return 0; //circle exist

                this.circles.add(new Circle(circle_id, circle_name, circle_year));

                return circles.size()-1; //course added
        }
        
        public int add_new_course_to_circle(int circle_id, String course_name, int course_id, Lecturer lecturer, Checker checker)
        {
                int circle_index=get_circle_index_in_array(circle_id);

                if(circle_index==-1)
                        return 0; //circle doesn't exist

                return this.circles.get(circle_index).add_new_course_to_circle(course_name, course_id, lecturer, checker);
        }
        
        public int add_new_course_to_circle_by_ids(int circle_id, String course_name, int course_id, int lecturer_id, int checker_id)
        {
                //check if lecturer and checker are valid
                User checker = get_user_by_id(checker_id);
                User lecturer = get_user_by_id(lecturer_id);
                
                //if invalid lecturer
                if(lecturer == null || lecturer.user_type!=User.LECTURER)
                        return -2; //invalid lecturer
                
                //if invalid checker
                if(checker == null || checker.user_type!=User.CHECKER)
                        return -3; //invalid cheker
                
                return add_new_course_to_circle(circle_id, course_name, course_id, (Lecturer)lecturer, (Checker)checker);
        }

        public int add_new_student_to_course(int circle_id, int course_id, Student student)
        {
                int circle_index=get_circle_index_in_array(circle_id);

                if(circle_index==-1)
                        return 0; //circle doesn't exist

                return this.circles.get(circle_index).add_new_student_to_course(course_id, student);
        }
/*        
        public int add_new_student_to_course_by_id(int circle_id, int course_id, int student_id)
        {
                int circle_index=get_circle_index_in_array(circle_id);

                if(circle_index==-1)
                        return 0; //circle doesn't exist

                
        }
*/
        public Lecturer add_new_lecturer(int id, String name, String password)
        {
                users.add(new Lecturer(id, name, password));

                return (Lecturer)users.get(users.size()-1);
        }

        public Admin add_new_admin(int id, String name, String password)
        {
                users.add(new Admin(id, name, password));

                return (Admin)users.get(users.size()-1);
        }

        public Student add_new_student(int id, String name, String password)
        {
                users.add(new Student(id, name, password));

                return (Student)users.get(users.size()-1);
        }


        public Checker add_new_checker(int id, String name, String password)
        {
                users.add(new Checker(id, name, password));

                return (Checker)users.get(users.size()-1);
        }

        public int[] get_circles_years()
        {
                if(circles.isEmpty())
                        return null;

                int years[]=new int[circles.size()];
                int next_year_index=0;
                boolean is_exist=false;

                for(int i=0; i<circles.size(); i++)
                {
                        int new_year=circles.get(i).get_circle_year(); //get year

                        for(int j=0; j<next_year_index; j++) //check if year 
                        {
                                if(new_year==years[j]) //if year already exist 
                                {
                                        is_exist=true;
                                        break;
                                }
                        }

                        if(is_exist==false)
                        {
                                years[next_year_index]=new_year;
                                next_year_index++;
                        }
                        else
                                is_exist=false;
                }

                int new_years[]=new int[next_year_index];

                for(int i=0; i< next_year_index; i++)
                        new_years[i]=years[i];

                Arrays.sort(new_years);

                return new_years;
        }

        public String get_circles_years_as_string()
        {
                int years[]=get_circles_years();

                if(years==null)
                        return null;

                String years_as_string="";

                for(int i=0; i<years.length; i++)
                        years_as_string+=years[i] + ",";

                years_as_string = years_as_string.substring(0, years_as_string.length()-1);

                return years_as_string;
        }

        public String get_user_data_by_id(int user_id) //stopped here
        {
                User user = get_user_by_id(user_id);

                String user_data="";

                ArrayList<Integer> years=get_user_years(user_id);
                ArrayList<Circle> circles=user.user_circles;
                ArrayList<Course> courses=user.user_courses;

                //add years, circle & courses to data
                for(int year: years) //for each year
                {
                        user_data+=year + "["; //add year

                        for(Circle circle: circles) //for each circle in user circles
                        {
                                if(circle.get_circle_year()!=year) //if circle not in year
                                        break;

                                //add circle
                                user_data+=circle.get_circle_name() + "," + circle.get_circle_id() + "("; //add circle

                                for(Course course: courses) //for each course in circle
                                {
                                        if(!circle.courses.contains(course)) //if course is not in circle
                                                break;

                                        //add course
                                        user_data+=course.get_course_name() + "," + course.get_course_id() + "|";
                                }

                                user_data=user_data.substring(0, user_data.length() -1); //remove last "|"
                                user_data+=")"; //end of circle
                        }

                        user_data+="]"; //end of year
                }

                return user_data;
        }

        public ArrayList<Integer> get_user_years(int user_id)
        {
                User user = get_user_by_id(user_id);
                
                if(user==null)
                        return null;
                
                ArrayList<Circle> circles=user.user_circles;

                ArrayList<Integer> years=new ArrayList<>();

                //add years
                for(Circle circle: circles) //list of all years
                {
                        if(!years.contains(circle.get_circle_year())) //if not in years list 
                        {
                                years.add(circle.get_circle_year()); //add year to years list
                        }
                }

                //sort years
                Collections.sort(years);

                return years;
        }
        
        public String get_user_years_as_string(int user_id)
        {
                ArrayList<Integer> years=get_user_years(user_id);
                
                if(years==null)
                        return "";
                
                String user_years="";
                
                for(int year: years)
                {
                        user_years+=year + ",";
                }
                
                if(!user_years.isEmpty())
                        user_years=user_years.substring(0, user_years.length() -1);
                
                return user_years;
        }
        
        public String get_user_circles_by_year(int user_id, int year)
        {
                User user = get_user_by_id(user_id);
                
                if(user==null)
                        return "";
                
                ArrayList<Circle> circles=user.user_circles;

                String user_circles="";
                
                for(Circle circle: circles) //for each circle in user circles
                {
                        if(circle.get_circle_year()==year) //if circle in year
                        {
                        //add circle
                        user_circles+=circle.get_circle_name() + "," + circle.get_circle_id() + ","; //add circle
                        }
                }
                
                if(!user_circles.isEmpty())
                        user_circles=user_circles.substring(0, user_circles.length()-1); //remove last comma

                return user_circles;
        }
        
        public String get_user_courses_in_circle_by_year(int user_id, int year, int circle_id)
        {
                User user = get_user_by_id(user_id);
                
                if(user==null)
                        return "";

                ArrayList<Circle> circles=user.user_circles;
                ArrayList<Course> courses=user.user_courses;

                String user_courses="";
                
                for(Circle circle: circles) //for each circle in user circles
                {
                        if(circle.get_circle_year()==year && circle.get_circle_id()==circle_id) //if circle in year
                        {
                                for(Course course: courses)
                                {
                                        user_courses+=course.get_course_name() + "," + course.get_course_id() + ",";
                                }
                                
                                break;
                        }
                }
                
                if(!user_courses.isEmpty())
                                user_courses=user_courses.substring(0, user_courses.length() - 1); //remove last comma
                
                return user_courses;
        }

        public void remove_circle_by_id(int circle_id)
        {
        	
        	for(Circle circle: circles)
        	{
        		if(circle!=null&&circle.get_circle_id()==circle_id)
        		{
        			
        			//circle.remove_all_courses();
        			if(circles!=null)
        				circles.remove(circle);
        			break;
        		}
        	}
        }
        
     
        public void remove_course(int course_id, int circle_id)
        {
        	for( Circle circle: circles)
        	{
        		if(circle!=null&&circle.get_circle_id()==circle_id)
        		{
        			circle.remove_course_by_id(course_id);
        			break;	
        		}
        	}
       	}
}
