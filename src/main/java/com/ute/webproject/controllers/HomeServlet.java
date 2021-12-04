package com.ute.webproject.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.webproject.beans.Product;
import com.ute.webproject.beans.Category;
import com.ute.webproject.beans.User;
import com.ute.webproject.models.ProductModel;
import com.ute.webproject.models.CategoryModel;
import com.ute.webproject.models.UserModel;
import com.ute.webproject.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/Home/*")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                Index(request, response);
                break;
            case "/About":
                ServletUtils.forward("/views/vwHome/About.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        login(request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserModel.findByEmail(email);
        if (user != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            if (result.verified) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);

                String url = (String) session.getAttribute("retUrl");
                if (url == null)
                    url = "/Home";
                ServletUtils.redirect(url, request, response);
            } else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid login.");
                Index(request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            Index(request, response);
        }
    }

    private void Index (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Category> cat = CategoryModel.findAll();
        List<Product> list = ProductModel.findAll();
        request.setAttribute("products", list);
        request.setAttribute("categories", cat);
        ServletUtils.forward("/views/vwHome/Index.jsp", request, response);
    }
}
