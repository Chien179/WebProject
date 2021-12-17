package com.ute.webproject.utils;

import com.ute.webproject.beans.User;
import com.ute.webproject.models.UserModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AccountUtils {
    public static void login(HttpServletRequest request, HttpServletResponse response, String dir) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserModel.findByEmail(email);
        if (user != null) {
            if (password.equals(user.getPassword())) {
//            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
//            if (result.verified) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);

//                String url = (String) session.getAttribute("retUrl");
                String url = "/Home";
//                if (url == null)
//                    url = "/Home";
                ServletUtils.redirect(url, request, response);
            } else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid login.");
                ServletUtils.forward(dir, request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward(dir, request, response);
        }
    }
}
