package model;

public class Good {
    private int id;
    private String number;
    private String name;
    private String description;
    private String detail;
    private String img;
    private String type;
    private double price;
    private String city;
    private String weight;
    private String amount;
    private String taste;
    private String brand;
    private String hot;
    private String new_;

    public Good(int id) {
        this.id = id;
    }

    public Good(int id, String number, String name, String description, String detail, String img, String type, double price, String city, String weight, String amount, String taste, String brand, String hot, String new_) {
        this.id = id;
        this.number = number;
        this.name = name;
        this.description = description;
        this.detail = detail;
        this.img = img;
        this.type = type;
        this.price = price;
        this.city = city;
        this.weight = weight;
        this.amount = amount;
        this.taste = taste;
        this.brand = brand;
        this.hot = hot;
        this.new_ = new_;
    }

    public int getId() {
        return id;
    }

    public String getNumber() {
        return number;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getDetail() {
        return detail;
    }

    public String getImg() {
        return img;
    }

    public String getType() {
        return type;
    }

    public double getPrice() {
        return price;
    }

    public String getCity() {
        return city;
    }

    public String getWeight() {
        return weight;
    }

    public String getAmount() {
        return amount;
    }

    public String getTaste() {
        return taste;
    }

    public String getBrand() {
        return brand;
    }

    public String getHot() {
        return hot;
    }

    public String getNew() {
        return new_;
    }


}
