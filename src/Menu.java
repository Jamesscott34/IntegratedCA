import java.util.List;
import java.util.Scanner;
import java.sql.*;




public class Menu {
    private Scanner input;
    private UserRole currentUserRole;
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
                    // Placeholder admin login logic
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

        // Once logged in as admin, proceed to admin menu
        while (loggedIn && currentUserRole != null) {
            if (currentUserRole == UserRole.ADMIN) {
                displayUserMenu(currentUserRole);
                int choice = getIntInput();

                handleAdminMenu(choice);

                if (choice == 5) {
                    System.out.println("Logging out...");
                    loggedIn = false;
                }
            } else {
                System.out.println("You don't have permission to access this menu.");
                loggedIn = false; // Logout if user doesn't have admin access
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
            // Connect to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

            // Prepare the SQL statement to check admin credentials
            String sql = "SELECT * FROM Admins WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, adminUsername);
            stmt.setString(2, adminPassword);

            // Execute the query
            rs = stmt.executeQuery();

            // If a row is returned, admin authentication is successful
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
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



    private boolean loginUser() {
        String username = getStringInput("Enter username");
        String password = getStringInput("Enter password");

        // Create a User object with provided credentials
        User user = new User(username, password, null); // 'role' is set to null for now

        // Authenticate user against database
        boolean loggedIn = user.authenticateUser("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

        // Set the current user's role if login successful
        if (loggedIn) {
            currentUserRole = user.getRole();
        }

        return loggedIn;
    }

    private void handleAdminMenu(int choice) {
        switch (choice) {
            case 1:
                Admin.addNewUserManually();
                break;
            case 2:
                Admin.modifyUser();
                break;
            case 3:
                Admin.deleteUser();
                break;
            case 4:
                Admin.changePassword(loggedInUsername);
                break;
            case 5:
                java.util.List<User> users = Admin.getUsersFromDatabase();
                Admin.displayUsers(users);
                break;
            case 6:
                NewUserMenu();
                break;
            default:
                System.out.println("Invalid choice. Please try again.");
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
                    // Placeholder admin login logic
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
    // Display the user menu based on their role
    private void displayUserMenu(UserRole role) {
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
    private String getStringInput(String prompt) {
        System.out.print(prompt + ": ");
        String userInput = input.nextLine(); // Read string input
        return userInput;
    }

    // Close the scanner
    public void closeScanner() {
        input.close();
    }
}
