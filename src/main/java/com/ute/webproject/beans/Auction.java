package com.ute.webproject.beans;

public class Auction {
    private int AuctionID, ProID, bidders_id, PriceHolderID;
    private String MaxPrice, CurPrice;
    private String name;

    public Auction(){}

    public Auction(int AuctionID, String MaxPrice, String CurPrice, int PriceHolderID, int ProID, int bidders_id, String name){
        this.AuctionID = AuctionID;
        this.MaxPrice = MaxPrice;
        this.CurPrice = CurPrice;
        this.PriceHolderID = PriceHolderID;
        this.ProID = ProID;
        this.bidders_id = bidders_id;
        this.name = name;
    }

    public int getAuctionID() {
        return AuctionID;
    }

    public String getMaxPrice() {
        return MaxPrice;
    }

    public String getCurPrice() {
        return CurPrice;
    }

    public int getPriceHolderID() {
        return PriceHolderID;
    }

    public int getProID() {
        return ProID;
    }

    public int getBidders_id() {
        return bidders_id;
    }

    public String getName() {
        return name;
    }
}
