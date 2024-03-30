import java.sql.*;

/**
 * Represents a user in the university system.
 */
public class User {
    private String username;
    private String role;

    public static final String JDBC_URL = "jdbc:mysql://localhost:3306/management";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "Alison12@";

    /**
     * Constructs a new User with the specified username and role.
     *
     * @param username The username of the user.
     * @param role     The role of the user.
     */
    public User(String username, String role) {
        this.username = username;
        this.role = role;
    }

    /**
     * Retrieves the username of the user.
     *
     * @return The username of the user.
     */
    public String getUsername() {
        return username;
    }

    /**
     * Retrieves the role of the user.
     *
     * @return The role of the user.
     */
    public String getRole() {
        return this.role;
    }


}
