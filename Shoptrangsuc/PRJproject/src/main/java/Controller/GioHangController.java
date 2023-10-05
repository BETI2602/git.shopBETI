/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.GioHangDAO;
import DAOs.HoaDonDAO;
import DAOs.KhachHangDAO;
import DAOs.SanPhamDAO;

import Models.GioHang;
import Models.HoaDon;
import Models.KhachHang;
import Models.SanPham;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ddand
 */
public class GioHangController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GioHangController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GioHangController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        if (path.startsWith("/GioHang/tt")) {
            String[] s = path.split("/");
            String id = s[s.length - 1];
            KhachHangDAO dao = new KhachHangDAO();
            KhachHang sp = dao.GetKhachHangid(id);
            HttpSession session = request.getSession();
            if (sp.getEmail() != null) {
                session.setAttribute("idkh", id);
                request.getRequestDispatcher("/cart.jsp").forward(request, response);
            } else {
                session.setAttribute("trigger", "asdf");
                response.sendRedirect("/");
            }
        } else {
            if (path.startsWith("/GioHang/New")) {
                String[] s = path.split("/");
                String idsp = s[s.length - 1];
                String idkh = s[s.length - 2];
                KhachHangDAO dao = new KhachHangDAO();
                KhachHang sp = dao.GetKhachHangid(idkh);
                HttpSession session = request.getSession();
                if (sp.getEmail() != null) {
                    session.setAttribute("idkh", idkh);
                    request.setAttribute("idsp", idsp);
                    request.getRequestDispatcher("/addtocart.jsp").forward(request, response);
                } else {
                    session.setAttribute("trigger", "asdf");
                    response.sendRedirect("/");
                }
            } else {
                if (path.startsWith("/GioHang/Delete")) {
                    String[] s = path.split("/");
                    String id = s[s.length - 1];
                    GioHangDAO dao = new GioHangDAO();
                    GioHang gh = dao.getGioHang(id);
                    dao.delete(id);
                    request.getRequestDispatcher("/cart.jsp").forward(request, response);
                } else {
//                    if (path.startsWith("/GioHang/Order")) {
//                        String[] s = path.split("/");
//                        String id = s[s.length - 1];
//                        KhachHangDAO dao = new KhachHangDAO();
//                        KhachHang sp = dao.GetKhachHangid(id);
//                        HttpSession session = request.getSession();
//                        if (sp.getEmail() != null) {
//                            session.setAttribute("idkh", id);
//                            request.getRequestDispatcher("/addorder.jsp").forward(request, response);
//                        }else{
//                            response.sendRedirect("/");
//                        }
//                        }
                }
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("btnsubmit") != null) {
            int makh = Integer.parseInt(request.getParameter("txtidkh"));
            int masp = Integer.parseInt(request.getParameter("txtidsp"));
            String tensp = request.getParameter("txttensp");
            int giatien = Integer.parseInt(request.getParameter("txtgiatien"));
            int soluong = Integer.parseInt(request.getParameter("txtsoluong"));
            String hinhanh = request.getParameter("txthinhanh");

            GioHangDAO dao = new GioHangDAO();
            GioHang gh = new GioHang(makh, masp, tensp, giatien, soluong, hinhanh);
            int kq = dao.AddNew(gh);
            HttpSession session = request.getSession();
            if (kq != 0) {
                session.setAttribute("alrtMess", "Thêm thành công");
                response.sendRedirect("/Home/Shop");
            } else {
                session.setAttribute("alrtMess", "Có lỗi xảy ra vui lòng thử lại");
                response.sendRedirect("/Home/Shop");
            }
        }
        if (request.getParameter("btnOrder") != null) {
            GioHangDAO gdao = new GioHangDAO();
            ResultSet rs = gdao.getAllKH(request.getParameter("txtmakh"));
            try {
                if (rs.next()) {
                    int makh = Integer.parseInt(request.getParameter("txtmakh"));
                    String msp = request.getParameter("txtmasp");

                    msp = msp.substring(0, msp.length() - 1);

                    String hoten = request.getParameter("txthoten");
                    int total = Integer.parseInt(request.getParameter("txttotal"));
                    LocalDate currentDate = LocalDate.now();
                    Date ngaydamua = Date.valueOf(currentDate);

                    HoaDonDAO dao = new HoaDonDAO();
                    HoaDon hd = new HoaDon(makh, msp, hoten, total, ngaydamua);
                    int kq = 0;
                    try {
                        kq = dao.AddNew(hd);
                    } catch (SQLException ex) {
                        Logger.getLogger(GioHangController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    HttpSession session = request.getSession();
                    if (kq != 0) {
                        reduceNum(msp);
                        GioHangDAO ghdao = new GioHangDAO();
                        ghdao.deleteAll(request.getParameter("txtmakh"));
                        session.setAttribute("alertmess", "Đặt hàng thành công, Trong 10 ngày nữa hãy đến nhận hàng nhé");
                        response.sendRedirect("/GioHang/tt/" + makh);
                    } else {
                        session.setAttribute("alertmess", "Xin lỗi có một chút trục trặc, vui lòng thử lại");
                        response.sendRedirect("/GioHang/tt/" + makh);
                    }
                } else {
                    response.sendRedirect("/GioHang/tt/" + request.getParameter("txtmakh"));
                }
            } catch (SQLException ex) {
                Logger.getLogger(GioHangController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void reduceNum(String msp) {
        String[] s = msp.split(",");
        SanPhamDAO spdao = new SanPhamDAO();
        for (int i = 0; i < s.length; i++) {
            SanPham sp = spdao.getSanPham(s[i]);
            int reduceOne = sp.getSoluong() - 1;
            SanPham spd = new SanPham(sp.getMasp(), reduceOne);
            int kq = 0;
            kq = spdao.reduceNum(spd);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
