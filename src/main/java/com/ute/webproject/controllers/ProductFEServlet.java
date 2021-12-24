package com.ute.webproject.controllers;

import com.ute.webproject.models.CategoryModel;
import com.ute.webproject.utils.ServletUtils;
import com.ute.webproject.beans.Product;
import com.ute.webproject.beans.Category;
import com.ute.webproject.models.ProductModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductFEServlet", value = "/Product/ByCate/*")
public class ProductFEServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Product";
        }
        switch (path) {
            case "/ProductByCat":
                int catId = Integer.parseInt(request.getParameter("id"));
                List<Category> cat = CategoryModel.findAll();
                List<Product> list = ProductModel.findByCatId(catId);
                request.setAttribute("products", list);
                request.setAttribute("categories", cat);
                ServletUtils.forward("/views/vwProduct/ProductByCat.jsp", request, response);
                break;

            case "/Detail":
                int proId = Integer.parseInt(request.getParameter("id"));
                Product product = ProductModel.proDetail(proId);
                if (product == null) {
                    ServletUtils.redirect("/Home", request, response);
                } else {
                    request.setAttribute("product", product);
                    ServletUtils.forward("/views/vwProduct/ProductDetail.jsp", request, response);
                }
                break;
//            case "/SubCate":
//                int proID = Integer.parseInt(request.getParameter("proid"));
//                List<Product> byPro = ProductModel.findByProID(proID);
//                request.setAttribute("products", byPro);
//                ServletUtils.forward("/views/vwProduct/ProductByCat.jsp", request, response);
//                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/WithName":
                searchPro(request, response);
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void searchPro (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proName = request.getParameter("pro");
        Product prod = ProductModel.searchPro(proName);
        if (prod != null) {
            String url = "/Home";
            ServletUtils.redirect(url, request, response);
        }

        else{
            ServletUtils.forward("/views/404.jsp", request, response);
        }
    }
}
