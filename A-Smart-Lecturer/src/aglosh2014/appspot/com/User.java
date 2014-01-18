package aglosh2014.appspot.com;

import java.util.ArrayList;

public class User {
        //user types
        public static final int STUDENT=1, LECTURER=2, CHECKER=3, ADMIN=4;
        
        public static final int MIN_NAME_LEGNTH=4;
        public static final int MIN_PASSWORD_LEGNTH=6;
        public static final int ID_LEGNTH=9; //if less than 9, put zeros

        public ArrayList<Circle> user_circles;
        public ArrayList<Course> user_courses;
        
        protected int user_id;
        protected String password;
        protected String name;
        protected int user_type;        // '1 = student' '2 = lecturer' '3 = checker'
        
        public User(int id, String name, String password, int type)
        {
                //name verification
                if(name==null || name.isEmpty())
                {
                        System.out.println("Please enter name.");
                       
                }
                
                else if(name.length()<MIN_NAME_LEGNTH)
                {
                        System.out.println("Min name legnth is: " + MIN_NAME_LEGNTH);
                     
                }
                //password verification
                if(password==null || password.isEmpty())
                {
                        System.out.println("Please enter password.");
                     
                }
                else if(password.length()<MIN_PASSWORD_LEGNTH)
                {
                        System.out.println("Min password legnth is: " + MIN_PASSWORD_LEGNTH);
                       
                }
                //id verification
                if(id<0 || (Integer.toString(id)).length()!=ID_LEGNTH)
                {
                        System.out.println("Illegal ID.");
                      
                }
                //type verification
                if(type!=LECTURER && type!=CHECKER && type!=STUDENT &&type!=ADMIN)
                {
                        System.out.println("User type: " + user_type + " is undifiend");
                      
                }
                
                user_id = id;
                this.password = password;
                this.name = name;
                user_type = type;
                
                user_circles=new ArrayList<>(); //create new circles list
                user_courses=new ArrayList<>();
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
        
        public boolean valid_password(String pass)
        {
                
                if(this.password.equals(pass))
                        return true;

                return false;
                
        }
        
        public void add_circle(Circle circle)
        {
                if(!user_circles.contains(circle)) //if user dont have that cirlce
                        user_circles.add(circle);
        }
        
        public void add_course(Course course)
        {
                if(!user_courses.contains(course)) //if user dont have that course
                        user_courses.add(course);
        }
        
}