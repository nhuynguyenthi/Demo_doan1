package models.entities;

public enum Category {
    TRAI_CAY("Trái cây"),
    RAU("Rau"),
    THIT("Thịt"),
    BO_SUA("Bơ Sữa"),
    HAT("Hạt");

    private final String displayName;

    Category(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}