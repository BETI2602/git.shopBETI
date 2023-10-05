<%--
    Document   : hoadon-list
    Created on : Jul 10, 2023, 3:05:12 PM
    Author     : ddand
--%>

<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.HoaDonDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.HoaDon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="/css/style.css">
        <title>Hóa đơn</title>
    </head>
    <body>
        <%
            if (session.getAttribute("quantri") == null) {
                Cookie[] cookies = request.getCookies();
                String fullname = null;
                if (cookies != null) {
//                if (session.getAttribute("acc") == null) {
//                    response.sendRedirect("/");
//                }
//            } else {

                    boolean flag = false;
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("quantri") && !cookie.getValue().equals("")) {
                            flag = true;
                            session.setAttribute("quantri", cookie.getValue());
                            break;
                        }
                    }
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("nameQuantri")) {
                            fullname = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8.toString());
                            session.setAttribute("nameQuantri", fullname);
                            break;
                        }
                    }
                    if (!flag) {
                        response.sendRedirect("/Dashboard");
                    }

                }
            }
        %>
        <div class="loader">
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
        <div class="admin_bg"></div>
        <div class="admin_container container">
            <div class="admin_header">
                <div class="nav_admin">
                    <a href="/Admin/Sanpham" class="nav_admin-link nav_notin">Sản phẩm</a>
                    <a href="/Admin/HoaDon" class="nav_admin-link">Hóa đơn</a>
                </div>
                <a href="/Home" class="logo__item admin_logo">BETI <span>®</span></a>
                <div class="nav_admin-right">
                    <input type="text" id="searchInput" onblur="search()" placeholder="Nhập từ khóa">
                    <button type="button" id="btnSearch"><i class='bx bx-search'></i></button>
                    <h1 class="admin_nameside"><%=session.getAttribute("nameQuantri")%></h1>
                </div>
            </div>
            <div class="admin_product-List" id="searchResults">
                <!-- ======== add ============== -->

                <%
                    HoaDonDAO dao = new HoaDonDAO();
                    ResultSet rs = dao.getAllHoaDon();
                    
                    while (rs.next()) {
                %>
                <!-- ======== item1 ============== -->
                <div class="admin_product-item">
                    <div class="admin_product-item-descripttion">
                        <div>
                            <p class="admin_product-item-id"><span>ID hoá đơn:</span><%= rs.getString("mahoadon")%></p> 
                            <p class="admin_product-item-id"><span>ID các sản phẩm:</span><%= rs.getString("masanpham")%></p>
                            <p class="admin_product-item-id"><span>ID khách hàng:</span><%= rs.getString("makhachhang")%></p>
                            <p class="admin_product-item-name"><span></span><%= rs.getString("hoten")%></p> 
                            <!--                            class="admin_product-item-id
                                                        admin_product-item-name
                                                        admin_product-item-price-->
                        </div>
                        <div>
                            <p class="admin_product-item-id"><span>Giá tiền:</span><%= String.format("%,.0f đ", rs.getDouble("tongtien"))%></p> 
                            <p class="admin_product-item-id"><span>Ngày mua:</span><%= rs.getString("ngaydamua")%></p> 
                        </div>
                    </div>
                    <div class="admin_product-function">
                        <a href="/Admin/HoaDon/Edit/<%= rs.getString("mahoadon")%>" class="admin_product-function-edit"><i class='bx bxs-edit-alt'></i></a>
                        <a href="/Admin/HoaDon/Delete/<%= rs.getString("mahoadon")%>" class="admin_product-function-remove"><i class='bx bxs-trash-alt'></i></a>
                    </div>
                </div>
                <%
                    }
                %> 
            </div>
        </div>
        <a class="scroll__up" id="scroll-up" href="#">
            <i class='bx bx-arrow-to-top'></i>
        </a>
        <script src="/js/swiper-bundle.min.js"></script>
        <script src="/js/popup.js"></script>
        <script>
                        function search() {

                            let input = document.getElementById("searchInput").value.toString().toUpperCase();
                            let container = document.getElementById("searchResults");
                            var itemsName = container.getElementsByClassName("admin_product-item-name");
                            let items = container.getElementsByClassName("admin_product-item");


                            // Duyệt qua danh sách hóa đơn và ẩn hiện các hóa đơn tương ứng
                            for (var i = 0; i < itemsName.length; i++) {
                                let name = itemsName[i].innerText.toString().toUpperCase();

                                if (name.includes(input)) {
                                    console.log(i);
                                    items[i].style.display = "flex";
                                } else {
                                    items[i].style.display = "none";
                                }
                            }
                        }
        </script>
        <script src="/js/main.js"></script>
    </body>
</html>
