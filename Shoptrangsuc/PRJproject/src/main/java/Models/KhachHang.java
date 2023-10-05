/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author ddand
 */
public class KhachHang {
    private int makhachhang;
    private String email;
    private String password;
    private String hoten;
    private String gioitinh;
    private Date ngaysinh;
    private String diachi;
    private String dienthoai;

    public KhachHang() {
    }
    public KhachHang(String email, String password) {
        this.email = email;
        this.password = password;
    }
//    public KhachHang(String email, String password, String hoten) {
//        this.email = email;
//        this.password = password;
//        this.hoten = hoten;
//    }
    public KhachHang(String hoten, String email, String password, String gioitinh, Date ngaysinh, String diachi, String dienthoai) {
        this.email = email;
        this.password = password;
        this.hoten = hoten;
        this.gioitinh = gioitinh;
        this.ngaysinh = ngaysinh;
        this.diachi = diachi;
        this.dienthoai = dienthoai;
    }
    
    public KhachHang(int makhachhang, String hoten, String email, String gioitinh, Date ngaysinh, String diachi, String dienthoai) {
        this.makhachhang = makhachhang;
        this.email = email;
        this.hoten = hoten;
        this.gioitinh = gioitinh;
        this.ngaysinh = ngaysinh;
        this.diachi = diachi;
        this.dienthoai = dienthoai;
    }
    
    public KhachHang(int makhachhang, String hoten, String email, String password, String gioitinh, Date ngaysinh, String diachi, String dienthoai) {
        this.makhachhang = makhachhang;
        this.email = email;
        this.password = password;
        this.hoten = hoten;
        this.gioitinh = gioitinh;
        this.ngaysinh = ngaysinh;
        this.diachi = diachi;
        this.dienthoai = dienthoai;
    }
    

    public int getMakhachhang() {
        return makhachhang;
    }

    public void setMakhachhang(int makhachhang) {
        this.makhachhang = makhachhang;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public Date getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getDienthoai() {
        return dienthoai;
    }

    public void setDienthoai(String dienthoai) {
        this.dienthoai = dienthoai;
    }
    
    
}
