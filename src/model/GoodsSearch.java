package model;

public class GoodsSearch {
    private String name;
    private String type;
    private String price;
    private String city;
    private String taste;
    private String brand;
    private String hot;
    private String new_;
    private String sort;
    private String everything;

    public GoodsSearch(String everything) {
        this.everything = everything;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setPrice(String x, String y) {
        this.price = " PRICE BETWEEN " + x + " AND " + y;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setTaste(String taste) {
        this.taste = taste;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setHot(int hot) {
        this.hot = String.valueOf(hot);
    }

    public void setNew_(int new_) {
        this.new_ = String.valueOf(new_);
    }

    public void setSort(String sort, String type) {
        if (!sort.equals("price") && !sort.equals("amount") && !type.equals("DESC") && !type.equals("ASC")) {
            return;
        }
        this.sort = " ORDER BY " + sort + " " + type;
    }

    @Override
    public String toString() {
        if (everything.equals("*")) {
            return "";
        }
        String init = " WHERE";
        StringBuilder str = new StringBuilder(init);
        if (name != null) {
            if (str.toString().equals(init)) {
                str.append(" NAME LIKE '%" + name + "%'");
            } else {
                str.append(" AND NAME LIKE '%" + name + "%'");
            }
        }
        if (type != null) {
            if (str.toString().equals(init)) {
                str.append(" TYPE LIKE '%" + type + "%'");
            } else {
                str.append(" AND TYPE LIKE '%" + type + "%'");
            }
        }
        if (price != null) {
            if (str.toString().equals(init)) {
                str.append(price);
            } else {
                str.append(" AND" + price);
            }
        }
        if (city != null) {
            if (str.toString().equals(init)) {
                str.append(" CITY LIKE '%" + city + "%'");
            } else {
                str.append(" AND CITY LIKE '%" + city + "%'");
            }
        }
        if (taste != null) {
            if (str.toString().equals(init)) {
                str.append(" TASTE LIKE '%" + taste + "%'");
            } else {
                str.append(" AND TASTE LIKE '%" + taste + "%'");
            }
        }
        if (brand != null) {
            if (str.toString().equals(init)) {
                str.append(" BRAND LIKE '%" + brand + "%'");
            } else {
                str.append(" AND BRAND LIKE '%" + brand + "%'");
            }
        }
        if (hot != null) {
            if (str.toString().equals(init)) {
                str.append(" HOT = " + hot);
            } else {
                str.append(" AND HOT = " + hot);
            }
        }
        if (new_ != null) {
            if (str.toString().equals(init)) {
                str.append(" NEW = " + new_);
            } else {
                str.append(" AND NEW = " + new_);
            }
        }
        if (price != null) {
            if (str.toString().equals(init)) {
                str.append(price);
            } else {
                str.append(" AND" + price);
            }
        }
        if (sort != null) {
            if (str.toString().equals(init)) {
                str = new StringBuilder(sort);
            } else {
                str.append(sort);
            }
        }
        return str.toString();
    }
}
