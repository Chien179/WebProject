package com.ute.webproject.models;

import com.ute.webproject.beans.User;
import com.ute.webproject.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class UserModel {
    public static User getUserInfo(int id){
        final String query="select id, password, email, name from bidders where id = :id";
        try(Connection con = DbUtils.getConnection()){
            List<User> list = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
    public static void updateUser(User user){
        String sql="update bidders set name = :name, password = :password, dob = :dob where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("name", user.getName())
                    .addParameter("password", user.getPassword())
                    .addParameter("id", user.getId())
                    .addParameter("dob", user.getDoB())
                    .executeUpdate();
        }
    }
    public static User findByEmail(String email) {
        final String query = "select * from bidders where email = :email";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("email", email)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }

    public static void add(User c) {
        String insertSql = "INSERT INTO bidders (password, name, email, dob, permission) VALUES (:password,:name,:email,:dob,:permission)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("password", c.getPassword())
                    .addParameter("name", c.getName())
                    .addParameter("email", c.getEmail())
                    .addParameter("dob", c.getDob())
                    .addParameter("permission", c.getPermission())
                    .executeUpdate();
        }
    }

    public static void ggAdd(User c){
        String insertSql = "INSERT INTO bidders (name, email, permission) VALUES (:name,:email,:permission)";

        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("name", c.getName())
                    .addParameter("email", c.getEmail())
                    .addParameter("permission", c.getPermission())
                    .executeUpdate();
        }
    }
}
