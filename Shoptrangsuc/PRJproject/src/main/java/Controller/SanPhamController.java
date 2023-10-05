/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.SanPhamDAO;
import Models.SanPham;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

/**
 *
 * @author ddand
 */
public class SanPhamController extends HttpServlet {

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
            out.println("<title>Servlet SanPhamController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SanPhamController at " + request.getContextPath() + "</h1>");
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
        if (path.startsWith("/SanPham/ChiTiet/")) {
            String[] s = path.split("/");
            String id = s[s.length - 1];
            SanPhamDAO dao = new SanPhamDAO();
            SanPham sp = dao.getSanPham(id);

            if (sp == null) {
                response.sendRedirect("/Home/Shop");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("thongtinsanpham", sp);
                request.getRequestDispatcher("/thongtinsanpham.jsp").forward(request, response);
            }
        }else {
            if (path.endsWith("/SanPham/New")) {
                request.getRequestDispatcher("/themSanpham.jsp").forward(request, response);
            } else {
                if (path.startsWith("/SanPham/Edit/")) {
                    String[] s = path.split("/");
                    String id = s[s.length - 1];
                    SanPhamDAO dao = new SanPhamDAO();
                    SanPham sp = dao.getSanPham(id);

                    if (sp == null) {
                        response.sendRedirect("/Admin/Sanpham");
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("thongtinsp", sp);
                        request.getRequestDispatcher("/chinhsuaSanpham.jsp").forward(request, response);
                    }
                } else {
                    if (path.startsWith("/SanPham/Delete/")) {
                        String[] s = path.split("/");
                        String id = s[s.length - 1];
                        SanPhamDAO dao = new SanPhamDAO();
                        SanPham sp = dao.getSanPham(id);
                        dao.Delete(id);
                        response.sendRedirect("/Admin/Sanpham");
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
    private static final String UPLOAD_DIR = "img";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("btnInsert") != null) { //them moi
            String tensanpham = request.getParameter("tensanpham");
            int giatien = Integer.valueOf(request.getParameter("giatien"));
            int soluong = Integer.valueOf(request.getParameter("soluong"));
            String chatlieu = request.getParameter("chatlieu");
            String loai = request.getParameter("loai");
            String imgFolderPath = "img";
            String appPath = getServletContext().getRealPath("/");
            String uploadPath = appPath + File.separator + imgFolderPath;

            // Tạo thư mục upload nếu chưa tồn tại
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Lấy file từ request
            Part filePart = request.getPart("hinhanh");
            String fileName = filePart.getSubmittedFileName();
            String fileUrl = "";
            if (fileName == "") {
                fileUrl = request.getParameter("imgTmp");
            } else {
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);

                // In ra đường dẫn của file đã upload
                fileUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;
            }
            String pro_pic = fileUrl;
            if (pro_pic == null) {
                pro_pic = "https://mdbootstrap.com/img/Photos/Others/placeholder.jpg";
            }
            SanPhamDAO dao = new SanPhamDAO();
            SanPham sp = new SanPham(tensanpham, giatien, soluong, pro_pic, chatlieu, loai);
            int kq = dao.AddNew(sp);
            if (kq != 0) {
                response.sendRedirect("/Admin/Sanpham");
            } else {
                response.sendRedirect("/Admin/Sanpham/New");
            }
        }

        if (request.getParameter("btnEdit") != null) {//chinh sua
            int masanpham = Integer.valueOf(request.getParameter("masanpham"));
            String tensanpham = request.getParameter("tensanpham");
            int giatien = Integer.valueOf(request.getParameter("giatien"));
            int soluong = Integer.valueOf(request.getParameter("soluong"));
            String chatlieu = request.getParameter("chatlieu");
            String loai = request.getParameter("loai");

            String imgFolderPath = "img";
            String appPath = getServletContext().getRealPath("/");
            String uploadPath = appPath + File.separator + imgFolderPath;

            // Tạo thư mục upload nếu chưa tồn tại
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Lấy file từ request
            Part filePart = request.getPart("hinhanh");
            String fileName = filePart.getSubmittedFileName();
            String fileUrl = "";
            if (fileName == "") {
                fileUrl = request.getParameter("imgTmp");
            } else {
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);

                // In ra đường dẫn của file đã upload
                fileUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;
            }
            String pro_pic = fileUrl;

            SanPhamDAO dao = new SanPhamDAO();
            SanPham sp = new SanPham(masanpham, tensanpham, giatien, soluong, pro_pic, chatlieu, loai);
            int result = dao.Update(sp);
            if (result != 0) {
                response.sendRedirect("/Admin/Sanpham");
            } else {
                response.sendRedirect("/Admin/Sanpham/Edit/" + masanpham);
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
