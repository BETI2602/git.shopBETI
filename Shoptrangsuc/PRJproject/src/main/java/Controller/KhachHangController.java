/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.KhachHangDAO;
import Models.KhachHang;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ddand
 */
public class KhachHangController extends HttpServlet {

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
            out.println("<title>Servlet KhachHangController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet KhachHangController at " + request.getContextPath() + "</h1>");
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
        if (request.getParameter("btnLog") != null) {
            String email = request.getParameter("txtEmaillg");
            String pass = request.getParameter("txtPasslg");

            KhachHang kh = new KhachHang(email, pass);
            KhachHangDAO lgdao = new KhachHangDAO();
            KhachHang ac = lgdao.GetKhachHang(email);
            boolean ketqua = false;
            try {
                ketqua = lgdao.Login(kh);
            } catch (SQLException ex) {
                Logger.getLogger(KhachHangController.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (ketqua) {
                Cookie c = new Cookie("acc", String.valueOf(ac.getMakhachhang()));
                Cookie cfull = new Cookie("fullname", URLEncoder.encode(ac.getHoten(), "UTF-8"));
                c.setMaxAge(3 * 24 * 60 * 60);
                cfull.setMaxAge(3 * 24 * 60 * 60);
                response.addCookie(c);
                response.addCookie(cfull);
                response.sendRedirect("/Home/Trangchu");
            } else {
                request.setAttribute("alertMess", "Email hoặc mật khẩu không đúng, vui lòng thử lại!");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
        if (request.getParameter("btnRegis") != null) {
            String email = request.getParameter("txtEmail");
            String hoten = request.getParameter("txtName");
            String pass = request.getParameter("txtPass");
            String gender = "Nam";
            String address = "";
            String phone = "";
            LocalDate currentDate = LocalDate.now();
            Date ngaysinh = Date.valueOf(currentDate);

            KhachHang kh = new KhachHang(hoten, email, pass, gender, ngaysinh, address, phone);
            KhachHangDAO rgdao = new KhachHangDAO();
            KhachHang ac = rgdao.GetKhachHang(email);

            if (ac.getEmail() != null) {
                request.setAttribute("alertMess", "Email đã tồn tại, vui lòng sử dụng email khác");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                int kq = 0;
                String alertMess = "";
                try {
                    kq = rgdao.AddNew(kh);
                } catch (SQLException ex) {
                    Logger.getLogger(KhachHangController.class.getName()).log(Level.SEVERE, null, ex);
                }
                if (kq != 0) {
                    alertMess = "Đăng ký thành công, mời bạn đăng nhập!";
                    request.setAttribute("alertMess", alertMess);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    alertMess = "Lỗi đăng ký, vui lòng thử lại!";
                    request.setAttribute("alertMess", alertMess);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }
        }

        if (request.getParameter("btnUpdate") != null) {
            int id = Integer.parseInt(request.getParameter("txtID"));
            String hoten = request.getParameter("txtHoten");
            String email = request.getParameter("txtEmail");
            String gioitinh = request.getParameter("txtGender");
            Date ngaysinh = Date.valueOf(request.getParameter("txtDate"));
            String diachi = request.getParameter("txtAddress");
            String dienthoai = request.getParameter("txtPhone");

            KhachHang kh = new KhachHang(id, hoten, email, gioitinh, ngaysinh, diachi, dienthoai);
            KhachHangDAO dao = new KhachHangDAO();
            int ketqua = dao.Update(kh);
            if (ketqua != 0) {
                HttpSession session = request.getSession();
                session.setAttribute("khTaken", kh);
                request.setAttribute("thongBaoCapNhat", "Cập nhật thành công");
                request.getRequestDispatcher("/themthongtin.jsp").forward(request, response);
//                response.sendRedirect("/themthongtin.jsp");

            } else {
                request.setAttribute("thongBaoCapNhat", "Cập nhật không thành công, vui lòng thử lại");
//                response.sendRedirect("/themthongtin.jsp");
                request.getRequestDispatcher("/themthongtin.jsp").forward(request, response);
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
