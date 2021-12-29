package com.ute.webproject.beans;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Seller {
    private int idseller;
    private String password, name, email;
    private LocalDate Dob;
    private LocalDateTime dob, StartDate, EndDate;
    private int permission;
    private int Upgrade;

    public Seller() {
    }
    public Seller(String name, String password, int idseller, LocalDate Dob, int Upgrade){
        this.name = name;
        this.password = password;
        this.idseller = idseller;
        this.Dob = Dob;
        this.Upgrade = Upgrade;
    }
    public Seller(String password, String name, String email, LocalDateTime dob, int permission, int Upgrade){
        this.password = password;
        this.name = name;
        this.email = email;
        this.dob = dob;
        this.permission = permission;
        this.Upgrade = Upgrade;
    }

    public Seller(String name, String email, int permission, int Upgrade){
        this.name = name;
        this.email = email;
        this.permission = permission;
        this.Upgrade = Upgrade;
    }

    public int getId() {
        return idseller;
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

    public int getUpgrade() {
        return Upgrade;
    }

    public LocalDateTime getStartDate() {
        return StartDate;
    }

    public LocalDateTime getEndDate() {
        return EndDate;
    }
}
