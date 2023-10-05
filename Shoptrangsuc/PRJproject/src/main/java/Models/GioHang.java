package Models;

public class GioHang {
    private int magiohang;
    private int makhachhang;
    private int masanpham;
    private String tensanpham;
    private int giatien;
    private int soluong;
    private String hinhanh;

    public GioHang() {
    }

    public GioHang( int makhachhang, int masanpham, String tensanpham, int giatien, int soluong, String hinhanh) {
        this.makhachhang = makhachhang;
        this.masanpham = masanpham;
        this.tensanpham = tensanpham;
        this.giatien = giatien;
        this.soluong = soluong;
        this.hinhanh = hinhanh;
    }
    public GioHang(int magiohang, int makhachhang, int masanpham, String tensanpham, int giatien, int soluong, String hinhanh) {
        this.magiohang = magiohang;
        this.makhachhang = makhachhang;
        this.masanpham = masanpham;
        this.tensanpham = tensanpham;
        this.giatien = giatien;
        this.soluong = soluong;
        this.hinhanh = hinhanh;
    }

    public int getMakhachhang() {
        return makhachhang;
    }

    public void setMakhachhang(int makhachhang) {
        this.makhachhang = makhachhang;
    }

    public int getMasanpham() {
        return masanpham;
    }

    public void setMasanpham(int masanpham) {
        this.masanpham = masanpham;
    }

    public String getTensanpham() {
        return tensanpham;
    }

    public void setTensanpham(String tensanpham) {
        this.tensanpham = tensanpham;
    }

    public int getGiatien() {
        return giatien;
    }

    public void setGiatien(int giatien) {
        this.giatien = giatien;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public int getMagiohang() {
        return magiohang;
    }

    public void setMagiohang(int magiohang) {
        this.magiohang = magiohang;
    }

    public String getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }
    
    
    
                  
   
}
