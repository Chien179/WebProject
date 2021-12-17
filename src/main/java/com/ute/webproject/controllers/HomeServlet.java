package com.ute.webproject.controllers;

import com.ute.webproject.beans.Product;
import com.ute.webproject.beans.Category;
import com.ute.webproject.beans.User;
import com.ute.webproject.models.ProductModel;
import com.ute.webproject.models.CategoryModel;
import com.ute.webproject.models.UserModel;
import com.ute.webproject.utils.AccountUtils;
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
                ServletUtils.forward("/views/vwHome/Index.jsp", request, response);
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
        AccountUtils.login(request, response, "/views/vwHome/Index.jsp");
    }
}
