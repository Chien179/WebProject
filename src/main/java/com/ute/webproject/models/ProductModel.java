package com.ute.webproject.models;

import com.ute.webproject.beans.Product;
import com.ute.webproject.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ProductModel {
    public static List<Product> findAll() {
        final String query = "select products.ProID, " +
                                "products.ProName, " +
                                "products.TinyDes, " +
                                "products.FullDes, " +
                                "products.Price, " +
                                "products.Quantity, " +
                                "products.StartDateTime, " +
                                "products.EndDateTime, " +
                                "products.StartPrice, " +
                                "users.name, CatID " +
                                "from products INNER JOIN users ON products.UserID = users.id INNER JOIN categories c on products.ProID = c.ProID";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).throwOnMappingFailure(false)//Tam thoi
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> subCatePro () {
        final String query = "select ProName, CatID, products.ProID from products inner join categories c on products.ProID = c.ProID";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findByCatId(int catId) {
        final String query = "select products.ProID, " +
                                "products.ProName, " +
                                "products.TinyDes, " +
                                "products.FullDes, " +
                                "products.Price, " +
                                "products.Quantity, " +
                                "products.StartDateTime, " +
                                "products.EndDateTime, " +
                                "products.StartPrice, " +
                                "users.name, CatID " +
                                "from products " +
                                "INNER JOIN users " +
                                "ON products.UserID = users.id " +
                                "INNER JOIN categories c on products.ProID = c.ProID where CatID = :CatID";
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
        final String query = "select products.ProID, " +
                "products.ProName, " +
                "products.TinyDes, " +
                "products.FullDes, " +
                "products.Price, " +
                "products.Quantity, " +
                "products.StartDateTime, " +
                "products.EndDateTime, " +
                "products.StartPrice, " +
                "users.name " +
                "from products " +
                "INNER JOIN users " +
                "ON products.UserID = users.id " +
                "INNER JOIN categories c on products.ProID = c.ProID where match(ProName) against(:proName)";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("ProName", proName).throwOnMappingFailure(false)//Tam thoi
                    .executeAndFetch(Product.class);
        }
    }
    public static Product proDetail (int proId) {
        final String query = "select products.ProID, " +
                "products.ProName, " +
                "products.TinyDes, " +
                "products.FullDes, " +
                "products.Price, " +
                "products.Quantity, " +
                "products.StartDateTime, " +
                "products.EndDateTime, " +
                "products.StartPrice, " +
                "users.name, CatID " +
                "from products " +
                "INNER JOIN users " +
                "ON products.UserID = users.id " +
                "INNER JOIN categories c on products.ProID = c.ProID where products.ProID = :ProID";
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
//    public static void update(Product p) {
//        String sql = "UPDATE products SET  ProName = :proname, TinyDes = :tinydes, FullDes = :fulldes, Price = :price, CatID = :catid, Quantity = :quantity WHERE ProID = :proid";
//        try (Connection con = DbUtils.getConnection()) {
//            con.createQuery(sql)
//                    .addParameter("proname", p.getProName())
//                    .addParameter("tinydes", p.getTinyDes())
//                    .addParameter("fulldes", p.getFullDes())
//                    .addParameter("price", p.getPrice())
//                    .addParameter("catid", p.getCatID())
//                    .addParameter("proid", p.getProID())
//                    .executeUpdate();
//        }
//    }
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
