package com.ute.webproject.beans;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.TimeUnit;

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

    public String getTimeFormat() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String timeFormat = this.EndDateTime.format(formatter);
//        LocalDateTime now = LocalDateTime.now();
//        Duration t = Duration.between(now, this.EndDateTime);
//        System.out.println(t);
//        long day = t.toDays();
//        long hour = t.toHours();
//        long minute = t.toMinutes();
////        long second = t.toSeconds();
//        System.out.println(day);
//        System.out.println(hour);
//        System.out.println(minute);
////        System.out.println(second);
//        String result = Long.toString(day) + "d " + Long.toString(hour) + "h " + Long.toString(minute) + "m "  + "s";
//        System.out.println(result);
        return timeFormat;
    }
}