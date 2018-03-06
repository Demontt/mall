package dao;

import model.AnalysisSearch;
import util.Conn;

import java.sql.ResultSet;

public class AnalysisSearchDao {
    Conn conn;

    public AnalysisSearchDao() {
        conn = new Conn();
    }

    public AnalysisSearch getResult(AnalysisSearch analysisSearch) {
        String sql = "SELECT " + analysisSearch.getSearch() + " FROM goods GROUP BY " + analysisSearch.getSearch();
        AnalysisSearch result = new AnalysisSearch(analysisSearch.getSearch());
        try {
            ResultSet rs = conn.query(sql);
            String res = null;
            while (rs.next()) {
                res = rs.getString(analysisSearch.getSearch());
                if (res == null) {
                    throw new Exception();
                } else {
                    result.addResult(res);
                }
            }
            conn.close();
        } catch (Exception ignored) {
        }
        return result;
    }
}
