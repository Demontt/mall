package util;

public class DisConnError extends Exception {
    public DisConnError() {
        super("数据库断开失败");
    }
}