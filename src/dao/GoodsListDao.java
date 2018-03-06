package dao;

import model.GoodsSearch;
import model.GoodsList;
import util.Conn;

import java.sql.ResultSet;

public class GoodsListDao {
    private Conn conn;

    public GoodsListDao() {
        conn = new Conn();
    }

    public GoodsList getGoodsList(GoodsSearch goodSearch) {
        String sql = "SELECT * FROM goods" + goodSearch;
        GoodsList goodsList = new GoodsList();
        try {
            ResultSet rs = conn.query(sql);
            int id = 0;
            while (rs.next()) {
                id = rs.getInt("id");
                if (id == 0) {
                    throw new Exception();
                } else {
                    goodsList.addGood(id);
                }
            }
            conn.close();
        } catch (Exception ignored) {
        }
        return goodsList;
    }
}
