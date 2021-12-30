package com.ute.webproject.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.webproject.beans.Product;
import com.ute.webproject.beans.User;
import com.ute.webproject.models.ProductModel;
import com.ute.webproject.models.UserModel;
import com.ute.webproject.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "LoadMoreServlet", value = "/Load")
public class LoadMoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int amount = Integer.parseInt(request.getParameter("exists"));
        List<Product> top6 = ProductModel.getNextTop6(amount);
        PrintWriter out = response.getWriter();

        for (Product p : top6) {
            out.println("<div class=\"product card card border-secondary h-60 product__body-item\">\n" +
                    "                            <img class=\"product__body-img\" src=\"/WebProject/Img/"+p.getProName()+"/1_thumbs.png\" alt=\""+p.getProName()+"\" onclick=\"location.href='/WebProject/Product/ByCate/Detail?id="+p.getProID()+"'\"/>\n" +
                    "                            <div class=\"card-body product__body-img-body\">\n" +
                    "                                <h1 class=\"card-title pt-0 txtOverflow product__body-img-heading\">"+p.getProName()+"</h1>\n" +
                    "                                <p class=\"card-text card-text-config product__body-img-date\">Ngày đăng: "+p.getStartDateTime()+"<span><button class=\"float-end buy-button\"><i class=\"fas fa-cart-plus\"></i> Mua ngay</button></span></p>\n" +
                    "                                <p class=\"card-text card-text-config product__body-img-info-type\">BID HIỆN TẠI <span class=\"float-end\">THỜI GIAN CÒN LẠI</span></p>\n" +
                    "                                <p class=\"card-text card-text-config martop product__body-img-info\">"+ NumberFormat.getCurrencyInstance().format(p.getPrice())+"\n" +
                    "                                    <span hidden class=\"time\">"+p.getTimeFormat()+"</span>\n" +
                    "                                    <span class=\"remaining float-end\" style=\"color: black\"></span>\n" +
                    "                                </p>\n" +
                    "                                <p class=\"card-text card-text-config product__body-img-bid-price-type\">SỐ LƯỢT RA GIÁ<span class=\"float-end\">BIDDER CAO NHẤT</span></p>\n" +
                    "                                <p class=\"card-text card-text-config martop product__body-img-bid-price\">"+p.getTurn()+"<span class=\"float-end\">"+"***"+p.getName().substring(p.getName().length()/2)+"</span></p>\n" +
                    "                            </div>\n" +
                    "                        </div>\n");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}



