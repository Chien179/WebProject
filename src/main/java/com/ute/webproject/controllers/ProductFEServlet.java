package com.ute.webproject.controllers;

import com.mysql.cj.Session;
import com.ute.webproject.beans.*;
import com.ute.webproject.models.AuctionModel;
import com.ute.webproject.models.CategoryModel;
import com.ute.webproject.models.SellerModel;
import com.ute.webproject.utils.AccountUtils;
import com.ute.webproject.utils.ServletUtils;
import com.ute.webproject.models.ProductModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

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
                Seller seller = SellerModel.getSellerInfo(product.getSellers_idseller());
                if (product == null) {
                    ServletUtils.redirect("/Home", request, response);
                } else {
                    request.setAttribute("product", product);
                    request.setAttribute("products", proHint);
                    request.setAttribute("topBidder", topBidder);
                    request.setAttribute("seller", seller);
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
            case "/ByPrice":
                String proByMoney = request.getParameter("name");
                List<Product> byMoney = ProductModel.orderByMoney(proByMoney);
                if (byMoney.isEmpty()) {
                    ServletUtils.redirect("/Home", request, response);
                } else {
                    request.setAttribute("products", byMoney);
                    ServletUtils.forward("/views/vwProduct/ProductByCat.jsp", request, response);
                }
                break;

            case "/ByDate":
                String proByDate = request.getParameter("name");
                List<Product> byDate = ProductModel.orderByDate(proByDate);
                if (byDate.isEmpty()) {
                    ServletUtils.redirect("/Home", request, response);
                } else {
                    request.setAttribute("products", byDate);
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
        switch (path) {
            case "/Detail":
                boolean bid = (Objects.equals(request.getParameter("bid"), "true"));
                if (bid){
                    auction(request, response);
                }else {
                    AccountUtils.login(request,response);
                }
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }

    }

    private static void auction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int curPrice = Integer.parseInt(request.getParameter("curPrice"));
        int userID = Integer.parseInt(request.getParameter("userID"));
        int proID = Integer.parseInt(request.getParameter("proID"));
        int maxPrice = Integer.parseInt(request.getParameter("maxPrice"));
        int step = Integer.parseInt(request.getParameter("step"));
        Auction theBest = AuctionModel.getTheBestAuction(proID);
        Auction bidder = new Auction(maxPrice, curPrice, userID, proID, userID);

        int proPrice = 0;

        if (theBest == null){
            AuctionModel.addAuction(bidder);
            proPrice = curPrice;
        }else {
            if (theBest.getBidders_id() == bidder.getBidders_id()){
                theBest.setMaxPrice(maxPrice);
                AuctionModel.updateAuction(theBest.getMaxPrice(), theBest.getAuctionID());
                proPrice = theBest.getCurPrice();
            }else {
                if (maxPrice > theBest.getMaxPrice()){
                    bidder.setCurPrice(theBest.getMaxPrice() + step);
                    AuctionModel.addAuction(bidder);
                    proPrice = bidder.getCurPrice();
                }else {
                    theBest.setCurPrice(maxPrice);
                    bidder.setPriceHolderID(theBest.getBidders_id());
                    bidder.setCurPrice(maxPrice);
                    AuctionModel.addAuction(bidder);
                    AuctionModel.updateAuction(theBest.getMaxPrice(), theBest.getAuctionID());
                    proPrice = theBest.getCurPrice();
                }
            }
        }

        ProductModel.updatePriceAndBidder(proPrice, userID, proID);

        String url = "/Product/ByCate/Detail?id=" + proID;
        ServletUtils.redirect(url, request, response);
    }
}
