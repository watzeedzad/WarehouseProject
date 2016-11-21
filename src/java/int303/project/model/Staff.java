/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jiraw
 */
public class Staff {

    private int staffId;
    private int companyId;
    private Company company;
    private String firstname;
    private String lastname;
    private long citizenNo;
    private String address;
    private String position;

    public Staff(ResultSet rs) throws SQLException {
        this.staffId = rs.getInt("STAFF_ID");
        this.companyId = rs.getInt("COMPANY_ID");
        this.firstname = rs.getString("FIRSTNAME");
        this.lastname = rs.getString("LASTNAME");
        this.citizenNo = rs.getLong("CITIZENNO");
        this.address = rs.getString("ADDRESS");
        this.position = rs.getString("POSITION");
        this.company = Company.getCompany(rs.getInt("COMPANY_ID"));
    }

    public Staff() {

    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public long getCitizenNo() {
        return citizenNo;
    }

    public void setCitizenNo(long citizenNo) {
        this.citizenNo = citizenNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }        

    public static final String VIEW_STAFF_SQL = "SELECT * FROM STAFFS WHERE STAFF_ID = ?";

    public static Staff viewStaffData(int staffId) {
        Staff s = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement(VIEW_STAFF_SQL);
            pstm.setInt(1, staffId);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                s = new Staff(rs);
            }
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return s;
    }

    public static final String EDIT_STAFF_SQL = "UPDATE STAFFS SET FIRSTNAME = ?, LASTNAME = ?, ADDRESS = ? WHERE STAFF_ID = ?";

    public static void editStaff(String fName, String lName, String address, int staffId) {
        
        try {
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement(EDIT_STAFF_SQL);
            pstm.setString(1, fName);
            pstm.setString(2, lName);
            pstm.setString(3, address);
            pstm.setInt(4, staffId);
            pstm.executeUpdate();
            conn.close();
            pstm.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
    }

    public static final String ADD_STAFF_SQL = "INSERT INTO STAFFS (COMPANY_ID, FIRSTNAME, LASTNAME, CITIZENNO, ADDRESS, POSITION)"
            + "VALUES(?,?,?,?,?,?)";

    public boolean addStaff(int companyId, String fName, String lName, long citizenNo, String address, String position) {
        int x=0;
        try {           
            Connection conn = ConnectionBuilder.getConnection();
            PreparedStatement pstm = conn.prepareStatement(ADD_STAFF_SQL,Statement.RETURN_GENERATED_KEYS);
            // ใส่Statement.RETURN_GENERATED_KEYS เพื่อขอเลข id             
            BigDecimal temp = null;
            temp = temp.valueOf(citizenNo);
            
            pstm.setInt(1, companyId);
            pstm.setString(2, fName);
            pstm.setString(3, lName);
            pstm.setBigDecimal(4, temp);
            pstm.setString(5, address);
            pstm.setString(6, position);
            x = pstm.executeUpdate(); // ถ้า insert สำเร็จจะ return ตัวเลขที่เป็นจำนวน row ที่ insert เข้าไป
                        
            ResultSet rs = pstm.getGeneratedKeys();
            rs.next();   
            
            this.setStaffId(rs.getInt(1)); // เอาเลขไอดีที่ได้มา set ให้Staff
            this.setCompanyId(companyId);
            this.setFirstname(fName);
            this.setLastname(lName);
            this.setCitizenNo(citizenNo);
            this.setAddress(address);
            this.setPosition(position);
            
            conn.close();
            pstm.close();
            rs.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }        
        return x>0;
    } 

    @Override
    public String toString() {
        return "Staff{" + "staffId=" + staffId + ", companyId=" + companyId + ", firstname=" + firstname + ", lastname=" + lastname + ", citizenNo=" + citizenNo + ", address=" + address + ", position=" + position + '}';
    }
    
    
}
