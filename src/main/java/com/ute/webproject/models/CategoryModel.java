package com.ute.webproject.models;
import org.sql2o.Connection;
import com.ute.webproject.utils.DbUtils;
import com.ute.webproject.beans.Category;
import java.util.List;

public class CategoryModel {
    public static List<Category> findAll(){
        try (Connection con = DbUtils.getConnection()) {
            final String query = "SELECT CatName from categories group by CatID";

            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
    public static Category findById(int id) {
        final String query = "select * from categories where CatID = :CatID";
        try (Connection con = DbUtils.getConnection()) {
            List<Category> list = con.createQuery(query)
                    .addParameter("CatID", id)
                    .executeAndFetch(Category.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
}
