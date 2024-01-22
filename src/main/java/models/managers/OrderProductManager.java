package models.managers;

import models.entities.Order;
import models.entities.OrderProduct;
import models.entities.ShoppingCart;
import org.intellij.lang.annotations.Language;
import services.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class OrderProductManager {
    @Language("MySQL")
    private static final String queryInsertOrderProduct = "insert into orderProducts(orderNumber, productId, quantity) values (?, ?, ?)";

    @Language("MySQL")
    private static final String queryDisplayByOrderNumber = "select * from orderProducts where orderNumber = ?";

    public static HashMap<Integer, OrderProduct> getProductByOrderNumber(String orderNumber){
        HashMap<Integer, OrderProduct> result = new HashMap<>();
        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(queryDisplayByOrderNumber)){
            preparedStatement.setString(1, orderNumber);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                int productId = resultSet.getInt("productId");
                int quantity = resultSet.getInt("quantity");

                OrderProduct orderProduct = new OrderProduct(id, orderNumber, productId, quantity);
                result.put(orderProduct.getId(), orderProduct);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }finally {
            DBConnection.getInstance().close();
        }
        return result;
    }
    public static void insertNewOrderProduct(String orderNumber, int productId, int quantity) {
        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(queryInsertOrderProduct)) {
            preparedStatement.setString(1, orderNumber);
            preparedStatement.setInt(2, productId);
            preparedStatement.setInt(3, quantity);
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("New order product inserted successfully.");
            } else {
                System.out.println("Failed to insert new order product.");
            }
        } catch (SQLException e) {
            System.err.println("Error executing SQL query: " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            DBConnection.getInstance().close();
        }
    }
    }
