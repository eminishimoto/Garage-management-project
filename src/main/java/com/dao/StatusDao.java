package com.dao;

import com.entity.Status;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author emi
 *this is BOOKING STATUS DAO
 */
public class StatusDao {
    
        
    private Connection conn;

    public StatusDao(Connection conn) {
        super();
        this.conn = conn;
    
}
     //method
    public boolean addType(String status)
            
    {
        boolean f=false;
        try{
            String sql=" insert into status(status) values(?) ";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, status);


            
            int i = ps.executeUpdate();
            if(i==1){
               f=true ;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    

    //method - list all status
    public List<Status> getAllStatus()
    {
        List<Status> list=new ArrayList<Status>();
        Status s=null;
        try{
            String sql="select * from status" ;
//            String sql="select * from status order by id" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
           //until there is no data
            while(rs.next()){
                s =new Status();
                      //  get data from SQL table and add to the list
                s.setId(rs.getInt(1));
                s.setStatus(rs.getString(2));
                list.add(s);
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    //    //method - get Status by id
    public Status getStatusById(int id)
    {
        Status s=null;
        try{
            String sql="select * from status where id=?" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
           //until there is no data
            while(rs.next()){
                s =new Status();
                      //  get data from SQL table and add to the list
                s.setId(rs.getInt(1));
                s.setStatus(rs.getString(2));

            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return s;
    }
    
}
