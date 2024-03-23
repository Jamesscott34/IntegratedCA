import java.sql.*;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;



public class Admin {
    private static Scanner input;
    public Admin(){
        this.input = new Scanner(System.in);
    }


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


    public static void deleteUser() {
        // Retrieve users from the database and display them with numbers
        List<User> users = getUsersFromDatabase();
        displayUsers(users);

        // Prompt the admin to select the user to delete
        System.out.print("Enter the number of the user to delete: ");
        int userNumber = input.nextInt();

        // Display "Are you sure?" message
        System.out.print("Are you sure you want to delete this user? (yes/no): ");
        String confirm = input.next();

        if (confirm.equalsIgnoreCase("yes")) {
            // Delete the selected user from the database
            User userToDelete = users.get(userNumber - 1);
            boolean deleted = deleteUserFromDatabase(userToDelete.getUsername());

            if (deleted) {
                System.out.println("User deleted successfully.");
            } else {
                System.out.println("Failed to delete user.");
            }

            // Save the remaining users to an ArrayList
            users.remove(userNumber - 1);
            saveUsersToArrayList(users);
        } else {
            System.out.println("Deletion canceled.");
        }
    }

    public static List<User> getUsersFromDatabase() {
        List<User> users = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Establish connection to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

            // Create SQL query to fetch users
            String sql = "SELECT * FROM user";
            stmt = conn.createStatement();

            // Execute query
            rs = stmt.executeQuery(sql);

            // Iterate through the result set and create User objects
            while (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String roleStr = rs.getString("role");
                Menu.UserRole role;
                try {
                    role = Menu.UserRole.valueOf(roleStr.toUpperCase());
                } catch (IllegalArgumentException e) {
                    // Handle the case where the role string doesn't match any enum constant
                    System.out.println("Invalid role found in database: " + roleStr);
                    continue; // Skip this user and proceed with the next one
                }
                User user = new User(username, password, role);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the SQL exception, e.g., log the error or throw a custom exception
        } finally {
            // Close resources in the finally block to ensure they are always closed
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return users;
    }


    static void displayUsers(List<User> users) {
        // Display users with numbers
        for (int i = 0; i < users.size(); i++) {
            System.out.println((i + 1) + ". " + users.get(i).getUsername());
        }
    }

    private static boolean deleteUserFromDatabase(String username) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean deleted = false;

        try {
            // Establish connection to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

            // Prepare SQL statement to delete user
            String sql = "DELETE FROM user WHERE username = ?";
            stmt = conn.prepareStatement(sql);

            // Set username parameter
            stmt.setString(1, username);

            // Execute the DELETE statement
            int rowsAffected = stmt.executeUpdate();

            // Check if deletion was successful
            if (rowsAffected > 0) {
                deleted = true;
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

        return deleted;
    }


    private static List<User> saveUsersToArrayList(List<User> users) {
        // Create a new ArrayList to store users
        List<User> userList = new ArrayList<>(users);

        // Return the ArrayList
        return userList;
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

        try {
            // Connect to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

            Menu.UserRole role = null;
            boolean validRole = false;
            while (!validRole) {
                System.out.print("Enter role (Admin/office/lecturer): ");
                String roleStr = input.nextLine().toUpperCase(); // Convert role to uppercase

                try {
                    role = Menu.UserRole.valueOf(roleStr);
                    validRole = true;
                } catch (IllegalArgumentException e) {
                    System.out.println("Invalid role. Please enter Admin, office, or lecturer.");
                }
            }

            // Prompt the user for new user details
            System.out.print("Enter username: ");
            String username = input.nextLine();
            System.out.print("Enter password: ");
            String password = input.nextLine();



            // Prepare the SQL statement for inserting a new user
            String sql;
            if (role == Menu.UserRole.ADMIN) {
                sql = "INSERT INTO Admins (username, password) VALUES (?, ?)";
            } else {
                sql = "INSERT INTO user (username, password, role) VALUES (?, ?, ?)";
            }
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            if (role != Menu.UserRole.ADMIN) {
                stmt.setString(3, role.toString());
            }

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
                input.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



}
