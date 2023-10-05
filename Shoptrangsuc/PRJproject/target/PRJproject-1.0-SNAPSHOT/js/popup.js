function showIframe(productId) {
    var iframe = document.getElementById("show-sanpham");
    var popup = document.querySelector('.popup-area');
    var btnclose = document.getElementById("btnclosepopup");
    iframe.onload = function () {
        var iframeContent = iframe.contentDocument || iframe.contentWindow.document;
        var divTohid = iframeContent.getElementById("header");
        var divTohidd = iframeContent.getElementById("footer");
        var divTohidden = iframeContent.getElementById("mayLike");
        divTohid.style.display = "none";
        divTohidd.style.display = "none";
        divTohidden.style.display = "none";
        btnclose.style.display = "block";
        document.body.style.overflow = "hidden";
    };
    var url = "/SanPham/ChiTiet/" + productId;
    iframe.src = url;
    iframe.style.display = "block";
    popup.style.display = "block";
}

var iframe = document.getElementById("show-sanpham");
var btnclose = document.getElementById("btnclosepopup");
var popup = document.querySelector('.popup-area');
const brg = document.querySelector('.background');
if (iframe) {
    if (btnclose) {

        btnclose.addEventListener('click', () => {
            iframe.style.display = "none";
            btnclose.style.display = "none";
            document.body.style.overflow = "auto";
            popup.style.display = "none";
            brg.classList.remove('tab-hidden');
        });
        brg.addEventListener('click', () => {
            iframe.style.display = "none";
            popup.style.display = "none";
            btnclose.style.display = "none";
            brg.classList.remove('tab-hidden');
            document.body.style.overflow = "auto";
        });
    }
}

function showAlert(message) {
    // Tạo phần tử div cho alert container
    const alertContainer = document.createElement('div');
    alertContainer.classList.add('alert-container');

    // Nội dung của alert
    const gifUrl = '/img/ring.gif'; // Thay đổi đường dẫn tới ảnh GIF của bạn
    // const message = 'Đây là nội dung của thông báo!';
    const buttonText = 'Đóng';

    // Tạo phần tử ảnh GIF
    const imageElement = document.createElement('img');
    imageElement.classList.add('alert-image');
    imageElement.src = gifUrl;

    // Tạo nội dung alert
    const messageElement = document.createElement('div');
    messageElement.classList.add('alert-message');
    messageElement.textContent = message;

    const buttonElement = document.createElement('button');
    buttonElement.classList.add('alert-button');
    buttonElement.textContent = buttonText;
    buttonElement.addEventListener('click', () => {
        document.body.removeChild(alertContainer);
    });

    // Gắn các phần tử vào alert container
    alertContainer.appendChild(imageElement);
    alertContainer.appendChild(messageElement);
    alertContainer.appendChild(buttonElement);

    // Gắn alert container vào body của trang
    document.body.appendChild(alertContainer);
}



