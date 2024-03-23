import java.sql.*;

public class User {
    private String username;
    private String password;
    private String role;

    public User(int userId, String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public User(String username, String role) {
        this.username = username;
        this.role = role;
    }

    public static void logout() {
        // Perform any necessary cleanup or logout actions here
        System.out.println("Logged out successfully.");

        // Close the program
        System.exit(0);
    }



    // Getters and setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return this.role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
