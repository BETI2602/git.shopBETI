<%-- 
    Document   : chinhsuaAdmin
    Created on : Jul 11, 2023, 10:29:12 AM
    Author     : Dell
--%>

<%@page import="Models.HoaDon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="/css/style.css">
        <title>Chỉnh Sửa Hóa Đơn</title>
    </head>
<!--    <body>
        <%          
            HoaDon hd = (HoaDon) session.getAttribute("thongtinhoadon");
        %>
        <form action="/HoaDon" method="post">
            Mã hóa đơn: <input type="text" name="mahoadon" value=""> <br/>
            Mã khách hàng: <input type="text" name="makhachhang" value=""> <br/>
            Mã sản phẩm: <input type="text" name="masanpham" value=""> <br/>
            Họ tên: <input type="text" name="hoten" value=""> <br/>
            Tên sản phẩm: <input type="text" name="tensanpham" value=""> <br/>
            Giá tiền: <input type="text" name="giatien" value=""> <br/>
            Số lượng: <input type="text" name="soluong" value=""> <br/>
            Ngày đã mua: <input type="text" name="ngaydamua" value=""> <br/>
            <input type="submit" value="Submit" name="btnEdit">
        </form>
    </body>-->
    
    <body style="overflow: auto;">
        <div class="admin_bg"></div>
        <div class="info__container admin_container addproduct_container">
            <h1 class="info__title">Cập nhật hóa đơn</h1>
            <form action="HoaDon" method="post" class="info__form" id="addpro-form">
                 <div class="info__data addproduct_data ip-w-60">
                    <label for="name" class="info__data-label">Mã hóa đơn</label>
                    <div class="info__data-area">
                        <input type="hidden" name="mahoadon" value="<%= hd.getMahoadon() %>">
                        <span>Id:<%= hd.getMahoadon() %></span>
                    </div>
                    <p class="info__datap" id="upnerror"></p>
                </div>
                    <div class="info__data addproduct_data ip-w-60">
                    <label for="name" class="info__data-label">Tên khách hàng</label>
                    <div class="info__data-area">
                        <input type="text" name="hoten" id="pro-name" placeholder="Nhập tên khách hàng" value="<%= hd.getHoten() %>">
                        <input type="hidden" name="makhachhang" value="<%= hd.getMakhachhang() %>">
                        <span>Id: <%= hd.getMakhachhang() %></span>
                    </div>
                    <p class="info__datap" id="upnerror"></p>
                </div>
                <div class="info__data addproduct_data ip-w-60">
                    <div class="info__data-area">
                        <label class="info__data-label">ID Sản Phẩm</label>
                        <input type="text" name="masanpham" value="<%= hd.getMasanpham() %>">
                    </div>
                    <p class="info__datap" id="upnerror"></p>
                </div>
                <div class="info__data addproduct_data">
                    <label for="Email" class="info__data-label">Giá Tiền</label>
                    <input type="text" name="giatien" id="pro-price" placeholder="Nhập giá tiền" value="<%=  hd.getGiatien() %>">
                </div>
                <div class="info__data addproduct_data">
                    <label for="phone" class="info__data-label">Ngày mua</label>
                    <input type="date" id="pro-material" name="ngaydamua" value="<%= hd.getNgaydamua() %>">
                    <p class="info__datap" id="upterror"></p>
                </div>
                <div class="info__footer">
                    <div class="info__back addproduct_back">
                        <a href="/Admin/HoaDon">Quay Lại</a>
                    </div>
                    <input type="submit" class="login__submit addproduct_submit" value="Chỉnh sửa" name="btnEdit">
                </div>
            </form>
        </div> 
        <script src="/js/swiper-bundle.min.js"></script>
        <script src="/js/scrollreveal.min.js"></script>
        <script src="/js/main.js"></script>
    </body>
</html>
