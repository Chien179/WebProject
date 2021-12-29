package com.ute.webproject.models;

import com.ute.webproject.beans.Seller;
import com.ute.webproject.beans.User;
import com.ute.webproject.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class SellerModel {
    public static Seller getSellerInfo(int idseller){
        final String query="select idseller, password, email, name from sellers where idseller = :idseller";

        try(Connection con = DbUtils.getConnection()){
            List<Seller> list = con.createQuery(query)
                    .addParameter("idseller", idseller)
                    .executeAndFetch(Seller.class);
            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
}
