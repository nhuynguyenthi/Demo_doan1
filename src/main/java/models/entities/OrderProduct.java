package models.entities;

import java.util.ArrayList;

public class OrderProduct {
    private int id;
    private String orderNumber;

    private int productId;

    private int quantity;

    public OrderProduct(int id, String orderNumber, int productId, int quantity) {
        this.id = id;
        this.orderNumber = orderNumber;
        this.productId = productId;
        this.quantity = quantity;

    }

    public OrderProduct(String OrderNumber, int productId, int quantity) {
        this.productId = productId;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }
    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId(){
        return productId;
    }
    public void setProductId(int productId){
        this.productId = productId;
    }

    public int getQuantity(){
        return quantity;
    }
    public void setQuantity(int quantity){
        this.quantity = quantity;
    }


}
