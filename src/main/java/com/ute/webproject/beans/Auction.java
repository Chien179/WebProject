package com.ute.webproject.beans;

public class Auction {
    private int AuctionID, ProID, bidders_id, PriceHolderID;
    private int MaxPrice, CurPrice;
    private String name;

    public Auction(){}

    public Auction(int MaxPrice, int CurPrice, int PriceHolderID, int ProID, int bidders_id){
        this.MaxPrice = MaxPrice;
        this.CurPrice = CurPrice;
        this.PriceHolderID = PriceHolderID;
        this.ProID = ProID;
        this.bidders_id = bidders_id;
    }

    public void setCurPrice(int curPrice) {
        CurPrice = curPrice;
    }

    public void setPriceHolderID(int priceHolderID) {
        PriceHolderID = priceHolderID;
    }

    public void setMaxPrice(int maxPrice) {
        MaxPrice = maxPrice;
    }

    public int getAuctionID() {
        return AuctionID;
    }

    public int getMaxPrice() {
        return MaxPrice;
    }

    public int getCurPrice() {
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
