/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.SanPham;
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
public class SanPhamDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public SanPhamDAO() {
        conn = DBConnection.DBConnection.getConnection();
    }

    public ResultSet getAllSanPham() {
        String sql = "select*from SanPham";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public SanPham getSanPham(String id) {
        SanPham sp = null;
        try {
            ps = conn.prepareStatement("select*from SanPham where masanpham=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                sp = new SanPham(rs.getInt("masanpham"), rs.getString("tensanpham"), rs.getInt("giatien"),
                        rs.getInt("soluong"), rs.getString("hinhanh"), rs.getString("chatlieu"), rs.getString("loai"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sp;
    }

    public int Delete(String id) {
        int ketqua = 0;
        String sql = "delete from SanPham where masanpham=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int reduceNum(SanPham sp) {
        String sql = "update SanPham set soluong=? where masanpham=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, sp.getSoluong());
            ps.setInt(2, sp.getMasp());
            ketqua = ps.executeUpdate();
        }catch(SQLException ex){
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int AddNew(SanPham sp) {
        String sql = "insert into SanPham(tensanpham,giatien,soluong,hinhanh,chatlieu,loai) values(?,?,?,?,?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sp.getTensp());
            ps.setInt(2, sp.getGiatien());
            ps.setInt(3, sp.getSoluong());
            ps.setString(4, sp.getHinhanh());
            ps.setString(5, sp.getChatlieu());
            ps.setString(6, sp.getLoai());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Update(SanPham sp) {
        String sql = "update SanPham set tensanpham=?, giatien=?, soluong=?, hinhanh=?, chatlieu=?, loai=?  where masanpham=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sp.getTensp());
            ps.setInt(2, sp.getGiatien());
            ps.setInt(3, sp.getSoluong());
            ps.setString(4, sp.getHinhanh());
            ps.setString(5, sp.getChatlieu());
            ps.setString(6, sp.getLoai());
            ps.setInt(7, sp.getMasp());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
}
