package dao;

import util.Conn;
import util.ConnError;
import util.DisConnError;
import model.User;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SignupDao {
    private User user;
    private Conn conn;

    public SignupDao(User user) {
        this.user = user;
        conn = new Conn();
    }

    public boolean add() {
        String sql = "INSERT INTO user VALUES(null, ?,?)";
        try {
            PreparedStatement ps = conn.getPS(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            conn.updateWithPS(ps);
            conn.close();
            LoginDao loginDao = new LoginDao(user);
            return loginDao.check();
        } catch (DisConnError | ConnError | SQLException e) {
            return false;
        }
    }
}
