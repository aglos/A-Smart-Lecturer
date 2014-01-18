package aglosh2014.appspot.com;


import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import javax.jdo.PersistenceManager;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
public final class DataStoreManager
 {
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    PersistenceManager pm = PMF.get().getPersistenceManager();
    private DataStoreManager() {}
    private static DataStoreManager instance = null;
    public static DataStoreManager getInstance()
    {
        if (instance == null)
            instance = new DataStoreManager();
        return instance;
    }
   
    
    public void insertNewCircle(Circle c){
    	pm.makePersistent(c);
    }
    
    public	void removeCircle(int circleId){


    	

    	Circle entity = pm.getObjectById(Circle.class, circleId);
    	pm.deletePersistent(entity);

    	
       pm.close();
    }
    

}