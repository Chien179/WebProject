package com.ute.webproject.models;

import com.ute.webproject.beans.Product;
import com.ute.webproject.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ProductModel {
    public static List<Product> findAll() {
        final String query = "select products.ProID," +
                            "products.ProName," +
                            "products.TinyDes," +
                            "products.FullDes," +
                            "products.Price," +
                            "products.Step," +
                            "products.Quantity, " +
                            "products.StartDateTime," +
                            "products.EndDateTime," +
                            "products.StartPrice, " +
                            "bidders.name, categories.CatID " +
                            "from products INNER JOIN bidders ON products.bidders_id=bidders.id " +
                            "INNER JOIN categories ON products.CatID = categories.CatID";

        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).throwOnMappingFailure(false)//Tam thoi
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> subCatePro () {
        final String query = "select products.ProName, c.CatID, products.ProID " +
                            "from products inner join categories c on products.CatID = c.CatID";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findByCatId(int catId) {
        final String query = "select products.ProID,  " +
                            "products.ProName," +
                            "products.TinyDes," +
                            "products.FullDes," +
                            "products.Price," +
                            "products.Step," +
                            "products.Quantity, " +
                            "products.StartDateTime," +
                            "products.EndDateTime," +
                            "products.StartPrice, " +
                            "bidders.name "+
                            "from products INNER JOIN bidders ON products.UserID = bidders.id " +
                            "INNER JOIN categories c on products.CatID = c.CatID where c.CatID = :CatID";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("CatID", catId).throwOnMappingFailure(false)//Tam thoi
                    .executeAndFetch(Product.class);
        }
    }
//    public static List<Product> findByProID(int proID) {
//        final String query = "select products.ProID," +
//                " products.ProName, " +
//                "products.TinyDes, " +
//                "products.FullDes, " +
//                "products.Price, " +
//                "products.Quantity, " +
//                "products.StartDateTime, " +
//                "products.EndDateTime, " +
//                "products.StartPrice, " +
//                "users.name " +
//                "from products " +
//                "INNER JOIN users " +
//                "ON products.UserID = users.id " +
//                "INNER JOIN categories c on products.ProID = c.ProID where products.ProID = :ProID";
//        try (Connection con = DbUtils.getConnection()) {
//            return con.createQuery(query)
//                    .addParameter("ProID", proID)//Tam thoi
//                    .executeAndFetch(Product.class);
//        }
//    }

    public static List<Product> top5Time () {
        final String query = "select * from products order by timediff(now(),EndDateTime) DESC limit 5";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> top5Price () {
        final String query = "select * from products order by Price DESC limit 5";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> top5Turn () {
        final String query = "select * from products order by Price DESC limit 5";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }
    public static List<Product> searchPro (String proName) {
        final String query ="select products.ProID," +
                            "products.ProName," +
                            "products.TinyDes," +
                            "products.FullDes," +
                            "products.Price," +
                            "products.Step," +
                            "products.Quantity, " +
                            "products.StartDateTime," +
                            "products.EndDateTime," +
                            "products.StartPrice, " +
                            "bidders.name, c.CatID " +
                            "from products INNER JOIN bidders ON products.bidders_id=bidders.id " +
                            "INNER JOIN categories c on products.CatID = c.CatID where match(ProName) against(:proName WITH QUERY EXPANSION)";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("proName", proName).throwOnMappingFailure(false)//Tam thoi
                    .executeAndFetch(Product.class);
        }
    }
    public static Product proDetail (int proId) {
        final String query = "select products.ProID," +
                            "products.ProName," +
                            "products.TinyDes," +
                            "products.FullDes," +
                            "products.Price," +
                            "products.Step," +
                            "products.Quantity, " +
                            "products.StartDateTime," +
                            "products.EndDateTime," +
                            "products.StartPrice, " +
                            "products.sellers_idseller, " +
                            "bidders.name, c.CatID " +
                            "from products INNER JOIN bidders ON products.UserID = bidders.id " +
                            "INNER JOIN categories c on products.CatID = c.CatID where products.ProID = :ProID";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> list =  con.createQuery(query)
                    .addParameter("ProID", proId).throwOnMappingFailure(false)//Tam thoi
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }

    public static List<Product> getNextTop6(int amount) {
        final String query = "select products.ProID, " +
                            "products.ProName, " +
                            "products.TinyDes, " +
                            "products.FullDes, " +
                            "products.Price, " +
                            "products.Step, " +
                            "products.Quantity, " +
                            "products.StartDateTime, " +
                            "products.EndDateTime, " +
                            "products.StartPrice, " +
                            "bidders.name, categories.CatID " +
                            "from products INNER JOIN bidders ON products.bidders_id=bidders.id " +
                            "INNER JOIN categories ON products.CatID = categories.CatID " +
                            "LIMIT "+amount+",3";

        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).throwOnMappingFailure(false)//Tam thoi
                    .executeAndFetch(Product.class);
        }
    }

//    public static Product findById(int id) {
//        final String query = "select * from products where ProID = :ProID";
//        try (Connection con = DbUtils.getConnection()) {
//            List<Product> list = con.createQuery(query)
//                    .addParameter("ProID", id)
//                    .executeAndFetch(Product.class);
//
//            if (list.size() == 0) {
//                return null;
//            }
//
//            return list.get(0);
//        }
//    }
//
//    public static void add(Product p) {
//        String insertSql = "INSERT INTO products (ProName, TinyDes, FullDes, Price, CatID, Quantity) VALUES (:proname,:tinydes,:fulldes,:price,:catid,:quantity)";
//        try (Connection con = DbUtils.getConnection()) {
//            con.createQuery(insertSql)
//                    .addParameter("proname", p.getProName())
//                    .addParameter("tinydes", p.getTinyDes())
//                    .addParameter("fulldes", p.getFullDes())
//                    .addParameter("price", p.getPrice())
//                    .addParameter("catid", p.getCatID())
//                    .addParameter("quantity", p.getQuantity())
//                    .executeUpdate();
//        }
//    }
//
    public static void updatePriceAndBidder(int price, int bidder_id, int proid) {
        String sql = "UPDATE products SET Price = :price, bidders_id = :bidder_id WHERE ProID = :proid";

        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("price", price)
                    .addParameter("proid", proid)
                    .addParameter("bidder_id", bidder_id)
                    .executeUpdate();
        }
    }

//
//    public static void delete(int id) {
//        String sql = "delete from products where ProID = :ProID";
//        try (Connection con = DbUtils.getConnection()) {
//            con.createQuery(sql)
//                    .addParameter("ProID", id)
//                    .executeUpdate();
//        }
//    }
}
