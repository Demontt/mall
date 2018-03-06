package dao;

import model.Good;
import util.Conn;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GoodDao {
    private Conn conn;

    public GoodDao() {
        conn = new Conn();
    }

    public Good getGood(int id) {
        String sql = "SELECT * FROM goods WHERE id = ?";
        try {
            PreparedStatement ps = conn.getPS(sql);
            ps.setInt(1, id);
            ResultSet rs = conn.queryWithPS(ps);
            id = 0;
            if (rs.next()) {
                id = rs.getInt("id");
                if (id == 0) {
                    throw new Exception();
                }
                String number = rs.getString("number");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String detail = rs.getString("detail");
                String img = rs.getString("img");
                String type = rs.getString("type");
                double price = rs.getDouble("price");
                String city = rs.getString("city");
                String weight = rs.getString("weight");
                String amount = rs.getString("amount");
                String taste = rs.getString("taste");
                String brand = rs.getString("brand");
                String hot = rs.getString("hot");
                String new_ = rs.getString("new");
                return new Good(id, number, name, description, detail, img, type, price, city, weight, amount, taste, brand, hot, new_);
            }
            conn.close();
        } catch (Exception ignored) {
        }
        return null;
    }
}
