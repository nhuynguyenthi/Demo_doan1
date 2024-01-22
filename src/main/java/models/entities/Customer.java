package models.entities;

public class Customer {
    private int id;
    private String firstName;
    private String lastName;
    private String phone;
    private String password;
    private String email;

    public Customer(int id, String firstName, String lastName, String email, String phone, String password){
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }
    public Customer(String firstName, String lastName, String email, String phone, String password){
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }
    public Customer(String email, String password){
        this.email = email;
        this.password = password;
    }

    public Customer(){}

    public Customer(String email){
        this.email = email;
    }

    public int getId(){ return id; }
    public void setId(int id) {this.id = id;}
    public String getFirstName() {return firstName;}
    public void setFirstName(String firstName) {this.firstName = firstName;}
    public String getLastName() {return lastName;}
    public void setLastName(String lastName) {this.lastName = lastName;}
    public String getPhone() {return phone;}
    public void setPhone(String phone) {this.phone = phone;}
    public String getPassword() {return password;}
    public void setPassword(String password) {this.password = password;}
    public String getEmail() {return email;}
    public void setEmail(String email) {this.email = email;}

}
