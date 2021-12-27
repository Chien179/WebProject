package com.ute.webproject.beans;

public class Category {
    private int CatID;
    private String CatName;

    public Category(){}
    public Category(int CatID, String catName){
        this.CatID = CatID;
        this.CatName = catName;
    }

    public int getCatID() {
        return CatID;
    }

    public String getCatName() {
        return CatName;
    }
}
