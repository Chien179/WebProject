package com.ute.webproject.models;
import com.ute.webproject.beans.Product;
import org.sql2o.Connection;
import com.ute.webproject.utils.DbUtils;
import com.ute.webproject.beans.Category;
import java.util.List;

    public class CategoryModel {
        public static List<Category> findAll(){
            try (Connection con = DbUtils.getConnection()) {
                final String query = "SELECT CatID, CatName from categories inner join products p on categories.ProID = p.ProID group by CatID";

                return con.createQuery(query)
                        .executeAndFetch(Category.class);
            }
        }
//    public static List<Category> subCatePro () {
//        final String query = "select ProName, CatID from categories inner join products p on categories.ProID = p.ProID";
//        try (Connection con = DbUtils.getConnection()) {
//            return con.createQuery(query)
//                    .executeAndFetch(Category.class);
//        }
//    }

}
