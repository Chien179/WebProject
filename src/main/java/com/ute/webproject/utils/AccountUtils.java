package com.ute.webproject.utils;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.webproject.beans.User;
import com.ute.webproject.models.UserModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

public class AccountUtils {
    public static void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

                ServletUtils.redirect(url, request, response);
            } else {
                request.setAttribute("hasError", true);
                ServletUtils.forward(convertURItoPath(url), request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            ServletUtils.forward(convertURItoPath(url), request, response);
        }
    }

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

    private static String convertURItoPath(String url){
        String[] urls = url.split("/");
        int len = urls.length;
        if(Objects.equals(urls[4], "Home")){
            if(len == 6){
                return "/views/vwHome/About.jsp";
            }else {
                return "/views/vwHome/Index.jsp";
            }
        }else {
            if (Objects.equals(urls[4], "Product")){
                if (len == 6){
                    String[] childUrl = urls[5].split("/?");
                    if (Objects.equals(childUrl[0], "Detail")){
                        return "/views/vwProduct/ProductDetail.jsp";
                    }else {
                        return "/views/vwProduct/ProductByCat.jsp";
                    }
                }else {
                    if (urls[4].equals("Product")){
                        return "/views/vwProduct/Product.jsp";
                    }else {
                        return "/views/vwProduct/ProductDetail.jsp";
                    }
                }
            }
        }
        return "/views/404.jsp";
    }
}
