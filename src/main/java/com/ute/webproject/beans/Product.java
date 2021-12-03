package com.ute.webproject.beans;

import java.time.LocalDateTime;

public class Product {
    private int ProID;
    private String ProName, TinyDes, FullDes;
    private int Price, Quantity, UserID;
    private LocalDateTime StartDateTime, EndDateTime;
    private int rate;
    private String CMT;
    private int StartPrice, Step;
    private boolean auto;
    private String name;

    public Product (){

    }

    public Product (int ProID, String ProName, String TinyDes, String FullDes, int Price, int Quantity, int UserID, LocalDateTime StartDateTime, LocalDateTime EndDateTime, int rate, String CMT, int StartPrice, int Step, boolean auto, String name){
        this.ProID = ProID;
        this.ProName = ProName;
        this.TinyDes = TinyDes;
        this.FullDes = FullDes;
        this.Price = Price;
        this.Quantity = Quantity;
        this.UserID = UserID;
        this.StartDateTime = StartDateTime;
        this.EndDateTime = EndDateTime;
        this.rate = rate;
        this.CMT = CMT;
        this.StartPrice = StartPrice;
        this.Step = Step;
        this.auto = auto;
        this.name = name;
    }

    public int getProID() {
        return ProID;
    }

    public String getProName() {
        return ProName;
    }

    public String getTinyDes() {
        return TinyDes;
    }

    public String getFullDes() {
        return FullDes;
    }

    public int getPrice() {
        return Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public int getUserID() {
        return UserID;
    }

    public LocalDateTime getStartDateTime() {
        return StartDateTime;
    }

    public LocalDateTime getEndDateTime() {
        return EndDateTime;
    }

    public int getRate() {
        return rate;
    }

    public String getCMT() {
        return CMT;
    }

    public int getStartPrice() {
        return StartPrice;
    }

    public int getStep() {
        return Step;
    }

    public boolean isAuto() {
        return auto;
    }

    public String getName() {
        return name;
    }
}