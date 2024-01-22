package models.entities;

import java.math.BigDecimal;

public class ShoppingCart extends Products {
    private int quantity;
    private BigDecimal price; // Sử dụng kiểu dữ liệu BigDecimal cho giá

    public ShoppingCart() {
        super();
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}