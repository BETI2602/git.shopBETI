<%-- 
    Document   : trangchu
    Created on : Jun 4, 2023, 10:37:43 AM
    Author     : ddand
--%>

<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="DAOs.SanPhamDAO"%>
<%@page import="Models.KhachHang"%>
<%@page import="DAOs.KhachHangDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="/css/style.css">
        <title>Trang chủ - BETI</title>
    </head>
    <body>
        <div class="loader">
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
        <%
            if (session.getAttribute("acc") == null) {
                Cookie[] cookies = request.getCookies();
                String fullname = null;
                if (cookies != null) {
//                if (session.getAttribute("acc") == null) {
//                    response.sendRedirect("/");
//                }
//            } else {

                    boolean flag = false;
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("acc") && !cookie.getValue().equals("")) {
                            flag = true;
                            session.setAttribute("acc", cookie.getValue());
                            break;
                        }
                    }
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("fullname")) {
                            fullname = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8.toString());
                            session.setAttribute("fullname", fullname);
                            break;
                        }
                    }
                    if (!flag) {
                        response.sendRedirect("/");
                    }

                }
            }
        %>
        <header class="header" id="header">
            <nav class="nav container">
                <a href="<%= getServletContext().getContextPath()%>/Home/Trangchu" class="logo__item">BETI <span>®</span></a>
                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item"><a href="/Home/Shop" class="nav__item-link">SẢN PHẨM</a></li>
                        <li class="nav__item"><a href="#featured" class="nav__item-link">NỔI BẬT</a></li>
                        <li class="nav__item"><a href="#about" class="nav__item-link">GIỚI THIỆU</a></li>
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
            <div class="background"></div>
            <section class="home">
                <div class="home__content container">
                    <h2 class="home__subtitle">Khám phá điều tuyệt nhất</h2>
                    <h1 class="home__title">Bắt tay vào hành trình <br>
                        để tiết lộ sự quyến rũ <br>
                        vẻ đẹp của bạn</h1>
                    <a href="#featured" class="home__link">Khám phá ngay</a>    
                </div>
                <div class="home__container swiper-container">
                    <div class="home_wrap swiper-wrapper">
                        <!-- img 1 -->
                        <div class="home_slide swiper-slide">
                            <img src="/img/z4427798844403_2eb531fdcffb44d6956b3522cea4c5ee.jpg" alt="" class="home_slide-img">
                        </div>
                        <!-- img 2 -->
                        <div class="home_slide swiper-slide">
                            <img src="/img/z4427798841244_5e829ce037b870e01195bed04617c493.jpg" alt="" class="home_slide-img">
                        </div>
                        <!-- img 3 -->
                        <div class="home_slide swiper-slide">
                            <img src="/img/z4427798827121_9f84a5eb371ef551a40cb3cf6a3db225.jpg" alt="" class="home_slide-img">
                        </div>
                    </div>
                </div>
            </section>
            <section class="section attractive" id="featured">
                <h1 class="attractive_title">Sản phẩm nổi bật</h1>
                <div class="attractive__container grid">
                    <%
                        SanPhamDAO dao = new SanPhamDAO();
                        ResultSet rs = dao.getAllSanPham();
                        int i = 0;
                        int count = 0;
                        int arr[] = {2, 3, 4, 11, 12, 14, 17, 18};
                        while (i < 8) {
                            rs.next();
                            count++;
                            if (count == arr[i]) {
                    %>
                    <div class="popup-area">
                        <button class="popup-area-button" id="btnclosepopup">x</button>
                        <iframe src="" class="popup-sanpham"  id="show-sanpham"></iframe>
                    </div>
                    <!-- ======================== card 1 =================== -->
                    <div class="attractive_card">
                        <div class="attactive_img" >
                            <a href="/SanPham/ChiTiet/<%= rs.getString("masanpham")%>"><img src="<%=rs.getString("hinhanh")%>" alt=""></a>
                        </div>
                        <div class="attactive_info">
                            <button onclick="showIframe('<%= rs.getString("masanpham")%>');document.querySelector('.background').classList.add('tab-hidden');" class="attactive_info-cart"><i class='bx bx-show-alt'></i></button>
                            <a href="/GioHang/New/<%=session.getAttribute("acc")%>/<%=rs.getString("masanpham")%>" class="attactive_info-see"><i class='bx bxs-cart-add'></i></a>
                        </div>
                        <div class="attactive_data">
                            <a href="/SanPham/ChiTiet/<%= rs.getString("masanpham")%>" class="attactive_name"><%= rs.getString("tensanpham")%></a>
                            <p class="attactive_price"><%= String.format("%,.0f đ", rs.getDouble("giatien"))%></p>
                        </div>
                    </div>
                    <%
                                i++;
                            }
                        }
                    %>

                </div>
            </section>
            <section class="section about" id="about">
                <div class="about__line"></div>
                <div class="about__container container">
                    <div class="about__data">
                        <div class="about__content about__contentleft">
                            <h1 class="about__title">Về thương hiệu BETI<sup>®</sup> </h1>
                            <p class="about_description">
                                Chúng tôi tự hào là thương hiệu trang sức hàng đầu, mang đến cho khách hàng những món đồ đẹp
                                và chất lượng cao, kết hợp giữa phong cách hiện đại và tinh hoa truyền thống.
                            </p>
                        </div>
                        <div class="about__img about__imgright">
                            <img src="/img/SHK5.png" alt="" class="about__img-img">
                        </div>
                    </div>
                    <div class="about__data">
                        <div class="about__img about__imgleft">
                            <img src="/img/about-us3.jpg" alt="" class="about__img-img">
                        </div>
                        <div class="about__content about__contentright">
                            <h1 class="about__title">Thiết kế độc quyền từ hàn quốc</h1>
                            <p class="about_description">
                                Với sự kết hợp giữa sự tinh tế và sự sáng tạo từ Hàn Quốc, chúng tôi mang đến những thiết kế
                                trang sức độc đáo, không chỉ làm nổi bật cái đẹp tự nhiên của người đeo, mà còn thể hiện cái
                                tâm hồn và cái tôi riêng biệt
                            </p>
                        </div>
                    </div>
                    <div class="about__data">
                        <div class="about__content about__contentleft">
                            <h1 class="about__title">Dịch vụ chuyên nghiệp và tận tâm</h1>
                            <p class="about_description">
                                Tại cửa hàng trang sức của chúng tôi, chúng tôi tận tâm phục vụ và đảm bảo chất lượng vượt
                                trội trong mỗi sản phẩm. Với đội ngũ thợ lành nghề và sự kết hợp giữa truyền thống và sáng
                                tạo, chúng tôi mang đến những tác phẩm trang sức đẹp tựa như những kiệt tác nghệ thuật. </p>
                            <p class="about_description">
                                Với đội ngũ nhân viên tận tâm và giàu kinh nghiệm, chúng tôi cam kết mang đến dịch vụ chuyên
                                nghiệp, từ tư vấn chọn lựa đến bảo hành sản phẩm, để khách hàng cảm nhận sự tận hưởng và tin
                                tưởng tuyệt đối khi mua sắm tại cửa hàng của chúng tôi.
                            </p>
                        </div>
                        <div class="about__img about__imgright">
                            <img src="/img/aboutus-2.jpg" alt="" class="about__img-img">
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <footer class="footer">
            <div class="footer__container container">
                <div class="footer__info">
                    <div class="footer__logo">
                        <h1>BETI<span>®</span></h1>
                    </div>
                    <div class="footer__social">
                        <a href="#" class="footer__social-link"><i class='bx bxl-facebook-square' ></i></a>
                        <a href="#" class="footer__social-link"><i class='bx bxl-instagram-alt' ></i></a>
                        <a href="#" class="footer__social-link"><i class='bx bxs-envelope' ></i></a>
                        <a href="#" class="footer__social-link"><i class='bx bxl-tiktok' ></i></a>
                    </div>
                </div>
                <div class="footer__content grid">
                    <div class="footer__data">
                        <h2 class="footer__title">Hỗ Trợ Khách Hàng</h2>
                        <ul class="footer__list">
                            <li class="footer__item"><a href="#" class="footer__link">Chính sách thanh toán</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Chính sách đổi trả</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Chính sách vận chuyển</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Hướng dẫn mua hàng</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Chính sách bảo mật</a></li>
                        </ul>
                    </div>
                    <div class="footer__data">
                        <h2 class="footer__title ft_2">Liên Kết</h2>
                        <ul class="footer__list">
                            <li class="footer__item"><a href="#" class="footer__link">Về BOTI</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">NEWs/EVENTS</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Hỗ trợ kỹ thuật</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Điều khoản sử dụng</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Liên Hệ</a></li>
                        </ul>
                    </div>
                    <div class="footer__data">
                        <h2 class="footer__title">Thông tin chi tiết</h2>
                        <ul class="footer__list">
                            <li class="footer__item"><p class="footer__link">Shop trang sức BOTI</p></li>
                            <li class="footer__item"><p class="footer__link">Số 35, Phạm Ngũ Lão, <br> Quận Tân Bình, <br> TP Hồ Chí Minh</p></li>
                            <li class="footer__item"><p class="footer__link">Đã được chứng nhận <br> bởi bộ trang sức</p></li>
                            <li class="footer__item"><p class="footer__link">Tel: 0848882371</p></li>
                            <li class="footer__item"><p class="footer__link">Email: boti.work@gmail.com</p></li>
                        </ul>
                    </div>
                </div>
                <div class="footer__right">
                    <img src="https://bobui.vn/assets/img/logoSaleNoti.png" alt="" class="footer__right-img">
                    <p class="footer__right-p">COPYRIGHT © 2022 BETI<span>®</span> ALL RIGHT RESERVED.</p>
                </div>
            </div>
        </footer>
        <a class="scroll__up" id="scroll-up" href="#">
            <i class='bx bx-arrow-to-top'></i>
        </a>
        <script src="/js/scrollreveal.min.js"></script>
        <script src="/js/swiper-bundle.min.js"></script>
        <script src="/js/popup.js"></script>
        <script src="/js/main.js"></script>
        <%
            String alrtMess = (String) session.getAttribute("alertMess");
            if (alrtMess != null && !alrtMess.isEmpty()) {
        %>
        <script>
                                showAlert("<%=alrtMess%>");
                                
        </script>
        <%
            session.setAttribute("alertMess", null);
            }
        %>
    </body>
</html>
