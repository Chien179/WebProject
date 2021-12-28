package com.ute.webproject.models;

import com.ute.webproject.beans.Auction;
import com.ute.webproject.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class AuctionModel {
    public static List<Auction> topBidder(int ProID){
        final String query = "SELECT b.name, auctions.CurPrice FROM auctions " +
                            "INNER JOIN bidders b on auctions.bidders_id = b.id " +
                            "WHERE auctions.ProID=:ProID " +
                            "ORDER BY CurPrice DESC limit 5";

        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("ProID", ProID).throwOnMappingFailure(false)//Tam thoi
                    .executeAndFetch(Auction.class);
        }
    }

    public static List<Auction> addAuction(int ProID){
        final String query = "";

        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Auction.class);
        }
    }
}
