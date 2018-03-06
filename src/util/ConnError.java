package util;

public class ConnError extends Exception {
    public ConnError() {
        super("数据库连接失败");
    }
}