package com.ute.webproject.beans;

public class Category {
    private String ProName;
    private int CatID;
    private String CatName;

    public Category(){}
    public Category(String ProName, int CatID, String catName){
        this.ProName = ProName;
        this.CatID = CatID;
        this.CatName = catName;
    }

    public String getProName() {
        return ProName;
    }

    public int getCatID() {
        return CatID;
    }

    public String getCatName() {
        return CatName;
    }
}
