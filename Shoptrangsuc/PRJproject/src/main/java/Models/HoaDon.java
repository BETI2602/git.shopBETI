/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author Dell
 */
public class HoaDon {
    private int mahoadon;
        private int makhachhang;
        private String masanpham;
        private String hoten;
        private int giatien;
        private Date ngaydamua ;

    public HoaDon() {
    }

    public HoaDon(int mahoadon, int makhachhang, String masanpham, String hoten, int giatien, Date ngaydamua) {
        this.mahoadon = mahoadon;
        this.makhachhang = makhachhang;
        this.masanpham = masanpham;
        this.hoten = hoten;
        this.giatien = giatien;
        this.ngaydamua = ngaydamua;
    }
    
    public HoaDon( int makhachhang, String masanpham, String hoten,  int giatien, Date ngaydamua) {
        this.makhachhang = makhachhang;
        this.masanpham = masanpham;
        this.hoten = hoten;
        this.giatien = giatien;
        this.ngaydamua = ngaydamua;
    }

    public int getMahoadon() {
        return mahoadon;
    }

    public void setMahoadon(int mahoadon) {
        this.mahoadon = mahoadon;
    }

    public int getMakhachhang() {
        return makhachhang;
    }

    public void setMakhachhang(int makhachhang) {
        this.makhachhang = makhachhang;
    }

    public String getMasanpham() {
        return masanpham;
    }

    public void setMasanpham(String masanpham) {
        this.masanpham = masanpham;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

  

    public int getGiatien() {
        return giatien;
    }

    public void setGiatien(int giatien) {
        this.giatien = giatien;
    }



    public Date getNgaydamua() {
        return ngaydamua;
    }

    public void setNgaydamua(Date ngaydamua) {
        this.ngaydamua = ngaydamua;
    }
        
        

}
