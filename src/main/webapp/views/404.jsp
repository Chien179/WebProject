<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>404 Not Found</title>
   <style>
       :root{
           --primary-color: rgb(26, 183, 234);
           --text-color: #333;
       }
       body{
           cursor: default;
           margin: 0;
           padding: 0;
           font-family: sans-serif;
           min-height: 100vh;
           background-image: linear-gradient( #1ab7ea, #48c5ee, #6dd1f1, #8adaf4);
       }
       .container{
           width: 100%;
           position: absolute;
           top :50%;
           transform: translateY(-50%);
           text-align: center;
       }
       .container h2{
           font-size: 50px;
       }
       .container p{
           font-size: 30px;
       }
       .container h1{
           font-size: 200px;
           margin: 0;
           font-weight: 900;
       }
       .container a{
           text-decoration: none;
           background: var(--primary-color);
           padding: 12px 24px;
           display: inline-block;
           border-radius: 25px;
           text-transform: uppercase;
           transition: 0.4s;
           font-size: 20px;
           color: #ffffff;
       }
       .container a:hover{
           color: var(--text-color);
       }
   </style>
</head>
<body>
<div class="container">
    <h2>Oops! Page not found</h2>
    <h1>404</h1>
    <p>Sorry, an error has occured. The requested page not found.</p>
    <a href="/WebProject/Home">Go back home</a>
</div>
</body>
</html>
