package models.action;

import javax.servlet.http.HttpServletRequest;

import models.managers.ProductManager;

public class ProductAction {
    public static final String PRODUCT_PARAM = "products";
    public static void getAll(HttpServletRequest request){request.setAttribute(PRODUCT_PARAM, ProductManager.getAll());}

    public static void getByCategory(HttpServletRequest request, String categoryName){
        request.setAttribute(PRODUCT_PARAM, ProductManager.getProductByCategory(categoryName));
    }
    public static void getByName(HttpServletRequest request, String name){
        request.setAttribute(PRODUCT_PARAM, ProductManager.getProductByName(name));
    }

    public static void getById(HttpServletRequest request, int id){
        request.setAttribute(PRODUCT_PARAM, ProductManager.getProductById(id));
    }
}
