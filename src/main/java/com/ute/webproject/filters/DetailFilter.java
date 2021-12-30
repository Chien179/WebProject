package com.ute.webproject.filters;

import com.ute.webproject.beans.Auction;
import com.ute.webproject.beans.Product;
import com.ute.webproject.beans.Seller;
import com.ute.webproject.models.AuctionModel;
import com.ute.webproject.models.ProductModel;
import com.ute.webproject.models.SellerModel;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "DetailFilter")
public class DetailFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        int proId = Integer.parseInt(request.getParameter("id"));
        Product product = ProductModel.proDetail(proId);
        List<Product> proHint = ProductModel.findAll();
        List<Auction> topBidder = AuctionModel.topBidder(proId);
        Seller seller = SellerModel.getSellerInfo(product.getSellers_idseller());

        request.setAttribute("product", product);
        request.setAttribute("products", proHint);
        request.setAttribute("topBidder", topBidder);
        request.setAttribute("seller", seller);

        chain.doFilter(request, response);
    }
}
