package com.dao;

import com.entity.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author emi
 * this is SERVICEtype DAO
 */
public class ServiceDao {
    
    private Connection conn;

    public ServiceDao(Connection conn) {
        super();
        this.conn = conn;
    }
    
    //method
    public boolean addService(String type)
    {
        boolean f=false;
        try{
            String sql=" insert into service(type) values(?) ";
            PreparedStatement ps=conn.prepareStatement(sql);
            
            //sets the value of the first parameter in the SQL query to the value of the type parameter. 
            ps.setString(1, type);

            
            int i = ps.executeUpdate();
            if(i==1){
               f=true ;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    

    //method - list all service
    public List<Service> getAllService()
    {
        List<Service> list=new ArrayList<Service>();
        Service s=null;
        try{
            String sql="select * from service" ;
//            String sql="select * from service order by id" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
           //until there is no data
            while(rs.next()){
                s =new Service();
                      //  get data from SQL table and add to the list
                s.setId(rs.getInt(1));
                s.setType(rs.getString(2));
                list.add(s);
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

//    //method - get Service by id
    public Service getServiceById(int id)
    {
        Service s=null;
        try{
            String sql="select * from service where id=?" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
           //until there is no data
            while(rs.next()){
                s =new Service();
                      //  get data from SQL table and add to the list
                s.setId(rs.getInt(1));
                s.setType(rs.getString(2));

            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return s;
    }
    
//    //method update
//    public boolean updateService(Service s)
//    {
//        boolean f=false;
//        try{
//            String sql="update service set type=? where id=? ";
//            PreparedStatement ps=conn.prepareStatement(sql);
//            ps.setString(1, s.getType());
//            ps.setInt(2, s.getId());
//            
//            int i = ps.executeUpdate();
//            
//            if(i==1){
//               f=true ;
//            }
//            
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//        return f;
//    }
//    
//    //method delete
//    public boolean deleteService(int id){
//        
//        boolean f=false;
//        try{
//            
//            String sql="delete from service where id=?";
//            PreparedStatement ps=conn.prepareStatement(sql);
//            ps.setInt(1, id);
//            
//            int i = ps.executeUpdate();
//            
//            if(i==1){
//               f=true ;
//            }
//            
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//        return f;
//    }
    
//    //method login
//    public Mechanic login(String email, String password){
//        
//        Mechanic m =null;
//        try{
//            
//            String sql="select * from mechanic where email=? and password=?";
//            PreparedStatement ps=conn.prepareStatement(sql);
//            ps.setString(1, email);
//            ps.setString(2, password);
//            
//             ResultSet rs = ps.executeQuery();
//             while (rs.next())
//             { m=new Mechanic();
//                m.setId(rs.getInt(1));
//                m.setfName(rs.getString(2));
//                m.setsName(rs.getString(3));
//                m.setEmail(rs.getString(4));
//                m.setMobNo(rs.getString(5));
//                m.setPassword(rs.getString(6));
//                
//             
//                 
//             }
//            int i = ps.executeUpdate();
//            
//            if(i==1){
//              
//            }
//            
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//        return m;
    }