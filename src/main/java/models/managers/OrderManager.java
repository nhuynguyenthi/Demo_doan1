package models.managers;

import models.entities.Customer;
import models.entities.Order;
import org.intellij.lang.annotations.Language;
import services.DBConnection;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;

public class OrderManager {
    @Language("MySQL")
    private static final String queryDisplayByUserId = "SELECT * FROM orders WHERE userId=?";
    @Language("MySQL")
    private static final String queryInsert = "INSERT INTO orders(orderNumber, userId, total, orderDate) VALUES (?,?,?,?)";

    @Language("MySQL")
    private static final String queryInsertOrderProduct = "INSERT INTO orderProducts(orderNumber, productId) VALUES (?, ?)";
    public static HashMap<Integer, Order> getOderByUserId(int userId) {
        HashMap<Integer, Order> result = new HashMap<>();
        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(queryDisplayByUserId)) {
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String orderNumber = resultSet.getString("orderNumber");
                BigDecimal total = resultSet.getBigDecimal("total");
                String orderDate = resultSet.getString("orderDate");
                Order order = new Order(id, orderNumber, userId, total, orderDate);
                result.put(order.getId(), order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnection.getInstance().close();
        }
        return result;
    }
    public static void insertNewOrder(Order newOrder) {
        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(queryInsert)) {
            preparedStatement.setString(1, newOrder.getOrderNumber());
            preparedStatement.setInt(2, newOrder.getUserId());
            preparedStatement.setFloat(3, newOrder.getTotal());
            preparedStatement.setDate(4, java.sql.Date.valueOf(LocalDate.now()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnection.getInstance().close();
        }
    }
    public static void insertNewOrderProduct(String orderNumber, int productId) {
        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(queryInsertOrderProduct)) {
            preparedStatement.setString(1, orderNumber);
            preparedStatement.setInt(2, productId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnection.getInstance().close();
        }
    }
}