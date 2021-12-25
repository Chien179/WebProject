package com.ute.webproject.models;

import com.ute.webproject.beans.User;
import com.ute.webproject.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class UserModel {
    public static User getUserInfo(int id){
        final String query="select id, password, email, name from users where id = :id";
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
        String sql="update users set name = :name, password = :password where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("name", user.getName())
                    .addParameter("password", user.getPassword())
                    .addParameter("id", user.getId())
                    .executeUpdate();
        }
    }
    public static User findByEmail(String email) {
        final String query = "select * from users where email = :email";
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
        String insertSql = "INSERT INTO users (username, password, name, email, dob, permission) VALUES (:username,:password,:name,:email,:dob,:permission)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("email", c.getEmail())
                    .addParameter("password", c.getPassword())
                    .addParameter("name", c.getName())
                    .addParameter("email", c.getEmail())
                    .addParameter("dob", c.getDob())
                    .addParameter("permission", c.getPermission())
                    .executeUpdate();
        }
    }
}
