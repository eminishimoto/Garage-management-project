package com.dao;

import com.entity.Engine;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author emi
 * this is VehicleENGINE DAO
 */
public class EngineDao {
        private Connection conn;

    public EngineDao(Connection conn) {
        super();
        this.conn = conn;
    }
    
         //method
    public boolean registerEngine(String type)
            
    {
        boolean f=false;
        try{                        //table
            String sql=" insert into engine(type) values(?) ";
            PreparedStatement ps=conn.prepareStatement(sql);
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
    

    //method - list all Engine
    public List<Engine> getAllEngine()
    {
        List<Engine> list=new ArrayList<Engine>();
        Engine en=null;
        try{
            String sql="select * from engine" ;
//            String sql="select * from service order by id" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
           //until there is no data
            while(rs.next()){
                en =new Engine();
                      //  get data from SQL table and add to the list
                en.setId(rs.getInt(1));
                en.setType(rs.getString(2));
                list.add(en);
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }


}
