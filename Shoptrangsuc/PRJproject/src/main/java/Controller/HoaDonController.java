/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.HoaDonDAO;
import Models.HoaDon;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author TUF
 */
public class HoaDonController extends HttpServlet {

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
            out.println("<title>Servlet HoaDonController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HoaDonController at " + request.getContextPath() + "</h1>");
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
        if (path.startsWith("/HoaDon/Edit/")) {
            String[] s = path.split("/");
            String id = s[s.length - 1];
            HoaDonDAO dao = new HoaDonDAO();
            HoaDon hd = dao.getHoaDon(id);

            if (hd == null) {
                response.sendRedirect("/Admin/HoaDon");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("thongtinhoadon", hd);
                request.getRequestDispatcher("/chinhsuahoadon.jsp").forward(request, response);
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

        if (request.getParameter("btnEdit") != null) {//chuc nang cap nhat
            int mahoadon = Integer.valueOf(request.getParameter("mahoadon"));
            int makhachhang = Integer.valueOf(request.getParameter("makhachhang"));
            String masanpham = request.getParameter("masanpham");
            String hoten = request.getParameter("hoten");
            int giatien = Integer.valueOf(request.getParameter("giatien"));
            Date ngaydamua = Date.valueOf(request.getParameter("ngaydamua"));

            HoaDon hd = new HoaDon(mahoadon, makhachhang, masanpham, hoten, giatien, ngaydamua);
            HoaDonDAO dao = new HoaDonDAO();
            int ketqua = dao.updateHoaDon(hd);
            if (ketqua != 0) {
                response.sendRedirect("/Admin/HoaDon");
            } else {
                response.sendRedirect("/HoaDon/Edit/" + mahoadon);
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
