package com.ute.webproject.beans;

import java.time.LocalDateTime;

public class User {
    private int id;
    private String password, name, email;
    private LocalDateTime dob, StartDate, EndDate;
    private int permission;
    private boolean Upgrade;
    private int ProID, AuctionID;

    public User() {
    }

    public User(int id, String password, String name, String email, LocalDateTime dob, int permission){
        this.id = id;
        this.password = password;
        this.name = name;
        this.email = email;
        this.dob = dob;
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

    public LocalDateTime getDob() {
        return dob;
    }

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
