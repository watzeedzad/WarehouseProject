/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package int303.project.model;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author jiraw
 */
public class BestSeller {

    long prodId;
    String prodName;
    int prodAmount;
    double prodPrice;
    String branchName;
    String prodType;
    String companyName;
    boolean cancelStatus;

    public BestSeller(ResultSet rs) throws SQLException {
        this.prodId = rs.getLong("prod.PROD_ID");
        this.prodName = rs.getString("prod.PROD_NAME");
        this.prodPrice = rs.getDouble("prod.PRICE");
        this.prodAmount = rs.getInt("amountSum");
        this.branchName = rs.getString("b.BRANCH_NAME");
        this.prodType = rs.getString("prod.PROD_TYPE");
        this.companyName = rs.getString("com.COMPANY_NAME");
        this.cancelStatus = rs.getBoolean("prods.CANCLE_STATUS");
    }

    public long getProdId() {
        return prodId;
    }

    public void setProdId(long prodId) {
        this.prodId = prodId;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public int getProdAmount() {
        return prodAmount;
    }

    public void setProdAmount(int prodAmount) {
        this.prodAmount = prodAmount;
    }

    public double getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(double prodPrice) {
        this.prodPrice = prodPrice;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getProdType() {
        return prodType;
    }

    public void setProdType(String prodType) {
        this.prodType = prodType;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public boolean isCancelStatus() {
        return cancelStatus;
    }

    public void setCancelStatus(boolean cancelStatus) {
        this.cancelStatus = cancelStatus;
    }

}
