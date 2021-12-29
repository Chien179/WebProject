package com.ute.webproject.controllers;

import com.ute.webproject.beans.Auction;
import com.ute.webproject.models.AuctionModel;
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
                List<Product> proHint = ProductModel.findAll();
                List<Auction> topBidder = AuctionModel.topBidder(proId);
                if (product == null) {
                    ServletUtils.redirect("/Home", request, response);
                } else {
                    request.setAttribute("product", product);
                    request.setAttribute("products", proHint);
                    request.setAttribute("topBidder", topBidder);
                    ServletUtils.forward("/views/vwProduct/ProductDetail.jsp", request, response);
                }
                break;
            case "/WithName":
                String proName = request.getParameter("name");
                List<Category> cate = CategoryModel.findAll();
                List<Product> search = ProductModel.searchPro(proName);
                if (search.isEmpty()) {
                    ServletUtils.redirect("/Home", request, response);
                } else {
                    request.setAttribute("products", search);
                    request.setAttribute("categories", cate);
                    ServletUtils.forward("/views/vwProduct/ProductByCat.jsp", request, response);
                }
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        System.out.println("test");
        switch (path) {
            case "/Detail":
                int bid = Integer.parseInt(request.getParameter("bid"));
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
}
