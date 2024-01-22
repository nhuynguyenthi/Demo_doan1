package models.entities;

import java.math.BigDecimal;

public class Wishlist {
    private int id;
    private int userId;
    private String name;
    private BigDecimal price;
    private String unit;
    private int productId;

    public Wishlist(int id, String name, BigDecimal price, String unit, int userId, int productId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.unit = unit;
        this.userId = userId;
        this.productId = productId;
    }

    public Wishlist(String name, BigDecimal price, String unit, int userId, int productId) {
        this.name = name;
        this.price = price;
        this.unit = unit;
        this.userId = userId;
        this.productId = productId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
}