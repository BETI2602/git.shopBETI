/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.AdminDAO;
import DAOs.HoaDonDAO;
import DAOs.SanPhamDAO;
import Models.Admin;
import Models.HoaDon;
import Models.SanPham;
import jakarta.servlet.http.Cookie;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ddand
 */
public class AdminController extends HttpServlet {

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
            out.println("<title>Servlet AdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/Admin/Sanpham")) {
            request.getRequestDispatcher("/trangadmin.jsp").forward(request, response);
        } else {
            if (path.endsWith("/Admin/Sanpham/New")) {
                response.sendRedirect("/SanPham/New");
            } else {
                if (path.startsWith("/Admin/Sanpham/Edit/")) {
                    String[] s = path.split("/");
                    String id = s[s.length - 1];
                    response.sendRedirect("/SanPham/Edit/" + id);
                } else {
                    if (path.startsWith("/Admin/Sanpham/Delete/")) {
                        String[] s = path.split("/");
                        String id = s[s.length - 1];
                        response.sendRedirect("/SanPham/Delete/" + id);
                    }
                }
            }
        }

        if (path.endsWith("/Admin/HoaDon")) {
            request.getRequestDispatcher("/hoadon-list.jsp").forward(request, response);
        } else {
            if (path.endsWith("/Admin/HoaDon/New")) {
                response.sendRedirect("/HoaDon/New");
            } else {
                if (path.startsWith("/Admin/HoaDon/Edit/")) {
                    String[] s = path.split("/");
                    String id = s[s.length - 1];
                    response.sendRedirect("/HoaDon/Edit/" + id);
                } else {
                    if (path.startsWith("/Admin/HoaDon/Delete/")) {
                        String[] s = path.split("/");
                        String id = s[s.length - 1];
                        HoaDonDAO dao = new HoaDonDAO();
                        HoaDon sp = dao.getHoaDon(id);
                        dao.deleteHoaDon(id);
                        response.sendRedirect("/Admin/HoaDon");
                    }
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
        if (request.getParameter("btnLogin") != null) {
            String email = request.getParameter("adEmail");
            String pass = request.getParameter("adPass");

            Admin ad = new Admin(email, pass);
            AdminDAO lgdao = new AdminDAO();
            Admin ac = lgdao.GetAdmin(email);
            boolean ketqua = false;
            try {
                ketqua = lgdao.Login(ad);
            } catch (SQLException ex) {
                Logger.getLogger(KhachHangController.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (ketqua) {
                Cookie c = new Cookie("quantri", String.valueOf(ac.getMaadmin()));
                Cookie cfull = new Cookie("nameQuantri", URLEncoder.encode(ac.getHoten(), "UTF-8"));
                c.setMaxAge(60 * 60);
                cfull.setMaxAge(60 * 60);
                response.addCookie(c);
                response.addCookie(cfull);
                response.sendRedirect("/Admin/Sanpham");
            } else {
                request.setAttribute("alertMess", "Email hoặc mật khẩu không đúng!");
                request.getRequestDispatcher("/trangdangnhap.jsp").forward(request, response);
            }
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
