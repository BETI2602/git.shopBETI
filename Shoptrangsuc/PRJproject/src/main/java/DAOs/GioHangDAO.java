/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;


import Models.GioHang;
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
public class GioHangDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public GioHangDAO() {
        conn = DBConnection.DBConnection.getConnection();
    }

    public ResultSet getAll(){
        String sql = "select*from GioHang";
        
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ResultSet getAllKH(String id){
        String sql = "select*from GioHang where makhachhang = ?";
        
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public GioHang getGioHang(String id) {
        GioHang sp = null;
        try {
            ps = conn.prepareStatement("select*from GioHang where magiohang=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
              GioHang gh = new GioHang(rs.getInt("magiohang"),rs.getInt("makhachhang"),rs.getInt("masanpham"), rs.getString("tensanpham"), rs.getInt("giatien"), 
                       rs.getInt("soluong"), rs.getString("hinhanh"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sp;
    }

    public int AddNew(GioHang gh) {
        String sql = "insert into GioHang values(?,?,?,?,?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, gh.getMakhachhang());
            ps.setInt(2, gh.getMasanpham());
            ps.setString(3, gh.getTensanpham());
            ps.setInt(4, gh.getGiatien());
            ps.setInt(5,gh.getSoluong());
            ps.setString(6,gh.getHinhanh());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int delete(String id) {
        int ketqua = 0;
        String sql = "DELETE FROM GioHang WHERE magiohang=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
    public int deleteAll(String id) {
        int ketqua = 0;
        String sql = "DELETE FROM GioHang WHERE makhachhang=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
}

