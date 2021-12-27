package com.ute.webproject.beans;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class User {
    private int id;
    private String password, name, email;
    private LocalDate Dob;
    private LocalDateTime dob, StartDate, EndDate;
    private int permission;
    private boolean Upgrade;
    private int ProID, AuctionID;

    public User() {
    }
    public User(String name, String password, int id, LocalDate Dob){
        this.name = name;
        this.password = password;
        this.id = id;
        this.Dob = Dob;
    }
    public User(int id, String password, String name, String email, LocalDateTime dob, int permission){
        this.id = id;
        this.password = password;
        this.name = name;
        this.email = email;
        this.dob = dob;
        this.permission = permission;
    }

    public User(int id, String name, String email, int permission){
        this.id = id;
        this.name = name;
        this.email = email;
        this.permission = permission;
    }

    public int getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public LocalDateTime getDob() { return dob; }
    public LocalDate getDoB(){ return Dob; }
    public int getPermission() {
        return permission;
    }

    public boolean isUpgrade() {
        return Upgrade;
    }

    public LocalDateTime getStartDate() {
        return StartDate;
    }

    public LocalDateTime getEndDate() {
        return EndDate;
    }

    public int getProID() {
        return ProID;
    }

    public int getAuctionID() {
        return AuctionID;
    }
}
