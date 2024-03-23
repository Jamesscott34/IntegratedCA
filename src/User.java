import java.sql.*;

public class User {
    private String username;
    private String password;
    private Menu.UserRole role;

    // Constructor
    public User(String username, String password, Menu.UserRole role) {
        this.username = username;
        this.password = password;

    }

    public static void logout() {
        // Perform any necessary cleanup or logout actions here
        System.out.println("Logged out successfully.");

        // Close the program
        System.exit(0);
    }

    // Method to authenticate user from MySQL database
    public boolean authenticateUser(String dbUrl, String dbUsername, String dbPassword) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean loggedIn = false;

        try {
            // Establish connection to MySQL database
            conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            // Prepare SQL query to retrieve user details
            String sql = "SELECT role FROM user WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, this.username);
            stmt.setString(2, this.password);

            // Execute query
            rs = stmt.executeQuery();

            // Check if user exists and retrieve role
            if (rs.next()) {
                String roleStr = rs.getString("role");
                this.role = Menu.UserRole.valueOf(roleStr.toUpperCase()); // Ensure correct case for enum constant
                loggedIn = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return loggedIn;
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

    public Menu.UserRole getRole() {
        return this.role;
    }


}
