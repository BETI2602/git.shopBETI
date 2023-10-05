<%-- 
    Document   : themthongtin
    Created on : Jun 11, 2023, 2:20:26 PM
    Author     : Dell
--%>

<%@page import="java.sql.Date"%>
<%@page import="Models.KhachHang"%>
<%@page import="DAOs.KhachHangDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/css/style.css"/>
        <title>Trang thôn tin</title>
    </head>
    <body>
        <%
            KhachHang kh = (KhachHang) session.getAttribute("khTaken");
            session.setAttribute("fullname", kh.getHoten());
        %>
        <div class="loader">
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
        <div class="info__background">
            <div class="info__container">
                <h1 class="info__title">Thông tin cá nhân</h1>
                <form action="/TaiKhoan" method="post" class="info__form" id="update-form" >
                    <div class="info__data ip-w-60">
                        <label for="name" class="info__data-label">Họ tên</label>
                        <div class="info__data-area">
                            <input type="text" name="txtHoten" id="txtHoten" value="<%=kh.getHoten()%>" placeholder="Nhập họ tên">
                            <input type="hidden" name="txtID" value="<%=kh.getMakhachhang()%>">
                            <span>Id: <%=kh.getMakhachhang()%></span>
                        </div>
                        <p class="info__datap" id="upnerror"></p>
                    </div>
                    <div class="info__data">
                        <label for="Email" class="info__data-label">Email</label>
                        <input type="text" name="txtEmail" readonly id="email" value="<%=kh.getEmail()%>">
                    </div>           
                    <div class="info__data info__data-gender">
                        <label for="gioitinh" class="info__data-label">Giới Tính</label>
                        <div class="info__data-area ">
                            <input type="radio" value="Nam" name="txtGender" <%=kh.getGioitinh().equals("Nam") ? "checked" : ""%>> <label for="gioitinh">Nam</label>
                            <input type="radio" value="Nu" name="txtGender" <%=kh.getGioitinh().equals("Nu") ? "checked" : ""%>> <label for="gioitinh">Nữ</label>
                        </div>
                    </div>
                    <div class="info__data ip-w-60">
                        <label for="ngaysinh" class="info__data-label">Ngày sinh</label>
                        <input type="date" id="txtDate" name="txtDate" value="<%=kh.getNgaysinh()%>">
                        <p class="info__datap" id="upderror"></p>
                    </div>
                    <div class="info__data">
                        <label for="phone" class="info__data-label">Số điện thoại</label>
                        <input type="text" id="txtPhone" name="txtPhone" value="<%=kh.getDienthoai()%>" placeholder="Nhập số điện thoại">
                        <p class="info__datap" id="upterror"></p>
                    </div>
                    <div class="info__data">
                        <label for="diachi" class="info__data-label">Địa chỉ</label>
                        <input type="text" id="txtAddress" name="txtAddress" value="<%=kh.getDiachi()%>" placeholder="Nhập địa chỉ">
                        <p class="info__datap" id="upaerror"></p>
                    </div>
                    <div class="info__footer">
                        <div class="info__back">
                            <a href="/Home/Trangchu">Quay Lại</a> 
                        </div>    
                        <input type="submit" class="login__submit" value="Chỉnh sửa" name="btnUpdate">
                    </div>
                    <%
                        if (request.getAttribute("thongBaoCapNhat") != null) {
                    %>
                    <p style="color: crimson; text-align: center; font-size: 1rem;"><%=request.getAttribute("thongBaoCapNhat")%></p>
                    <%
                        }
                    %>
                </form>
            </div>
        </div>
        <script src="/js/main.js"></script>
    </body>
</html>
