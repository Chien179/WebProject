package com.ute.webproject.utils;

import com.ute.webproject.beans.User;
import com.ute.webproject.models.UserModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

public class AccountUtils {
    public static void login(HttpServletRequest request, HttpServletResponse response, String dir) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("in");

        if (Objects.equals(email, "") && Objects.equals(password, "")){
            email = ggLogin(request, response);
        }

        User user = UserModel.findByEmail(email);
        if (user != null) {
            if (password.equals(user.getPassword()) || password.equals("")) {
                System.out.println("test");
//            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
//            if (result.verified) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);

                ServletUtils.redirect(dir, request, response);
            } else {
                request.setAttribute("hasError", true);
                ServletUtils.forward(dir, request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            ServletUtils.forward(dir, request, response);
        }
    }

    private static String ggLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("gg-name");
        String image = request.getParameter("gg-image");
        String email = request.getParameter("gg-email");

        User user = UserModel.findByEmail(email);
        if (user == null){
            System.out.println("create");

            int permission = 0;

            User c = new User(0, name, email, permission);
            UserModel.ggAdd(c);
        }

        return email;
    }
}
