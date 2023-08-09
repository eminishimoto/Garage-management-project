package com.dao;

import com.entity.Type;
import com.entity.Vehicle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;


/**
 * @author emi
 * this is VEHICLE DAO
 */

//idver

public class VehicleDao {
    private Connection conn;

    public VehicleDao(Connection conn) {
        super();
        this.conn = conn;
        
    }
    
    
    // Method to register a vehicle in the database
    public boolean registerVehicle(Vehicle v) {
        boolean f=false;
     
        try {
            String sql = "INSERT INTO vehicle (cus_id,type_id, maker_id, licence_detail, eng_id) VALUES (?, ?, ?, ?, ?)";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, v.getCusId());
            ps.setInt(2, v.getTypeId());
            ps.setInt(3, v.getMakerId());
            ps.setString(4, v.getLicenceDetail());
            ps.setInt(5, v.getEngId());
            

            
            int i = ps.executeUpdate();
            if(i==1){
               f=true ;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        
        }
        return f;
    }
    
    
    //method - list all Veichle
    public List<Vehicle> getAllVehicle()
    {
        List<Vehicle> list=new ArrayList<Vehicle>();
        Vehicle v=null;
        try{
            String sql="select * from vehicle " ;
//            String sql="select * from Vehicle order by id" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
           //until there is no data
            while(rs.next()){
                v =new Vehicle();
                      //  get data from SQL table and add to the list
                v.setId(rs.getInt(1));
                v.setCusId(rs.getInt(2));
                v.setTypeId(rs.getInt(3));
                v.setMakerId(rs.getInt(4));
                v.setLicenceDetail(rs.getString(5));
                v.setEngId(rs.getInt(6));
                list.add(v);
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
        //method - get Vehicle by customer id
//    public Vehicle getVehicleByCusId(int cusId)
//    {
//        Vehicle v=null;
//        try{
//            String sql="select * from vehicle where cus_id=?" ;
//            PreparedStatement ps =conn.prepareStatement(sql);
//            ps.setInt(1, cusId);
//            ResultSet rs = ps.executeQuery();
//            
//           //until there is no data
//            while(rs.next()){
//                v =new Vehicle();
//                      //  get data from SQL table and add to the list
//                v.setId(rs.getInt(1));
//                v.setCusId(rs.getInt(2));
//                v.setTypeId(rs.getInt(3));
//                v.setMakerId(rs.getInt(4));
//                v.setLicenceDetail(rs.getInt(5));
//                v.setEngId(rs.getInt(6));
//
//            }
//            
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return v;
//    }
//}
    
//chatGPT suggestion
public List<Vehicle> getVehiclesByCusId(int cusId) {
    List<Vehicle> vlist = new ArrayList<Vehicle>();
    try {
        String sql = "SELECT * FROM vehicle WHERE cus_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, cusId);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            Vehicle v = new Vehicle();
            v.setId(rs.getInt(1));
            v.setCusId(rs.getInt(2));
            v.setTypeId(rs.getInt(3));
            v.setMakerId(rs.getInt(4));
            v.setLicenceDetail(rs.getString(5));
            v.setEngId(rs.getInt(6));
            vlist.add(v);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return vlist;
}

    // Method to get the vehicle type by typeId
    public Type getTypeById(int typeId) {
        TypeDao typeDao = new TypeDao(conn);
        return typeDao.getTypeById(typeId);
    }
    
    //get vehicle info by vehicle iD
    public Vehicle getVehicleById(int id) {
    Vehicle vehicle = null;
    try {
        String sql = "SELECT * FROM vehicle WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            vehicle = new Vehicle();
            vehicle.setId(rs.getInt("id"));
            vehicle.setCusId(rs.getInt("cus_id"));
            vehicle.setTypeId(rs.getInt("type_id"));
            vehicle.setMakerId(rs.getInt("maker_id"));
            vehicle.setLicenceDetail(rs.getString("licence_detail"));
            vehicle.setEngId(rs.getInt("eng_id"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return vehicle;
}
  

       
         public boolean isUniqueLicenceDetail(String licenceDetail) {
        try {                                                   //sql name??
            String sql = "SELECT COUNT(*) FROM vehicle WHERE licence_detail=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, licenceDetail);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count == 0; // If count is 0, the password is unique
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Return false if there's an error or password is not unique
    }
   
       // Method to validate the licenceDetail format
    public boolean isValidFormat(String licenceDetail) {
        // licenceDetailmust have first 2 letters as numbers, then alphabets, and last 4 as numbers (total 7 letters).
        String regex = "\\d{2}[A-Za-z]{1}\\d{4}";
        return Pattern.matches(regex, licenceDetail);
    }

}



//public class VehicleDao {
//    private Connection conn;
//
//    public VehicleDao(Connection conn) {
//        super();
//        this.conn = conn;
//        
//    }
//    
//    
//    // Method to register a vehicle in the database
////    public boolean registerVehicle(Vehicle v) 
////    {
////        
////        String sql = "INSERT INTO vehicle (type, maker, licence_detail, engine) VALUES (?, ?, ?, ?)";
////        
////         boolean f=false;
////        try (PreparedStatement ps = conn.prepareStatement(sql)) {
////            ps.setString(1, v.getType());
////            ps.setString(2, v.getMaker());
////            ps.setString(3, v.getLicenceDetail());
////            ps.setString(4, v.getEngine());
////
////            
////            int i = ps.executeUpdate();
////            if(i==1){
////               f=true ;
////            }
////            
////        }catch(Exception e){
////            e.printStackTrace();
////        }
////        return f;
////    }
//    
//         //method
//    public boolean registerVehicle(String type, String maker,String licenceDetail,String engine)
//            
//    {
//        boolean f=false;
//        try{
//            String sql=" insert into veichle(type,maker,licence_detail,engine) values(?,?,?,?) ";
//            PreparedStatement ps=conn.prepareStatement(sql);
//            ps.setString(1, type);
//            ps.setString(2, maker);
//            ps.setString(3,licenceDetail);
//            ps.setString(4,engine);
//
//            
//            int i = ps.executeUpdate();
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
//
//    //method - list all Veichle
//    public List<Vehicle> getAllVehicle()
//    {
//        List<Vehicle> list=new ArrayList<Vehicle>();
//        Vehicle v=null;
//        try{
//            String sql="select * from vehicle" ;
////            String sql="select * from Vehicle order by id" ;
//            PreparedStatement ps =conn.prepareStatement(sql);
//            
//            ResultSet rs = ps.executeQuery();
//           //until there is no data
//            while(rs.next()){
//                v =new Vehicle();
//                      //  get data from SQL table and add to the list
//                v.setId(rs.getInt(1));
//                v.setType(rs.getString(2));
//                v.setMaker(rs.getString(3));
//                v.setLicenceDetail(rs.getString(4));
//                v.setEngine(rs.getString(5));
//                list.add(v);
//            }
//            
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return list;
//    }
//}
