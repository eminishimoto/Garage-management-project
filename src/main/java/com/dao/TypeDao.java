package com.dao;

import com.entity.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author emi
 * this is VehicleTYPE DAO
 */
public class TypeDao {
    
    private Connection conn;

    public TypeDao(Connection conn) {
        super();
        this.conn = conn;
    
}
     //method
    public boolean registerType(String type)
            
    {
        boolean f=false;
        try{
            String sql=" insert into type(type) values(?) ";
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
    

    //method - list all Type
    public List<Type> getAllType()
    {
        List<Type> list=new ArrayList<Type>();
        Type t=null;
        try{
            String sql="select * from type" ;
//            String sql="select * from type order by id" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
           //until there is no data
            while(rs.next()){
                t =new Type();
                      //  get data from SQL table and add to the list
                t.setId(rs.getInt(1));
                t.setType(rs.getString(2));
                list.add(t);
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
// In TypeDao class
public Type getTypeById(int typeId) {
    Type type = null;
    try {
        String sql = "SELECT * FROM type WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, typeId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            type = new Type();
            type.setId(rs.getInt("id"));
            type.setType(rs.getString("type"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return type;
}
}


