import java.util.List;
import java.util.Scanner;
import java.sql.*;

public class Menu {
    private static Scanner input;
    private static UserRole currentUserRole;
    private String loggedInUsername;

    public Menu() {
        this.input = new Scanner(System.in);
    }

    public enum UserRole {
        ADMIN,
        LECTURER,
        OFFICE
    }

    public void displayMainMenu() {
        boolean loggedIn = false;

        while (!loggedIn) {
            System.out.println("Welcome to the College Management System!");
            System.out.println("1. Admin Login");
            System.out.println("2. Exit");
            int choice = getIntInput();

            switch (choice) {
                case 1:
                    loggedIn = loginAdmin();
                    break;
                case 2:
                    System.out.println("Exiting...");
                    closeScanner();
                    return;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }

        while (loggedIn && currentUserRole != null) {
            if (currentUserRole == UserRole.ADMIN) {
                displayUserMenu(currentUserRole);
                int choice = getIntInput();
                handleAdminMenu(choice);
                if (choice == 6) {
                    loggedIn = false;
                }
            } else {
                System.out.println("You don't have permission to access this menu.");
                loggedIn = false;
            }
        }
    }

    private boolean loginAdmin() {
        String adminUsername = getStringInput("Enter admin username");
        String adminPassword = getStringInput("Enter admin password");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

            String sql = "SELECT * FROM Admins WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, adminUsername);
            stmt.setString(2, adminPassword);

            rs = stmt.executeQuery();

            if (rs.next()) {
                currentUserRole = UserRole.ADMIN;
                return true;
            }

            System.out.println("Invalid admin username or password.");
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void handleAdminMenu(int choice) {
        switch (choice) {
            case 1:
                // Add new user
                Admin.addNewUserManually();
                break;
            case 2:
                // Modify user
                Admin.modifyUser();
                break;
            case 3:
                // Delete user
                deleteUser();
                break;
            case 4:
                // Change password
                Admin.changePassword(loggedInUsername);
                break;
            case 5:
                // Display users from all tables
                displayUsersFromAllTables();
                break;
            case 6:
                // Logout
                NewUserMenu();
                break;
            default:
                System.out.println("Invalid choice. Please try again.");
        }
    }
    private void displayUsersFromAllTables() {
        // Get users from each table and display them
        java.util.List<User> adminUsers = Admin.getUsersFromDatabase("ADMINS");
        java.util.List<User> lecturerUsers = Admin.getUsersFromDatabase("LECTURER");
        java.util.List<User> officeUsers = Admin.getUsersFromDatabase("OFFICE");

        // Display users from each table
        System.out.println("Admins:");
        Admin.displayUsers(adminUsers);

        System.out.println("Lecturers:");
        Admin.displayUsers(lecturerUsers);

        System.out.println("Office:");
        Admin.displayUsers(officeUsers);
    }
    public static void deleteUser() {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to select the table
        System.out.println("Select the table from which you want to delete the user:");
        System.out.println("1. Lecturer");
        System.out.println("2. Office");
        System.out.println("3. Admin");
        System.out.print("Enter the number of the table: ");
        int tableChoice = getIntInput(scanner);

        switch (tableChoice) {
            case 1:
                deleteFromTable("Lecturer");
                break;
            case 2:
                deleteFromTable("Office");
                break;
            case 3:
                deleteFromTable("Admin");
                break;
            default:
                System.out.println("Invalid table choice.");
                break;
        }
    }

    private static void deleteFromTable(String tableName) {
        // Fetch users from the specified table
        List<User> users = Admin.getUsersFromDatabase(tableName);

        // Display users
        System.out.println("Users in " + tableName + " table:");
        for (User user : users) {
            System.out.println("Username: " + user.getUsername() + ", Role: " + user.getRole());
        }

        // Implement logic to delete user from specified table
        System.out.println("Deleting user from " + tableName + " table...");
    }


    private static int getIntInput(Scanner scanner) {
        while (true) {
            try {
                System.out.print("Enter your choice: ");
                int choice = Integer.parseInt(scanner.nextLine()); // Read integer input
                return choice;
            } catch (NumberFormatException e) {
                System.out.println("Invalid input. Please enter a number.");
            }
        }
    }




    private void NewUserMenu() {
        boolean loggedIn = false;

        while (!loggedIn) {
            System.out.println("Welcome to the College Management System!");
            System.out.println("1. Login");
            System.out.println("2. Exit");
            int choice = getIntInput();

            switch (choice) {
                case 1:
                    loggedIn = loginUser();
                    break;
                case 2:
                    System.out.println("Exiting...");
                    closeScanner();
                    return;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }

    private boolean loginUser() {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Select your role:");
        System.out.println("1. Admin");
        System.out.println("2. Lecturer");
        System.out.println("3. Office");
        System.out.print("Enter the corresponding number: ");
        int roleChoice = scanner.nextInt();

        UserRole userRole;
        switch (roleChoice) {
            case 1:
                userRole = UserRole.ADMIN;
                break;
            case 2:
                userRole = UserRole.LECTURER;
                break;
            case 3:
                userRole = UserRole.OFFICE;
                break;
            default:
                System.out.println("Invalid role choice.");
                return false;
        }

        boolean loggedIn = authenticateUser(userRole);

        if (loggedIn) {
            displayUserMenu(userRole);
            handleUserMenu(userRole);
        }

        return loggedIn;
    }

    private boolean authenticateUser(UserRole userRole) {
        String username = getStringInput("Enter username");
        String password = getStringInput("Enter password");

        String sqlQuery;
        switch (userRole) {
            case ADMIN:
                sqlQuery = "SELECT COUNT(*) FROM ADMINS WHERE username = ? AND password = ?";
                break;
            case LECTURER:
                sqlQuery = "SELECT COUNT(*) FROM LECTURER WHERE username = ? AND password = ?";
                break;
            case OFFICE:
                sqlQuery = "SELECT COUNT(*) FROM OFFICE WHERE username = ? AND password = ?";
                break;
            default:
                System.out.println("Invalid role.");
                return false;
        }

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");
             PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
            statement.setString(1, username);
            statement.setString(2, password);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private void handleUserMenu(UserRole role) {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();

            switch (role) {
                case ADMIN:
                    handleAdminMenu(choice);
                    break;
                case LECTURER:
                    handleLecturerMenu(choice);
                    break;
                case OFFICE:
                    handleOfficeMenu(choice);
                    break;
                default:
                    System.out.println("Invalid role.");
                    return;
            }
        }
    }

    private void handleOfficeMenu(int choice) {
        switch (choice) {
            case 1:
                System.out.println("Generating Reports...");
                break;
            case 2:
                System.out.println("Changing Password...");
                break;
            case 3:
                System.out.println("Logging out...");
                break;
            default:
                System.out.println("Invalid choice. Please try again.");
        }
    }

    private void handleLecturerMenu(int choice) {
        switch (choice) {
            case 1:
                System.out.println("Generating Report...");
                break;
            case 2:
                System.out.println("Changing Password...");
                break;
            case 3:
                System.out.println("Logging out...");
                break;
            default:
                System.out.println("Invalid choice. Please try again.");
        }
    }

    public static void displayUserMenu(UserRole role) {
        switch (role) {
            case ADMIN:
                System.out.println("Admin Menu:");
                System.out.println("1. Add User");
                System.out.println("2. Modify User");
                System.out.println("3. Delete User");
                System.out.println("4. Change Password");
                System.out.println("5. Display users");
                System.out.println("6. Logout");
                break;
            case OFFICE:
                System.out.println("Office Menu:");
                System.out.println("1. Generate Reports");
                System.out.println("2. Change Password");
                System.out.println("3. Logout");
                break;
            case LECTURER:
                System.out.println("Lecturer Menu:");
                System.out.println("1. Generate Report");
                System.out.println("2. Change Password");
                System.out.println("3. Logout");
                break;
        }
    }

    // Get integer input from the user
    private int getIntInput() {
        while (true) {
            try {
                System.out.print("Enter your choice: ");
                int choice = Integer.parseInt(input.nextLine()); // Read integer input
                return choice;
            } catch (NumberFormatException e) {
                System.out.println("Invalid input. Please enter a number.");
            }
        }
    }

    // Get string input from the user
    private static String getStringInput(String prompt) {
        System.out.print(prompt + ": ");
        String userInput = input.nextLine(); // Read string input
        return userInput;
    }

    // Close the scanner
    public void closeScanner() {
        input.close();
    }
}

