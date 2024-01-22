package models.managers;

import models.entities.Wishlist;
import org.intellij.lang.annotations.Language;
import services.DBConnection;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class WishlistManager {
    @Language("MySQL")
    private static final String queryInsert = "insert into wishlist(name, price, unit, userId, productId) values (?,?,?,?, ?)";

    @Language("MySQL")
    private static final String querySearchByUserId = "select * from wishlist where userId = ?";

    @Language("MySQL")
    private static final String queryDelete = "delete from wishlist where id = ?";


    public static HashMap<Integer, Wishlist> getWishlistByUserId(int userId){
        HashMap<Integer, Wishlist> result = new HashMap<>();
        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(querySearchByUserId)){
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                BigDecimal price = resultSet.getBigDecimal("price");
                String unit = resultSet.getString("unit");
                int productId = resultSet.getInt("productId");

                Wishlist wishlist = new Wishlist(id, name, price, unit, userId, productId);
                result.put(wishlist.getId(), wishlist);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }finally {
            DBConnection.getInstance().close();
        }
        return result;
    }

    public static void insertNewWishlist(Wishlist newWishlist){

        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(queryInsert)){
            preparedStatement.setString(1, newWishlist.getName());
            preparedStatement.setBigDecimal(2, newWishlist.getPrice());
            preparedStatement.setString(3, newWishlist.getUnit());
            preparedStatement.setInt(4, newWishlist.getUserId());
            preparedStatement.setInt(5, newWishlist.getProductId());
            preparedStatement.executeUpdate();

        }catch(SQLException e){
            throw new RuntimeException(e);
        }finally {
            DBConnection.getInstance().close();
        }
    }

    public static void deleteWishlist(int id){

        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery(queryDelete)){
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }finally {
            DBConnection.getInstance().close();
        }
    }
}