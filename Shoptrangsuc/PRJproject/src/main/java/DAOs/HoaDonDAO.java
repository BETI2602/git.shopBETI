package DAOs;

import Models.HoaDon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class HoaDonDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public HoaDonDAO() {
        conn = DBConnection.DBConnection.getConnection();
    }

    public ResultSet getAllHoaDon(){
        String sql = "select*from HoaDon";
        
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public HoaDon getHoaDon(String id) {
        HoaDon hd = null;
        try {
            ps = conn.prepareStatement("SELECT * FROM HoaDon WHERE mahoadon = ?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                hd = new HoaDon(rs.getInt("mahoadon"),rs.getInt("makhachhang") ,rs.getString("masanpham"),rs.getString("hoten"),rs.getInt("tongtien"),rs.getDate("ngaydamua"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return hd;
    }
    
    public int AddNew(HoaDon od) throws SQLException {
        String sql = "insert into HoaDon values(?,?,?,?,?);";
        int ketqua = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, od.getMakhachhang());
            ps.setString(2, od.getMasanpham());
            ps.setString(3, od.getHoten());
            ps.setInt(4, od.getGiatien());
            ps.setDate(5, od.getNgaydamua());

        ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ketqua;
    }

   

    public int updateHoaDon(HoaDon hd) {
        String sql = "UPDATE HoaDon SET makhachhang=?, masanpham=?, hoten=?, tongtien=?, ngaydamua=? WHERE mahoadon=?";
        int ketqua = 0;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, hd.getMakhachhang());
            ps.setString(2, hd.getMasanpham());
            ps.setString(3, hd.getHoten());
            ps.setInt(4, hd.getGiatien());
            ps.setDate(5, hd.getNgaydamua());
            ps.setInt(6, hd.getMahoadon());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HoaDonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int deleteHoaDon(String id) {
        int ketqua = 0;
        String sql = "DELETE FROM HoaDon WHERE mahoadon=?";
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
