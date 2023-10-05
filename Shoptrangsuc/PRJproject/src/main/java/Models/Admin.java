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
public class Admin {
    private int maadmin;
    private String hoten;
    private String email;
    private String password;
    private String gioitinh;
    private Date ngaysinh;
    private String diachi;
    private String dienthoai;

    public Admin() {
    }

    public Admin(int maadmin, String hoten, String email, String password, String gioitinh, Date ngaysinh, String diachi, String dienthoai) {
        this.maadmin = maadmin;
        this.hoten = hoten;
        this.email = email;
        this.password = password;
        this.gioitinh = gioitinh;
        this.ngaysinh = ngaysinh;
        this.diachi = diachi;
        this.dienthoai = dienthoai;
    }
    public Admin(String email, String password){
        this.email = email;
        this.password = password;
    }

    public int getMaadmin() {
        return maadmin;
    }

    public void setMaadmin(int maadmin) {
        this.maadmin = maadmin;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
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
