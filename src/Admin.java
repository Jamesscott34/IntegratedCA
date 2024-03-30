import java.sql.*;
import java.util.*;

import static com.mysql.cj.conf.PropertyKey.PASSWORD;

/**

 The Admin class provides functionalities related to administrative tasks in a management system.
 It includes methods for modifying admin user information such as username and password, adding new users manually,
 retrieving and displaying users from the database, and deleting users from specified tables.
 Methods:
 modifyUser(): Allows modification of the admin username.
 updateUserInDatabase(String newUsername): Updates admin username in the database.
 getUsersFromDatabase(String tableName): Retrieves a list of users from a specified table in the database.
 displayUsers(List<User> users): Displays a list of users with their usernames.
 changePassword(String username): Changes the password for a specified user.
 updatePasswordInDatabase(String username, String newPassword): Updates the password of a user in the database.
 addNewUserManually(): Allows an admin to add a new user manually to the database.
 deleteFromTable(String tableName, Scanner scanner): Deletes a user from the specified table in the database.
 */




public class Admin {

    private static Scanner input = new Scanner(System.in);



    /**
     * Method to modify the username of an admin user.
     *
     * @return true if the admin username is updated successfully, false otherwise.
     */
    public static void modifyUser() {
        // Prompt the admin to enter the new username
        System.out.print("Enter the new username: ");
        String newUsername = input.nextLine();

        // Update the username in the database
        boolean updated = updateUserInDatabase(newUsername);

        // Display success or failure message
        if (updated) {
            System.out.println("Admin username updated successfully.");
        } else {
            System.out.println("Failed to update admin username.");
        }
    }

    /**
     * Method to update admin username in the database.
     *
     * @param newUsername The new username to be set for the admin user.
     * @return true if the admin username is updated successfully, false otherwise.
     */
    private static boolean updateUserInDatabase(String newUsername) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updated = false;

        try {
            // Establish connection to MySQL database
            conn = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);

            // Prepare SQL query to update username
            String sql = "UPDATE ADMINS SET username = ? WHERE role = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newUsername); // Set the new username parameter
            stmt.setString(2, "Admin"); // Assuming 'Admin' is the role of the admin user

            // Execute update
            int rowsAffected = stmt.executeUpdate();

            // Check if update was successful
            if (rowsAffected > 0) {
                updated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print the exception if there's an SQL error
        } finally {
            // Close resources to avoid memory leaks
            try {
                if (stmt != null) stmt.close(); // Close PreparedStatement
                if (conn != null) conn.close(); // Close Connection
            } catch (SQLException e) {
                e.printStackTrace(); // Print the exception if there's an error while closing resources
            }
        }

        return updated; // Return whether the update was successful
    }

    /**
     * Retrieves a list of users from the specified table in the database.
     *
     * @param tableName The name of the table to retrieve users from.
     * @return A list of User objects containing usernames and roles.
     */
    public static List<User> getUsersFromDatabase(String tableName) {
        String sqlQuery = "SELECT username, role FROM " + tableName;

        // Execute the SQL query and retrieve the data from the database
        List<User> users = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD)) {
            try (Statement statement = connection.createStatement();
                 ResultSet resultSet = statement.executeQuery(sqlQuery)) {
                while (resultSet.next()) {
                    String username = resultSet.getString("username");
                    String role = resultSet.getString("role");
                    users.add(new User(username, role));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any SQL exceptions here
        }

        return users;
    }

    /**
     * Displays the list of users with their usernames.
     *
     * @param users The list of User objects to display.
     */
    static void displayUsers(List<User> users) {
        // Display users with numbers
        for (int i = 0; i < users.size(); i++) {
            System.out.println((i + 1) + ". " + users.get(i).getUsername());
        }
    }

    /**
     * Changes the password for the specified user.
     *
     * @param username The username of the user whose password is to be changed.
     */
    public static void changePassword(String username) {
        // Prompt the user to enter the new password
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the new password: ");
        String newPassword = scanner.nextLine();

        // Update the password in the database
        boolean updated = updatePasswordInDatabase(username, newPassword);

        if (updated) {
            System.out.println("Password updated successfully.");
        } else {
            System.out.println("Failed to update password.");
        }
    }

    /**
     * Updates the password of a user in the database.
     *
     * @param username   The username of the user whose password is to be updated.
     * @param newPassword The new password to be set for the user.
     * @return true if the password is updated successfully, false otherwise.
     */
    private static boolean updatePasswordInDatabase(String username, String newPassword) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updated = false;

        try {
            // Establish connection to the database
            conn = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);

            // Prepare SQL statement to update password
            String sql = "UPDATE ADMINS SET password = ? WHERE username = ?";
            stmt = conn.prepareStatement(sql);

            // Set parameters
            stmt.setString(1, newPassword);
            stmt.setString(2, username);

            // Execute the UPDATE statement
            int rowsAffected = stmt.executeUpdate();

            // Check if update was successful
            if (rowsAffected > 0) {
                updated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return updated;
    }

    /**
     * Allows an admin to add a new user manually to the database.
     */
    public static void addNewUserManually() {
        Connection conn = null;
        PreparedStatement stmt = null;
        Scanner input = new Scanner(System.in);

        try {
            // Connect to the database
            conn = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);

            // Prompt the admin for user details
            System.out.print("Enter role (Admin/Lecturer/Office): ");
            String roleStr = input.nextLine().toUpperCase(); // Convert role to uppercase
            Menu.UserRole role = Menu.UserRole.valueOf(roleStr);

            System.out.print("Enter username: ");
            String username = input.nextLine();

            System.out.print("Enter password: ");
            String password = input.nextLine();

            // Prepare the SQL statement for inserting a new user
            String sql = "";
            switch (role) {
                case ADMIN:
                    sql = "INSERT INTO Admins (username, password) VALUES (?, ?)";
                    break;
                case LECTURER:
                    sql = "INSERT INTO Lecturer (username, password) VALUES (?, ?)";
                    break;
                case OFFICE:
                    sql = "INSERT INTO Office (username, password) VALUES (?, ?)";
                    break;
            }
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            // Execute the SQL statement to insert the new user
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("New user added successfully.");
            } else {
                System.out.println("Failed to add new user.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    /**
     * Deletes a user from the specified table in the database.
     *
     * @param tableName The name of the table from which the user is to be deleted.
     * @param scanner   Scanner object to read user input.
     */
    public static void deleteFromTable(String tableName, Scanner scanner) {
        // Fetch users from the specified table
        List<User> users = Admin.getUsersFromDatabase(tableName);

        // Display users
        System.out.println("Users in " + tableName + " table:");
        int index = 1;
        for (User user : users) {
            System.out.println(index + ". Username: " + user.getUsername() + ", Role: " + user.getRole());
            index++;
        }

        // Ask user to select the user to delete
        System.out.println("Enter the number of the user to delete (or enter 0 to stop): ");
        int deleteChoice = Menu.getIntInput(scanner);

        if (deleteChoice > 0 && deleteChoice <= users.size()) {
            // Delete the selected user
            User userToDelete = users.get(deleteChoice - 1);
            System.out.println("Deleting user " + userToDelete.getUsername() + " from " + tableName + " table...");
            // Implement the logic to delete user here
        } else if (deleteChoice == 0) {
            System.out.println("Stopping deletion process.");
        } else {
            System.out.println("Invalid input. No user deleted.");
        }
    }
}
