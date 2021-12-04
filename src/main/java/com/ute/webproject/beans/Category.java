package com.ute.webproject.beans;

public class Category {
    private int ProID;
    private String CatName;

    public Category(){}
    public Category(int ProID, String catName){
        this.ProID = ProID;
        this.CatName = catName;
    }

    public int getProID() {
        return ProID;
    }

    public String getCatName() {
        return CatName;
    }
}
