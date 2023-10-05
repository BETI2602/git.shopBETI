/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ddand
 */
public class SanPham {

    private int masp;
    private String tensp;
    private int giatien;
    private int soluong;
    private String hinhanh;
    private String chatlieu;
    private String loai;

    public SanPham() {
    }

    public SanPham(int masp, String tensp, int giatien, int soluong, String hinhanh, String chatlieu, String loai) {
        this.masp = masp;
        this.tensp = tensp;
        this.giatien = giatien;
        this.soluong = soluong;
        this.hinhanh = hinhanh;
        this.chatlieu = chatlieu;
        this.loai = loai;
    }

    public SanPham(int masp, int soluong) {
        this.masp = masp;
        this.soluong = soluong;
    }

    public SanPham(String tensp, int giatien, int soluong, String hinhanh, String chatlieu, String loai) {
        this.tensp = tensp;
        this.giatien = giatien;
        this.soluong = soluong;
        this.hinhanh = hinhanh;
        this.chatlieu = chatlieu;
        this.loai = loai;
    }

    public int getMasp() {
        return masp;
    }

    public void setMasp(int masp) {
        this.masp = masp;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
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

    public String getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }

    public String getChatlieu() {
        return chatlieu;
    }

    public void setChatlieu(String chatlieu) {
        this.chatlieu = chatlieu;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

}
