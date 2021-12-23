package com.ute.webproject.filters;

import com.ute.webproject.beans.Category;
import com.ute.webproject.beans.Product;
import com.ute.webproject.models.CategoryModel;
import com.ute.webproject.models.ProductModel;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "ProductFilter", value = "/*")
public class ProductFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        productFilter(request);
        chain.doFilter(request, response);
    }

    public void productFilter(ServletRequest request){
        List<Category> cat = CategoryModel.findAll();
        List<Product> list = ProductModel.findAll();
        List<Product> subCate = ProductModel.subCatePro();
        request.setAttribute("products", list);
        request.setAttribute("categories", cat);
        request.setAttribute("subCate", subCate);
    }
}
