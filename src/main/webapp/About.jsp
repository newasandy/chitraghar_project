<%--
  Created by IntelliJ IDEA.
  User: srbne
  Date: 8/17/2023
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us - Online Art Gallery</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .about-us {
            height: 100vh;
            width: 100%;
            padding: 90px 0;
            background: white;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .pic {
            height: auto;
            width: 100%;
            max-width: 500px;
            border-radius: 8%;
        }

        .about {
            width: 90%;
            max-width: 1200px;
            gap: 30px;
            display: flex;
            align-items: center;
            justify-content: space-around;

            font-family: 'Poppins', sans-serif;
        }

        .text {
            width: 100%;
            text-align: center;
        }

        .text h2 {
            font-size: 36px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .text h5 {
            font-size: 20px;
            font-weight: 500;
            margin-bottom: 20px;
        }

        .text p {
            font-size: 18px;
            margin-bottom: 1px;
            line-height: 1.6;
            letter-spacing: 1px;
        }

        .social-icons a:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<%@include file="navigationbar.jsp"%>
<section class="about-us">
    <div class="about">
        <img src="image/background.jpg" class="pic">
        <div class="text">
            <h2>About Us</h2>
            <p>Welcome to our ChitraGhar: Web Art Gallery, where creativity knows no bounds.Immerse yourself in a world of
                captivating visuals and profound emotions. Our curated collection showcases a diverse range of artistic
                masterpieces, carefully crafted by talented artists from around the globe.</p>
            <p>From awe-inspiring paintings to intricate sculptures, each piece tells a unique story. Whether you're a
                passionate art collector or a newcomer to the art scene, our gallery offers a gateway to discovering and
                acquiring extraordinary works that resonate with your soul.</p>
            <p>Explore, appreciate, and make these exceptional creations a part of your world.</p>
            <br>
            <h3>Contact us</h3><br>
            <div class=" d-flex justify-content-center">
                <a class="bg-dark text-decoration-none p-3 rounded-5 m-2" href="https://www.facebook.com/sedhaisonu" target="_blank">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                    <path style="color: #ffffff"  d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
                  </svg>
                </a>
                <a class="bg-dark text-decoration-none p-3 rounded-5 m-2" href="https://www.instagram.com/sedhaisonu/" target="_blank">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                    <path style="color: #ffffff" d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                  </svg>
                </a>
                <a class="bg-dark text-decoration-none p-3 rounded-5 m-2" href="https://mail.google.com/mail/u/0/#inbox?compose=new" target="_blank">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                    <path style="color: #ffffff" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                  </svg>
                </a>
            </div>

        </div>

    </div>

</section>
</body>
</html>
