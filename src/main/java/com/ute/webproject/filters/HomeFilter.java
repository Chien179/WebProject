package com.ute.webproject.filters;

import com.ute.webproject.beans.Category;
import com.ute.webproject.beans.Product;
import com.ute.webproject.models.CategoryModel;
import com.ute.webproject.models.ProductModel;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "HomeFilter", value = "/*")
public class HomeFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        homeFilter(request);
        chain.doFilter(request, response);
    }

    public void homeFilter(ServletRequest request){
        List<Category> cat = CategoryModel.findAll();
        List<Product> list = ProductModel.findAll();
        List<Product> top5Time = ProductModel.top5Time();
        List<Product> top5Price = ProductModel.top5Price();
        List<Product> top5Turn = ProductModel.top5Turn();
        List<Product> subCate = ProductModel.subCatePro();
        request.setAttribute("products", list);
        request.setAttribute("categories", cat);
        request.setAttribute("top5Time", top5Time);
        request.setAttribute("top5Price", top5Price);
        request.setAttribute("top5Turn", top5Turn);
        request.setAttribute("subCate", subCate);
    }
}
