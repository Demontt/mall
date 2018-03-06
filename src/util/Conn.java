package util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class Conn {
    private String jdbc_url = null;
    private String mysql_username = null;
    private String mysql_password = null;
    private Connection conn;

    public Conn() {
        try {
            Properties p = new Properties();
            InputStream in = Conn.class.getClassLoader().getResourceAsStream("mysql.properties");
            p.load(in);
            String mysql_host = p.getProperty("mysql_host");
            String mysql_port = p.getProperty("mysql_port");
            String database_name = p.getProperty("database_name");
            mysql_username = p.getProperty("mysql_username");
            mysql_password = p.getProperty("mysql_password");
            jdbc_url = "jdbc:mysql://" + mysql_host + ":" + mysql_port + "/" + database_name + "?useUnicode=true&characterEncoding=utf-8";
            in.close();
        } catch (IOException e) {
        }
    }

    private void connect() throws ConnError {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbc_url, mysql_username, mysql_password);
        } catch (ClassNotFoundException | SQLException error) {
            throw new ConnError();
        }
    }

    private void disconnect() throws DisConnError {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException error) {
            throw new DisConnError();
        }
    }

    public ResultSet query(String sql) throws ConnError, DisConnError, SQLException {
        connect();
        Statement stmt = conn.createStatement();
        return stmt.executeQuery(sql);
    }

    public void update(String sql) throws ConnError, SQLException, DisConnError {
        connect();
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        disconnect();
    }

    public ResultSet queryWithPS(PreparedStatement ps) throws DisConnError, SQLException {
        return ps.executeQuery();
    }

    public void updateWithPS(PreparedStatement ps) throws SQLException, DisConnError {
        ps.executeUpdate();
        disconnect();
    }

    public PreparedStatement getPS(String sql) throws ConnError, SQLException {
        connect();
        return conn.prepareStatement(sql);
    }

    public void close() throws DisConnError {
        disconnect();
    }

}