package com.dao;

import com.entity.Mechanic;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


/**
 * @author emi
 * this is MECHANIC DAO
 */
public class MechanicDao {
    private Connection conn;

    public MechanicDao(Connection conn) {
        super();
        this.conn = conn;
    }
    
    //method
    public boolean registerMechanic(Mechanic m)
    {
        boolean f=false;
        try{
            String sql=" insert into mechanic(fname,sname,email,mobno,password) values(?,?,?,?,?) ";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, m.getfName());
            ps.setString(2, m.getsName());
            ps.setString(3,m.getEmail());
            ps.setString(4,m.getMobNo());
            ps.setString(5,m.getPassword());
            
            int i = ps.executeUpdate();
            if(i==1){
               f=true ;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    //method - list all mechanic
    public List<Mechanic> getAllMechanic()
    {
        List<Mechanic> list=new ArrayList<Mechanic>();
        Mechanic m=null;
        try{
            String sql="select * from mechanic order by id" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
           //until there is no data
            while(rs.next()){
                m =new Mechanic();
                      //  get data from SQL table and add to the list
                m.setId(rs.getInt(1));
                m.setfName(rs.getString(2));
                m.setsName(rs.getString(3));
                m.setEmail(rs.getString(4));
                m.setMobNo(rs.getString(5));
                m.setPassword(rs.getString(6));
                list.add(m);
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //method - get mechanic by id
    public Mechanic getMechanicById(int id)
    {
        Mechanic m=null;
        try{
            String sql="select * from mechanic where id=?" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
           //until there is no data
            while(rs.next()){
                m =new Mechanic();
                      //  get data from SQL table and add to the list
                m.setId(rs.getInt(1));
                m.setfName(rs.getString(2));
                m.setsName(rs.getString(3));
                m.setEmail(rs.getString(4));
                m.setMobNo(rs.getString(5));
                m.setPassword(rs.getString(6));

            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return m;
    }
    
    //method update
    public boolean updateMechanic(Mechanic m)
    {
        boolean f=false;
        try{
            String sql="update mechanic set fname=?,sname=?,email=?,mobno=?,password=? where id=? ";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, m.getfName());
            ps.setString(2, m.getsName());
            ps.setString(3,m.getEmail());
            ps.setString(4,m.getMobNo());
            ps.setString(5,m.getPassword());
            ps.setInt(6, m.getId());
            
            int i = ps.executeUpdate();
            
            if(i==1){
               f=true ;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    //method delete
    public boolean deleteMechanic(int id){
        
        boolean f=false;
        try{
            
            String sql="delete from mechanic where id=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1, id);
            
            int i = ps.executeUpdate();
            
            if(i==1){
               f=true ;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    //method login
    public Mechanic login(String email, String password){
        
        Mechanic m =null;
        try{
            
            String sql="select * from mechanic where email=? and password=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            
             ResultSet rs = ps.executeQuery();
             while (rs.next())
             { m=new Mechanic();
                m.setId(rs.getInt(1));
                m.setfName(rs.getString(2));
                m.setsName(rs.getString(3));
                m.setEmail(rs.getString(4));
                m.setMobNo(rs.getString(5));
                m.setPassword(rs.getString(6));
                
             
                 
             }
            int i = ps.executeUpdate();
            
            if(i==1){
              
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return m;
    }
}
