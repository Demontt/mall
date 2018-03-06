package model;

import java.util.Iterator;
import java.util.HashMap;

public class Cart {
    private HashMap<Integer, Integer> goods;

    public Cart() {
        goods = new HashMap<>();
    }

    public void delGood(int id) {
        if (goods.containsKey(id)) {
            goods.remove(id);
        }
    }

    public void updateGood(int id, int x) {
        delGood(id);
        goods.put(id, x);
    }

    public Iterator getGoods() {
        return goods.entrySet().iterator();
    }

    public boolean isEmpty() {
        return goods.size() == 0;
    }
}
