package models.entities;

import java.math.BigDecimal;

public class Products {
    private int id;
    private String name;
    private String category;
    private BigDecimal price;
    private String unit;
    private int availableQty;
    private String description;

    public Products(int id, String name, String category, BigDecimal price, String unit, int availableQty, String description) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.unit = unit;
        this.availableQty = availableQty;
        this.description = description;
    }

    public Products(String name, String category, BigDecimal price, String unit, int availableQty, String description) {
        this.name = name;
        this.category = category;
        this.price = price;
        this.unit = unit;
        this.availableQty = availableQty;
        this.description = description;
    }

    public Products() {

    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
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

    public int getAvailableQty() {
        return availableQty;
    }

    public String getDescription() {
        return description;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCategory(String category) {
        this.category = category;
    }


    public void setUnit(String unit) {
        this.unit = unit;
    }

    public void setAvailableQty(int availableQty) {
        this.availableQty = availableQty;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
