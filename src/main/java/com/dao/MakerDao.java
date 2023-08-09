package com.dao;

import com.entity.Maker;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author emi
 * this is VehicleMAKER DAO
 */
public class MakerDao {
    
    private Connection conn;

    public MakerDao(Connection conn) {
        super();
        this.conn = conn;
        
    }
    
         //method
    public boolean registerMaker(String maker)
            
    {
        boolean f=false;
        try{
            String sql=" insert into maker(maker) values(?) ";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, maker);


            
            int i = ps.executeUpdate();
            if(i==1){
               f=true ;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    

    //method - list all maker
    public List<Maker> getAllMaker()
    {
        List<Maker> list=new ArrayList<Maker>();
        Maker m=null;
        try{
            String sql="select * from maker" ;
//            String sql="select * from service order by id" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
           //until there is no data
            while(rs.next()){
                m =new Maker();
                      //  get data from SQL table and add to the list
                m.setId(rs.getInt(1));
                m.setMaker(rs.getString(2));
                list.add(m);
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
