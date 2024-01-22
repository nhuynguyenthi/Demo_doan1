package models.managers;

import models.entities.Products;
import org.intellij.lang.annotations.Language;
import services.DBConnection;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class ProductManager {
    @Language("MySQL")
    private static final String queryDisplay = "select * from products";

    @Language("MySQL")
    private static final String queryFilterByCategory = "select * from products where lower(category) like ?";
    @Language("MySQL")
    private static final String querySearch = "select * from products where lower(name) like ?";

    @Language("MySQL")
    private static final String querySearchById = "select * from products where id = ?";

    public static HashMap<Integer, Products> getAll(){
        HashMap<Integer, Products> result = new HashMap<>();
        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(queryDisplay)){
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String category = resultSet.getString("category");
                BigDecimal price = resultSet.getBigDecimal("price");
                String unit = resultSet.getString("unit");
                int availableQty = resultSet.getInt("availableQty");
                String description = resultSet.getString("description");

                Products product = new Products(id, name, category, price, unit, availableQty, description);
                result.put(product.getId(), product);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }finally {
            DBConnection.getInstance().close();
        }
        return result;
    }

    public static HashMap<Integer, Products> getProductByCategory(String categoryName){
        HashMap<Integer, Products> result = new HashMap<>();
        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(queryFilterByCategory)){
            preparedStatement.setString(1, "%" + categoryName.toLowerCase() +"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String category = resultSet.getString("category");
                BigDecimal price = resultSet.getBigDecimal("price");
                String unit = resultSet.getString("unit");
                int availableQty = resultSet.getInt("availableQty");
                String description = resultSet.getString("description");

                Products product = new Products(id, name, category, price, unit, availableQty, description);
                result.put(product.getId(), product);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }finally {
            DBConnection.getInstance().close();
        }
        return result;
    }

    public static HashMap<Integer, Products> getProductByName(String productName){
        HashMap<Integer, Products> result = new HashMap<>();
        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(querySearch)){
            preparedStatement.setString(1, "%" + productName.toLowerCase() +"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String category = resultSet.getString("category");
                BigDecimal price = resultSet.getBigDecimal("price");
                String unit = resultSet.getString("unit");
                int availableQty = resultSet.getInt("availableQty");
                String description = resultSet.getString("description");

                Products product = new Products(id, name, category, price, unit, availableQty, description);
                result.put(product.getId(), product);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }finally {
            DBConnection.getInstance().close();
        }
        return result;
    }

    public static Products getProductById(int id){
        Products product = new Products();
        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(querySearchById)){
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String category = resultSet.getString("category");
                BigDecimal price = resultSet.getBigDecimal("price");
                String unit = resultSet.getString("unit");
                int availableQty = resultSet.getInt("availableQty");
                String description = resultSet.getString("description");
                product.setId(id);
                product.setName(name);
                product.setCategory(category);
                product.setPrice(price);
                product.setDescription(description);
                product.setUnit(unit);
                product.setAvailableQty(availableQty);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }finally {
            DBConnection.getInstance().close();
        }
        return product;
    }
}