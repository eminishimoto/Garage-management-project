package com.dao;
//DAO=Data Access Object pattern: separates a data resource's client interface from its data access mechanisms. 

import com.entity.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author emi
 * this is BOOKING DAO
 */
public class BookingDao {
        //attribures
    private Connection conn;
    
        //constructor
    public BookingDao(Connection conn) {
        super();
        this.conn = conn;
    }
    
    //method
    public boolean addBooking( Booking b) throws SQLException{
        
        boolean f = false;
        try{
            String sql=" insert into booking(cus_id,vehi_id,date,mecha_id,status_id,service_id,comment) values(?,?,?,?,?,?,?) ";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1, b.getCusId());
            ps.setInt(2, b.getVehiId());
            ps.setString(3, b.getDate());
            ps.setInt(4, b.getMechaId());
            ps.setInt(5, b.getStatusId());
            ps.setInt(6, b.getServiceId());
            ps.setString(7, b.getComment());

            
            int i = ps.executeUpdate();
            if(i==1){
               f=true ;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
        
    }
    // by login customer
    public List<Booking> getAllBookingByLoginCustomer(int cusId) {
		List<Booking> list = new ArrayList<Booking>();
		Booking b = null;

		try {

			String sql = "select * from booking where cus_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cusId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Booking();
				b.setId(rs.getInt(1));
				b.setCusId(rs.getInt(2));
				b.setVehiId(rs.getInt(3));
				b.setDate(rs.getString(4));
                                b.setMechaId(rs.getInt(5));
                                b.setStatusId(rs.getInt(6));
				b.setServiceId(rs.getInt(7));
                                b.setComment(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
    // by week
    
    public List<Booking> getAllBookingByWeek(String startDate, String endDate) {
    List<Booking> list = new ArrayList<Booking>();

    try {
        String sql = "SELECT * FROM booking WHERE date BETWEEN ? AND ? ORDER BY date ASC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, startDate);
        ps.setString(2, endDate);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Booking b = new Booking();
            b.setId(rs.getInt(1));
            b.setCusId(rs.getInt(2));
            b.setVehiId(rs.getInt(3));
            b.setDate(rs.getString(4));
            b.setMechaId(rs.getInt(5));
            b.setStatusId(rs.getInt(6));
            b.setServiceId(rs.getInt(7));
            b.setComment(rs.getString(8));

            list.add(b);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
    


    //by login mechanic
        public List<Booking> getAllBookingByLoginMechanic(int mechaId) {
		List<Booking> list = new ArrayList<Booking>();
		Booking b = null;

		try {

			String sql = "select * from booking where mecha_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, mechaId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Booking();
				b.setId(rs.getInt(1));
				b.setCusId(rs.getInt(2));
				b.setVehiId(rs.getInt(3));
				b.setDate(rs.getString(4));
                                b.setMechaId(rs.getInt(5));
                                b.setStatusId(rs.getInt(6));
				b.setServiceId(rs.getInt(7));
                                b.setComment(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        

    //booking info by id
        public Booking getBookingById(int id) {
	
            Booking b = null;
		try {
			String sql = "select * from booking where id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Booking();
                                
				b.setId(rs.getInt(1));
				b.setCusId(rs.getInt(2));
				b.setVehiId(rs.getInt(3));
				b.setDate(rs.getString(4));
                                b.setMechaId(rs.getInt(5));
                                b.setStatusId(rs.getInt(6));
				b.setServiceId(rs.getInt(7));
                                b.setComment(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

     
     // check the date is avairable or not to book  
    public boolean isDateFullyBooked(String date) {
        try {
            String sql = "SELECT COUNT(*) FROM booking WHERE date = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, date);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count >= 1; // Replace MAX_CAPACITY with the maximum number of bookings allowed for a date
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
        //update booking status and assign mechanics   
       
    	public boolean manageBooking(int id, int mechaId, int statusId) {
		boolean f = false;
		try {
			String sql = "update booking set mecha_id=?, status_id=? where id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			
                        //The order of the parameters should match the order of the placeholders in the SQL query(above)!
			ps.setInt(1, mechaId);
			ps.setInt(2, statusId);
                        ps.setInt(3, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
        
       //by login mechanic
        public List<Booking> getAllBooking(int mechaId) {
		List<Booking> list = new ArrayList<Booking>();
		Booking b = null;

		try {
			String sql = "select * from booking where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, mechaId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Booking();
				b.setId(rs.getInt(1));
				b.setCusId(rs.getInt(2));
				b.setVehiId(rs.getInt(3));
				b.setDate(rs.getString(4));
                                b.setMechaId(rs.getInt(5));
                                b.setStatusId(rs.getInt(6));
				b.setServiceId(rs.getInt(7));
                                b.setComment(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}  
        

}
     







