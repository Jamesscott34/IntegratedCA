import java.sql.*;
import java.util.*;


public class Admin {
    private static Map<String, List<User>> userTables = new HashMap<>();
    private static List<User> allUsers = new ArrayList<>();
    private static Scanner input = new Scanner(System.in);



    public static void modifyUser() {
        // Prompt the admin to enter the new username
        System.out.print("Enter the new username: ");
        String newUsername = input.nextLine();

        // Update the username in the database
        boolean updated = updateUserInDatabase(newUsername);

        if (updated) {
            System.out.println("Admin username updated successfully.");
        } else {
            System.out.println("Failed to update admin username.");
        }
    }
    private static boolean updateUserInDatabase(String newUsername) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updated = false;

        try {
            // Establish connection to MySQL database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

            // Prepare SQL query to update username
            String sql = "UPDATE Admins SET username = ? WHERE role = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newUsername);
            stmt.setString(2, "Admin"); // Assuming 'ADMIN' is the role of the admin user

            // Execute update
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



    public static void deleteFromTable(String tableName) {
        // Retrieve users from the specified table in the database and display them with numbers
        List<User> users = getUsersFromDatabase(tableName);
        displayUsers(users);

        // Prompt the admin to select the user to delete
        System.out.print("Enter the number of the user to delete: ");
        int userNumber = input.nextInt();

        // Display "Are you sure?" message
        System.out.print("Are you sure you want to delete this user? (yes/no): ");
        String confirm = input.next();

        if (confirm.equalsIgnoreCase("yes")) {
            // Delete the selected user from the specified table in the database
            User userToDelete = users.get(userNumber - 1);
            boolean deleted = deleteUserFromDatabase(userToDelete.getUsername(), tableName);

            if (deleted) {
                System.out.println("User deleted successfully.");
            } else {
                System.out.println("Failed to delete user.");
            }

            // Save the remaining users to an ArrayList
            users.remove(userNumber - 1);
            saveUsersToArrayList(users, tableName);
        } else {
            System.out.println("Deletion canceled.");
        }
    }




    public static boolean deleteUserFromDatabase(String username, String tableName) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");
            String query = "DELETE FROM " + tableName + " WHERE username = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void saveUsersToArrayList(List<User> users, String tableName) {
        // Save the remaining users to separate ArrayLists based on the table name
        userTables.put(tableName, users);

        // Also, update the all-user ArrayList
        updateAllUsers();
    }
    private static void updateAllUsers() {
        allUsers.clear();
        for (List<User> userList : userTables.values()) {
            allUsers.addAll(userList);
        }
    }


    public static List<User> getUsersFromDatabase(String tableName) {
        String sqlQuery = "SELECT username, role FROM " + tableName;

        // Execute the SQL query and retrieve the data from the database
        List<User> users = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@")) {
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





    static void displayUsers(List<User> users) {
        // Display users with numbers
        for (int i = 0; i < users.size(); i++) {
            System.out.println((i + 1) + ". " + users.get(i).getUsername());
        }
    }


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

    private static boolean updatePasswordInDatabase(String username, String newPassword) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updated = false;

        try {
            // Establish connection to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

            // Prepare SQL statement to update password
            String sql = "UPDATE Admins SET password = ? WHERE username = ?";
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

    public static void addNewUserManually() {
        Connection conn = null;
        PreparedStatement stmt = null;
        Scanner input = new Scanner(System.in);

        try {
            // Connect to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

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





}
