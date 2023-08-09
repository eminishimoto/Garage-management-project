package com.dao;

import com.entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * @author emi
 * this is CUSTOMER DAO
 */
public class CustomerDao {
    
    //attribures
    private Connection conn;

    //constructor
    public CustomerDao(Connection conn) {
        super();
        this.conn = conn;
    }

    
    //method-register
    public boolean register(Customer c)
    {
        boolean f=false;
        
        try {
            String sql = "insert into customer(fname,sname,email,password,mobno) values(?,?,?,?,?)";
                   
            //PreparedStatement = allows to write a dynamic and parametric query in SQL. 
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, c.getfName());
            ps.setString(2, c.getsName());
            ps.setString(3, c.getEmail());
            ps.setString(4, c.getPassword());
            ps.setString(5, c.getMobNo());
            
            int i = ps.executeUpdate();
            
            if (i ==1)
            {
               f=true; 
            }
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    //method-login
    public Customer login(String email,String password)
    {
        Customer c=null;
        try{
            String sql= "select * from customer where email=? and password=?" ;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                c=new Customer();
                c.setId(rs.getInt(1));
                c.setfName(rs.getString(2));
                c.setsName(rs.getString(3));
                c.setEmail(rs.getString(4));
                c.setMobNo(rs.getString(5));
                c.setPassword(rs.getString(6));
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return c;
    }
    
        //method - get Customer by id
    public Customer getCustomerById(int id)
    {
        Customer c=null;
        try{
            String sql="select * from customer where id=?" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
           //until there is no data
            while(rs.next()){
                c =new Customer();
                      //  get data from SQL table and add to the list
                c.setId(rs.getInt(1));
                c.setfName(rs.getString(2));
                c.setsName(rs.getString(3));
                c.setEmail(rs.getString(4));
                c.setPassword(rs.getString(5));
                 c.setMobNo(rs.getString(6));

            }
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return c;
    }
    

    // Check if the password is unique in the database for customer registration
    public boolean isUniquePassword(String password) {
        try {
            String sql = "SELECT COUNT(*) FROM customer WHERE password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
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

    // Register password validation
    public boolean isValidFormat(String password) {
        // Password must be a mix of Alphabets and Numbers with 6-8 characters.
        String regex = "^(?=.*[a-zA-Z].*)(?=.*\\d.*)[a-zA-Z\\d]{6,8}$";
        return Pattern.matches(regex, password);
    }
    
            //method - get all Customer
    public List<Customer> getAllCustomer()
    {   
        
          List<Customer> list=new ArrayList<Customer>();
       
          Customer c=null;
        try{
            String sql="select * from customer order by id" ;
            PreparedStatement ps =conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
           //until there is no data
            while(rs.next()){
                c =new Customer();
                      //  get data from SQL table and add to the list
                c.setId(rs.getInt(1));
                c.setfName(rs.getString(2));
                c.setsName(rs.getString(3));
                c.setEmail(rs.getString(4));
                c.setPassword(rs.getString(5));
                c.setMobNo(rs.getString(6));
                 
                 list.add(c); // Add the customer to the list
        }

            
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    // Method to get customers by ID
public List<Customer> getCustomersById(int id) {
    List<Customer> customerList = new ArrayList<Customer>(); // Use traditional syntax here
    try {
        String sql = "SELECT * FROM customer WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Customer customer = new Customer();
            customer.setId(rs.getInt("id"));
            customer.setfName(rs.getString("fname"));
            customer.setsName(rs.getString("sname"));
            customer.setEmail(rs.getString("email"));
            customer.setPassword(rs.getString("password"));
            customer.setMobNo(rs.getString("mobno"));
            customerList.add(customer);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return customerList;
}

}
