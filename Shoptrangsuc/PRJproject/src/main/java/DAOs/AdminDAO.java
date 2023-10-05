/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;


import Models.Admin;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ddand
 */
public class AdminDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AdminDAO() {
        conn = DBConnection.DBConnection.getConnection();
    }
    
    public String hashPassword(String password, String algorithm) {
        try {
            MessageDigest digest = MessageDigest.getInstance(algorithm);
            byte[] hashedBytes = digest.digest(password.getBytes());

            StringBuilder stringBuilder = new StringBuilder();
            for (byte b : hashedBytes) {
                stringBuilder.append(String.format("%02x", b));
            }

            return stringBuilder.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Admin GetAdmin(String email) {
        Admin ad = new Admin();
        try {
            ps = conn.prepareStatement("select * from QuanLyVien where email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                ad = new Admin(rs.getInt("maadmin"), rs.getString("hoten"), rs.getString("email"), rs.getString("password"),
                        rs.getString("gioitinh"), rs.getDate("ngaysinh"), rs.getString("diachi"), rs.getString("dienthoai"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ad;
    }

    public Admin GetAdminid(String id) {
        Admin ad = new Admin();
        try {
            ps = conn.prepareStatement("select * from QuanLyVien where makhachhang=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                ad = new Admin(rs.getInt("makhachhang"), rs.getString("hoten"), rs.getString("email"), rs.getString("password"),
                        rs.getString("gioitinh"), rs.getDate("ngaysinh"), rs.getString("diachi"), rs.getString("dienthoai"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ad;
    }
    
    public boolean Login(Admin ad) throws SQLException {
        ResultSet rs = null;
        String sql = "Select * from QuanLyVien where email = ? and password=?";
        String password = ad.getPassword();
        String hashPassword = hashPassword(password, "MD5");
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, ad.getEmail());
            ps.setString(2, hashPassword);
            rs = ps.executeQuery();
        } catch (Exception e) {

        }

        return rs.next();
    }
}
