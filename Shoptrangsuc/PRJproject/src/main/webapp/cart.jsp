<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.GioHangDAO"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="Models.GioHang"%>
<%@page import="Models.SanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="/css/style.css">
        <title>Trang Giỏ Hàng</title>
    </head>

    <body style="overflow: auto;">
        <style>
            .header {
                padding-top: 0;
                /* box-shadow: 0 1px 2px rgba(35, 31, 32, 0.2); */
                position: relative;
            }
        </style>
        <header class="header" id="header">
            <nav class="nav container">
                <a href="#" class="logo__item">BETI <span>®</span></a>
                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item"><a href="/Home/Shop" class="nav__item-link">SHOP</a></li>
                        <li class="nav__item"><button class="nav__item-link" id="acc-menu" style="text-transform: capitalize;"><%=session.getAttribute("fullname")%></button></li>
                    </ul>
                    <div class="acc__menu">
                        <a href="/Taikhoan/ChinhSua/<%=session.getAttribute("acc")%>" class="update__acc">Chỉnh sửa <i class='bx bx-edit-alt'></i></a>
                        <a href="/GioHang/tt/<%=session.getAttribute("acc")%>" class="basket__acc">Giỏ hàng <i class='bx bx-shopping-bag'></i></a>
                        <a href="/logout.jsp" class="lout__acc" onclick="return confirm('Đăng xuất ngay?')">Đăng xuất <i class='bx bx-log-out'></i></a>
                    </div>
                </div>
                <div class="nav__toggle" id="nav-toggle">
                    <div class="tg-one"></div>
                    <div class="tg-two"></div>
                    <div class="tg-three"></div>
                </div>
            </nav>
        </header>
        <main class="main">
            <div class="cart_bg"></div>
            <div class="cart_container container">
                <div class="nav_cart">
                    <h1 class="cart_title">Giỏ hàng của bạn</h1>
                    <a href="/Home/Shop" class="cart_to_shop">Tiếp tục mua sắm</a>
                </div>
                <div class="cart_table">
                    <div class="cart_row cart_header">
                        <p>Sản Phẩm</p>
                        <p>Số Lượng</p>
                        <p>Giá Tiền</p>
                    </div>
                    <%
                        String idkh = (String) session.getAttribute("idkh");
                        String msp = "";
                        int total = 0;
                        GioHangDAO dao = new GioHangDAO();
                        ResultSet rs = dao.getAllKH(idkh);
                        if (!rs.next()) {
                    %>
                    <P style="width:100%;text-align: center;padding: 1rem 0;">Không có sản phẩm trong giỏ</p>
                        <%
                        } else {
                        %>
                    <!-- =========== row 1 =============== -->
                    <div class="cart_row cart_body">
                        <div class="cart_row-data">
                            <div class="cart_row-img">
                                <img src="<%=rs.getString("hinhanh")%>" alt="">
                            </div>
                            <div class="cart_row-info">
                                <p class="cart_row-info-name"><%=rs.getString("tensanpham")%></p>
                                <p class="cart_row-info-id">mã sản phẩm: <span><%=rs.getInt("masanpham")%></span></p>
                            </div>
                        </div>
                        <p class="cart_row-quan">1</p>
                        <div class="cart_row_func">
                            <p class="cart_row-info-price"><%= String.format("%,.0f đ", rs.getDouble("giatien"))%></p>
                            <a href="/GioHang/Delete/<%=rs.getInt("magiohang")%>" onclick="return confirm('Bạn muốn xoá không?')" class="cart_delete"><i class='bx bxs-trash'></i></a>
                        </div>
                    </div>    
                    <%
                        msp += rs.getInt("masanpham") + ",";
                        total += rs.getInt("giatien");
                        while (rs.next()) {
                    %>
                    <!-- =========== row 1 =============== -->
                    <div class="cart_row cart_body">
                        <div class="cart_row-data">
                            <div class="cart_row-img">
                                <img src="<%=rs.getString("hinhanh")%>" alt="">
                            </div>
                            <div class="cart_row-info">
                                <p class="cart_row-info-name"><%=rs.getString("tensanpham")%></p>
                                <p class="cart_row-info-id">mã sản phẩm: <span><%=rs.getInt("masanpham")%></span></p>
                            </div>
                        </div>
                        <p class="cart_row-quan">1</p>
                        <div class="cart_row_func">
                            <p class="cart_row-info-price"><%= String.format("%,.0f đ", rs.getDouble("giatien"))%></p>
                            <a href="/GioHang/Delete/<%=rs.getInt("magiohang")%>" onclick="return confirm('Bạn muốn xoá không?')" class="cart_delete"><i class='bx bxs-trash'></i></a>
                        </div>
                    </div>

                    <%
                                msp += rs.getInt("masanpham") + ",";
                                total += rs.getInt("giatien");
                            }
                        }
                    %>

                    <!--=============== footer ============-->
                    <div class="cart_row cart_footer">
                        <h1 class="car_row-total">
                            Tổng tiền: <span><%= String.format("%,.0f đ", (double) total)%></span>
                        </h1>
                        <form action="/GioHang" method="post">
                            <input type="hidden" value="<%=idkh%>" name="txtmakh">
                            <input type="hidden" value="<%=msp%>" name="txtmasp">
                            <input type="hidden" value="<%=session.getAttribute("fullname")%>" name="txthoten">
                            <input type="hidden" value="<%=total%>" name="txttotal">
                            <input type="submit" class="cart_row-purchase" value="Đặt Hàng" onclick="return confirm('Xác nhận đặt hàng?')" name="btnOrder">
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <script src="/js/main.js"></script>
        <script src="/js/popup.js"></script>
        <%
            String altMess = (String) session.getAttribute("alertmess");
            if (altMess != null) {
        %>
        <script>
                                showAlert("<%=altMess%>");
        </script>
        <%
                session.setAttribute("alertmess", null);
            }
        %>
    </body>
</html>
