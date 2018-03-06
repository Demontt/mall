package model;

import java.util.LinkedHashSet;
import java.util.Iterator;

public class GoodsList {
    private LinkedHashSet<Integer> goods;

    public GoodsList() {
        goods = new LinkedHashSet<>();
    }

    public Iterator getGoods() {
        return goods.iterator();
    }

    public boolean isEmpty() {
        return goods.size() == 0;
    }

    public void addGood(int good) {
        goods.add(good);
    }

}
