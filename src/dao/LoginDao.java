package dao;

import util.Conn;
import util.ConnError;
import util.DisConnError;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
    private User user;
    private Conn conn;

    public LoginDao(User user) {
        this.user = user;
        conn = new Conn();
    }

    public boolean check() {
        String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
        try {
            PreparedStatement ps = conn.getPS(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ResultSet rs = conn.queryWithPS(ps);
            int id = 0;
            while (rs.next()) {
                id = rs.getInt("id");
            }
            conn.close();
            return id != 0;
        } catch (DisConnError | ConnError | SQLException e) {
            return false;
        }
    }
}
