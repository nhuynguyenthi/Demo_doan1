package models.entities;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

public class Order {
    private int id;
    private String orderNumber;
    private int userId;
    private BigDecimal total;
    private String orderDate;

    public Order(String orderNumber, int userId, BigDecimal total) {
        this.orderNumber = orderNumber;
        this.userId = userId;
        this.total = total;
    }

    public Order(int id, String orderNumber, int userId, BigDecimal total, String orderDate) {
        this.id = id;
        this.orderNumber = orderNumber;
        this.userId = userId;
        this.orderDate = orderDate;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public float getTotal() {
        // Các logic tính toán tổng giá trị đơn hàng
        return total.floatValue();
    }
    public String getOrderDate() {
        return orderDate;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }
}