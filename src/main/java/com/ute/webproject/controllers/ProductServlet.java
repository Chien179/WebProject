package com.ute.webproject.controllers;

import com.ute.webproject.models.CategoryModel;
import com.ute.webproject.utils.AccountUtils;
import com.ute.webproject.utils.ServletUtils;
import com.ute.webproject.beans.Product;
import com.ute.webproject.beans.Category;
import com.ute.webproject.models.ProductModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/Product/*")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Product";
        }
        switch (path) {
            case "/Product":
                ServletUtils.forward("/views/vwProduct/Product.jsp", request, response);
                break;
            case "/ProductDetail":
                ServletUtils.forward("/views/vwProduct/ProductDetail.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountUtils.login(request, response, "/views/vwProduct/Product.jsp");
    }
}
