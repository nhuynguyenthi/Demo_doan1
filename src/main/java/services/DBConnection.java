package services;

import org.intellij.lang.annotations.Language;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnection {
    private static DBConnection instance;
    private DBConnection(){}

    public static DBConnection getInstance(){
        if (instance == null)
            instance = new DBConnection();
        return instance;
    }

    private final String urlConnection = "jdbc:mysql://localhost:3306/dbshop_raucu";
    private final String username = "root";

    private final String password = "";
    private Connection connection = null;

    public PreparedStatement preparedQuery(@Language("MySQL")String query){
        PreparedStatement ps = null;
        try{
            if (connection == null || connection.isClosed()){
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(urlConnection, username, password);
                ps = connection.prepareStatement(query);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return ps;
    }
    public void close(){
        try{
            connection.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
