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

    public static void addAuction(Auction a){
        final String query = "INSERT INTO auctions (AuctionID, MaxPrice, CurPrice, PriceHolderID, ProID, bidders_id) " +
                            "VALUES (:auctionid,:maxprice,:curprice,:priceholderid,:proid,:biddersId)";

        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("auctionid", a.getAuctionID())
                    .addParameter("maxprice", a.getMaxPrice())
                    .addParameter("curprice", a.getCurPrice())
                    .addParameter("priceholderid", a.getPriceHolderID())
                    .addParameter("proid", a.getProID())
                    .addParameter("biddersId", a.getBidders_id())
                    .executeUpdate();
        }
    }

    public static void updateAuction(int maxPrice, int auctionID){
        final String query = "UPDATE auctions SET  MaxPrice = :maxprice WHERE AuctionID = :auctionid;";

        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("auctionid", auctionID)
                    .addParameter("maxprice", maxPrice)
                    .executeUpdate();
        }
    }

    public static Auction getTheBestAuction(int ProID){
        final String query = "SELECT AuctionID, MAX(MaxPrice) as MaxPrice, CurPrice, PriceHolderID, ProID, bidders_id " +
                            "FROM auctions WHERE ProID = :proid GROUP BY ProID";

        try (Connection con = DbUtils.getConnection()) {
            List<Auction> list = con.createQuery(query)
                    .addParameter("proid", ProID).throwOnMappingFailure(false)
                    .executeAndFetch(Auction.class);
            if (list.size() == 0){
                return null;
            }

            return list.get(0);
        }
    }
}
