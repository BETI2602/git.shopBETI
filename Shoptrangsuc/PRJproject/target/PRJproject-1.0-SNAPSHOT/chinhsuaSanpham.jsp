<%-- 
    Document   : chinhsuaAdmin
    Created on : Jul 11, 2023, 10:29:12 AM
    Author     : Dell
--%>

<%@page import="Models.SanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="/css/style.css">
        <title>Chỉnh Sửa Sản Phẩm</title>
    </head>
    <body style="overflow: auto;">

        <%
            SanPham sp = (SanPham) session.getAttribute("thongtinsp");
        %>
        <div class="admin_bg"></div>
        <div class="info__container admin_container addproduct_container">
            <h1 class="info__title">Cập nhật sản phẩm</h1>
            <form action="/SanPham" method="post" class="info__form" id="addpro-form" enctype="multipart/form-data">
                <div class="info__data addproduct_data ip-w-60">
                    <label for="name" class="info__data-label">Tên Sản phẩm</label>
                    <div class="info__data-area">
                        <input type="text" name="tensanpham" id="pro-name" placeholder="Nhập tên sản phẩm" value="<%= sp.getTensp()%>">
                        <input type="hidden" name="masanpham" value="<%=sp.getMasp()%>">
                        <span>Id: <%=sp.getMasp()%></span>
                    </div>
                    <p class="info__datap" id="upnerror"></p>
                </div>
                <div class="info__data addproduct_data">
                    <label for="Email" class="info__data-label">Giá Tiền</label>
                    <input type="text" name="giatien" id="pro-price" placeholder="Nhập giá tiền" value="<%= sp.getGiatien()%>">
                </div>
                <div class="info__data addproduct_data">
                    <label for="Email" class="info__data-label">Số Lượng</label>
                    <input type="text" name="soluong" id="pro-quan" placeholder="Nhập số lượng" value="<%= sp.getSoluong()%>">
                </div>

                <div class="info__data addproduct_data addproduct_data-img ip-w-60">
                    <label for="pro-pic" class="info__data-label" style="top:38%;">Upload hình ảnh</label>
                    <div class="info__data-area">
                        <input type="hidden" name="imgTmp" value="<%= sp.getHinhanh()%>">
                        <input class="" name="hinhanh" id="pro-pic" type="file" accept="image/*">
                        <img src="<%= sp.getHinhanh()%>" style="width:200px;">
                    </div>
                    <p class="info__datap" id="upderror"></p>
                </div>
                <div class="info__data addproduct_data">
                    <label for="phone" class="info__data-label">Chất Liệu</label>
                    <input type="text" id="pro-material" name="chatlieu" placeholder="Chất liệu sản phẩm" value="<%= sp.getChatlieu()%>">
                    <p class="info__datap" id="upterror"></p>
                </div>
                <div class="info__data addproduct_data">
                    <label for="diachi" class="info__data-label">Loại</label>
                    <input type="text" id="pro-type" name="loai" placeholder="Loại sản phẩm" value="<%= sp.getLoai()%>">
                    <p class="info__datap" id="upaerror"></p>
                </div>
                <div class="info__footer">
                    <div class="info__back addproduct_back">
                        <a href="/Admin/Sanpham">Quay Lại</a>
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
