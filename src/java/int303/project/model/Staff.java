/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jiraw
 */
public class Staff {

    private int staffId;
    private int companyId;
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
        this.citizenNo = rs.getBigDecimal("CITIZENNO").longValue();
        this.address = rs.getString("ADDRESS");
        this.position = rs.getString("POSITION");
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

    public static final String VIEW_STAFF_SQL = "SELECT * FROM STAFF WHERE STAFF_ID = ?";

    public static Staff viewStaffData(int staffId) {
        Staff s = null;
        try {
            Connection conn = ConnectionBuilderMySql.getConnection();
            PreparedStatement pstm = conn.prepareStatement(VIEW_STAFF_SQL);
            pstm.setInt(1, staffId);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                s = new Staff(rs);
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        } catch (ClassNotFoundException ex) {
            System.err.println(ex);
        }

        return s;
    }
}
