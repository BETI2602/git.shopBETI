/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.KhachHang;
import java.math.BigInteger;
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
public class KhachHangDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public KhachHangDAO() {
        conn = DBConnection.DBConnection.getConnection();
    }

    public ResultSet GetAll() {
        String sql = "select * from KhachHang";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
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

    public KhachHang GetKhachHang(String email) {
        KhachHang kh = new KhachHang();
        try {
            ps = conn.prepareStatement("select * from KhachHang where email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                kh = new KhachHang(rs.getInt("makhachhang"), rs.getString("hoten"), rs.getString("email"), rs.getString("password"),
                        rs.getString("gioitinh"), rs.getDate("ngaysinh"), rs.getString("diachi"), rs.getString("dienthoai"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kh;
    }

    public KhachHang GetKhachHangid(String id) {
        KhachHang kh = new KhachHang();
        try {
            ps = conn.prepareStatement("select * from KhachHang where makhachhang=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                kh = new KhachHang(rs.getInt("makhachhang"), rs.getString("hoten"), rs.getString("email"), rs.getString("password"),
                        rs.getString("gioitinh"), rs.getDate("ngaysinh"), rs.getString("diachi"), rs.getString("dienthoai"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kh;
    }

    public int AddNew(KhachHang kh) throws SQLException {
        String sql = "insert into KhachHang(email,[password],hoten,gioitinh,ngaysinh,diachi,dienthoai) values (?,?,?,?,?,?,?);";
        String password = kh.getPassword();
        String hashPassword = hashPassword(password, "MD5");
        int ketqua = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, kh.getEmail());
            ps.setString(2, hashPassword.toUpperCase());
            ps.setString(3, kh.getHoten());
            ps.setString(4, kh.getGioitinh());
            ps.setDate(5, kh.getNgaysinh());
            ps.setString(6, kh.getDiachi());
            ps.setString(7, kh.getDienthoai());

            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ketqua;
    }

    public boolean Login(KhachHang tk) throws SQLException {
        ResultSet rs = null;
        String sql = "Select * from KhachHang where email = ? and password=?";
        String password = tk.getPassword();
        String hashPassword = hashPassword(password, "MD5");
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tk.getEmail());
            ps.setString(2, hashPassword.toUpperCase());
            rs = ps.executeQuery();
        } catch (Exception e) {

        }

        return rs.next();
    }

    public int Update(KhachHang kh) {
        String sql = "update KhachHang set hoten=?, gioitinh=?, ngaysinh=?, diachi=?, dienthoai=? where makhachhang=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, kh.getHoten());
            ps.setString(2, kh.getGioitinh());
            ps.setDate(3, kh.getNgaysinh());
            ps.setString(4, kh.getDiachi());
            ps.setString(5, kh.getDienthoai());
            ps.setInt(6, kh.getMakhachhang());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;

    }

    public int forgotPassword(String password, String email) {
        int kq = 0;
        String sql = "update KhachHang set [password]= ? where email=?";
        try {
            if (password != null && !password.isEmpty()) {
                password = getMd5(password);
            }
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, email);
            kq = ps.executeUpdate();
        } catch (Exception e) {
        }
        return kq;
    }

    public static String getMd5(String input) {
        try {

            // Static getInstance method is called with hashing MD5Filter
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
