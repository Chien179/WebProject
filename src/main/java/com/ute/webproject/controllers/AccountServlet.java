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
                String email = request.getParameter("email");
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
            case "/Logout":
                logout(request, response);
                break;
            case "/UserUpdate":
                String nameviethoa = request.getParameter("name");
                String oldPass = request.getParameter("oldPass");
                String newPass = request.getParameter("newPass");
                int id=Integer.parseInt(request.getParameter("id"));
                DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate Dob = LocalDate.parse(request.getParameter("dob"), df);

                String email = request.getParameter("email");

                System.out.println(oldPass);
                System.out.println(newPass);
                System.out.println(email);
                System.out.println(id);
//                User user = UserModel.findByEmail(email);
//
//                BCrypt.Result checkOldPass = BCrypt.verifyer().verify(oldPass.toCharArray(), user.getPassword());
//                BCrypt.Result checkNewPass = BCrypt.verifyer().verify(newPass.toCharArray(), user.getPassword());
//
//                if (!checkOldPass.verified) {
//                    request.setAttribute("oldPassError", true);
//                    ServletUtils.forward("/views/vwAccount/User.jsp", request, response);
//                }else {
//                    if (!checkNewPass.verified){
//                        request.setAttribute("newPassError", true);
//                        ServletUtils.forward("/views/vwAccount/User.jsp", request, response);
//                    }else {
//                        User updateUser = new User(nameviethoa, BCrypt.withDefaults().hashToString(12, newPass.toCharArray()), id, Dob, 0);
//                        UserModel.updateUser(updateUser);
////                String url = request.getHeader("referer");
//                        ServletUtils.redirect("/Home", request, response);
//                    }
//                }
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

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new User());

        String url = request.getHeader("referer");

        ServletUtils.redirect(url, request, response);
    }
}




