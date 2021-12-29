package com.ute.webproject.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.webproject.beans.User;
import com.ute.webproject.models.UserModel;
import com.ute.webproject.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "AccountServlet", value = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                ServletUtils.forward("/views/vwAccount/Register.jsp", request, response);
                break;

            case "/IsAvailable":
                String email = request.getParameter("user");
                User user = UserModel.findByEmail(email);
                boolean isAvailable = (user == null);

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(isAvailable);
                out.flush();
                break;
            case "/User":
                int id = Integer.parseInt(request.getParameter("id"));
                User userpass = UserModel.getUserInfo(id);
                request.setAttribute("users", userpass);
                ServletUtils.forward("/views/vwAccount/User.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                registerUser(request, response);
                break;
            case "/Login":
                login(request, response);
                break;
            case "/Logout":
                logout(request, response);
                break;
            case "/UserUpdate":
                String nameviethoa = request.getParameter("name");
                String password = request.getParameter("password");
                int id=Integer.parseInt(request.getParameter("id"));
                DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate Dob = LocalDate.parse(request.getParameter("dob"), df);
                User user = new User(nameviethoa, password, id, Dob, 0);
                UserModel.updateUser(user);
//                String url = request.getHeader("referer");
                ServletUtils.redirect("/Home", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }


    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rawpwd = request.getParameter("rawpwd");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());

        String strDob = request.getParameter("dob") + " 00:00";
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime dob = LocalDateTime.parse(strDob, df);

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int permission = 0;

        User c = new User(bcryptHashString, name, email, dob, permission, 0);
        UserModel.add(c);
        ServletUtils.redirect("/Home", request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (Objects.equals(email, "") && Objects.equals(password, "")){
            email = ggLogin(request, response);
        }

        User user = UserModel.findByEmail(email);
        HttpSession session = request.getSession();
        String url = request.getHeader("referer");
        if (user != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            if (result.verified) {
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);
            } else {
                session.setAttribute("hasError", true);
            }
        } else {
            session.setAttribute("hasError", true);
        }
        ServletUtils.redirect(url, request, response);
    }

//    private static String convertURItoPath(String url){
//        String[] urls = url.split("/");
//        int len = urls.length;
//        if(Objects.equals(urls[4], "Home")){
//            if(len == 6){
//                return "/views/vwHome/About.jsp";
//            }else {
//                return "/views/vwHome/Index.jsp";
//            }
//        }else {
//            if (Objects.equals(urls[4], "Product")){
//                if (len == 6){
//                    String[] childUrl = urls[5].split("/?");
//                    if (Objects.equals(childUrl[0], "Detail")){
//                        return "/views/vwProduct/ProductDetail.jsp";
//                    }else {
//                        return "/views/vwProduct/ProductByCat.jsp";
//                    }
//                }else {
//                    if (urls[4].equals("Product")){
//                        return "/views/vwProduct/Product.jsp";
//                    }else {
//                        return "/views/vwProduct/ProductDetail.jsp";
//                    }
//                }
//            }
//        }
//        return "/views/404.jsp";
//    }

    private static String ggLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("gg-name");
        String image = request.getParameter("gg-image");
        String email = request.getParameter("gg-email");

        User user = UserModel.findByEmail(email);
        if (user == null){
            int permission = 0;

            User c = new User(name, email, permission, 0);
            UserModel.ggAdd(c);
        }

        return email;
    }



    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new User());

        String url = request.getHeader("referer");

        ServletUtils.redirect(url, request, response);
    }
}




