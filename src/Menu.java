
/**
 * The Menu class represents the main menu of the College Management System.
 * It provides functionalities for user authentication, login, and navigation through different user roles.
 */
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.sql.*;



public class Menu {
    private static Scanner input;
    private static UserRole currentUserRole;
    private static String loggedInUsername;

    /**
     * Enum to represent different user roles.
     */
    public enum UserRole {
        ADMIN,
        LECTURER,
        OFFICE
    }

    /**
     * Constructor to initialize the Menu class with a scanner object.
     */
    public Menu() {
        this.input = new Scanner(System.in);
    }

    /**
     * Displays the main menu of the College Management System.
     */
    public void displayMainMenu() {
        boolean loggedIn = false;

        // Display the main menu until the user logs in
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

        // Display the user menu based on the logged-in user's role
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

    /**
     * Handles the login process for an admin user.
     * @return true if login is successful, false otherwise
     */
    private boolean loginAdmin() {
        String adminUsername = getStringInput("Enter admin username");
        String adminPassword = getStringInput("Enter admin password");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);

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

    /**
     * Handles the actions based on the admin menu choice.
     * @param choice the menu choice selected by the admin user
     */
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

    /**
     * Displays users from all tables (Admins, Lecturers, Office) in the database.
     */
    private void displayUsersFromAllTables() {
        // Get users from each table and display them
        List<User> adminUsers = Admin.getUsersFromDatabase("ADMINS");
        List<User> lecturerUsers = Admin.getUsersFromDatabase("LECTURER");
        List<User> officeUsers = Admin.getUsersFromDatabase("OFFICE");

        // Display users from each table
        System.out.println("Admins:");
        Admin.displayUsers(adminUsers);

        System.out.println("Lecturers:");
        Admin.displayUsers(lecturerUsers);

        System.out.println("Office:");
        Admin.displayUsers(officeUsers);
    }

    /**
     * Deletes a user from the selected table.
     */
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
                Admin.deleteFromTable("Lecturer", scanner);
                break;
            case 2:
                Admin.deleteFromTable("Office", scanner);
                break;
            case 3:
                Admin.deleteFromTable("Admin", scanner);
                break;
            default:
                System.out.println("Invalid table choice.");
                break;
        }
    }
    /**
     * Reads an integer input from the user using the provided Scanner object.
     * @param input Scanner object to read input from
     * @return The integer input provided by the user
     */
    static int getIntInput(Scanner input) {
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

    /**
     * Displays the New User Menu and handles user login or exit.
     */
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

    /**
     * Handles the login process for a user.
     * @return true if login is successful, false otherwise
     */
    private boolean loginUser() {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Select your role:");
        System.out.println("1. Admin");
        System.out.println("2. Lecturer");
        System.out.println("3. Office");
        System.out.println("4. Quit");
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
            case 4:
                System.out.println("You have now logged out of the program. Goodbye.");
                System.exit(0);
            default:
                System.out.println("Invalid role choice.");
                return false;
        }

        String username = authenticateUser(userRole);
        if (username != null) {
            loggedInUsername = username;
        }

        if (username != null) {
            displayUserMenu(userRole);
            handleUserMenu(userRole);
        }

        return username != null;
    }



    /**
     * Authenticates a user
     * @return the username if successfully authenticated, or null otherwise
     */
    private String authenticateUser(UserRole userRole) {
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
                return username;
        }

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
            statement.setString(1, username);
            statement.setString(2, password);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);

                    if (count > 0) {
                        return username;
                    } else {
                        return null;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Handles the user menu based on the user's role.
     *
     * @param role The role of the user (ADMIN, LECTURER, or OFFICE).
     */
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

    /**
     * Handles the menu options for the office role.
     *
     * @param choice The user's choice.
     */
    private void handleOfficeMenu(int choice) {
        switch (choice) {
            case 1:
                generateOfficeReport();
                System.out.println("Generating Reports...");
                break;
            case 2:
                Office.ChangeUserName();
                System.out.println("Changing Username...");
                break;
            case 3:
                Office.changePassword();
                System.out.println("Changing Password...");
                break;
            case 4:
                loginUser();
                break;
            default:
                System.out.println("Invalid choice. Please try again.");
        }
    }

    /**
     * Generates a report for the logged-in lecturer based on user choice.
     * Allows the user to choose how the report will be saved.
     *
     * @return None.
     */
    public static void generateLecturerReport() {
        // Display options to the user
        System.out.println("How would you like to save the report?");
        System.out.println("1. Save to CSV");
        System.out.println("2. Save to TXT");
        System.out.println("3. Print to Console");
        System.out.print("Enter your choice: ");

        // Get user's choice
        int choice = getIntInput();

        // Define the output format based on user's choice
        String outputFormat;
        switch (choice) {
            case 1:
                outputFormat = "csv";
                break;
            case 2:
                outputFormat = "txt";
                break;
            case 3:
                outputFormat = "console";
                break;
            default:
                System.out.println("Invalid choice.");
                return;
        }

        // Generate the report based on the selected output format
        Lecturer.generateReport(loggedInUsername, outputFormat);
    }


    /**
     * Generates an office report based on the user's choice.
     * Allows the user to choose between an office-specific report or a lecturer-specific report.
     * If the user chooses a lecturer-specific report, prompts for the lecturer's name and output format.
     */
    public static void generateOfficeReport() {
        // Display options to the user
        System.out.println("What report would you like to view?");
        System.out.println("1. Office Report");
        System.out.println("2. Lecturer Report");
        System.out.print("Enter your choice: ");

        // Get user's choice for the type of report
        int reportChoice = getIntInput();

        switch (reportChoice) {
            case 1:
                generateOfficeSpecificReport();
                break;
            case 2:
                generatLecturerSpecificReport();
                break;
            default:
                System.out.println("Invalid choice.");
                break;
        }
    }

    /**
     * Generates a lecturer-specific report based on user input for lecturer's name and output format.
     * Prompts the user to enter the lecturer's name and choose the output format (text, CSV, or terminal).
     * Generates the report using the specified lecturer name and output format.
     */
    private static void generatLecturerSpecificReport() {
        String lecturerName = Lecturer.getLecturerName();
        String outputFormat = Lecturer.getOutputFormat();

        if (outputFormat.equals("txt") || outputFormat.equals("csv") || outputFormat.equals("terminal")) {
            Lecturer.generateReport(lecturerName, outputFormat);
        } else {
            System.out.println("Invalid output format.");
        }
    }


    /**
     * Generates an office-specific report based on user selection of lecturer and output format.
     * Allows the user to select a lecturer from the database and choose how to save the report (CSV, TXT, or console).
     * Fetches the list of lecturers from the database, displays them to the user, and prompts for report format.
     * Generates the report according to the selected lecturer and output format.
     */
    public static void generateOfficeSpecificReport() {
        // Display options to the user
        System.out.println("Select the lecturer for the report:");

        // Fetch list of lecturers from the database
        List<String> lecturers = getLecturers();

        // Display the list of lecturers
        for (int i = 0; i < lecturers.size(); i++) {
            System.out.println((i + 1) + ". " + lecturers.get(i));
        }

        // Get user's choice for the lecturer
        int lecturerChoice = getIntInput();

        // Get user's choice for saving the office report
        System.out.println("How would you like to save the office report?");
        System.out.println("1. Save to CSV");
        System.out.println("2. Save to TXT");
        System.out.println("3. Print to Console");
        System.out.print("Enter your choice: ");
        int reportChoice = getIntInput();

        // Get the selected lecturer name
        String selectedLecturer = lecturers.get(lecturerChoice - 1);

        // Generate the report based on user's choices
        switch (reportChoice) {
            case 1:
                Office.createCSVReport(selectedLecturer);
                break;
            case 2:
                Office.createTXTReport(selectedLecturer);
                break;
            case 3:
                Office.printToConsole(selectedLecturer);
                break;
            default:
                System.out.println("Invalid choice.");
                break;
        }
    }

    /**
     * Retrieves the list of lecturers from the database.
     *
     * @return A list of lecturer names.
     */
    private static List<String> getLecturers() {
        List<String> lecturers = new ArrayList<>();

        String sql = "SELECT username FROM LECTURER"; // Modify the column name to 'username'

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                lecturers.add(resultSet.getString("username")); // Retrieve usernames from the result set
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }

        return lecturers;
    }





    /**
     * Handles the menu options for the lecturer.
     *
     * @param choice The menu option chosen by the lecturer.
     */
    private void handleLecturerMenu(int choice) {
        switch (choice) {
            case 1:
                generateLecturerReport();
                System.out.println("Generating Report...");
                break;
            case 2:
                Lecturer.ChangeUserName();
                System.out.println("Changing UserName..");
                break;
            case 3:
                Lecturer.changePassword();
                System.out.println("Changing Password");
                break;
            case 4:
                loginUser();
                break;
            default:
                System.out.println("Invalid choice. Please try again.");
        }
    }

    /**
     * Displays the menu options based on the user's role.
     *
     * @param role The role of the user (ADMIN, OFFICE, LECTURER).
     */
    public static void displayUserMenu(UserRole role) {
        switch (role) {
            case ADMIN:
                System.out.println("Admin Menu:");
                System.out.println("1. Add User");
                System.out.println("2. Modify User");
                System.out.println("3. Delete User");
                System.out.println("4. Change Password");
                System.out.println("5. Display users");
                System.out.println("6. Change User");
                break;
            case OFFICE:
                System.out.println("Office Menu:");
                System.out.println("1. Generate Reports");
                System.out.println("2. Change user Name");
                System.out.println("3. Change Password");
                System.out.println("4. Logout");
                break;
            case LECTURER:
                System.out.println("Lecturer Menu:");
                System.out.println("1. Generate Reports");
                System.out.println("2. Change user Name");
                System.out.println("3. Change Password");
                System.out.println("4. Logout");
                break;
        }
    }
    /**
     * Reads integer input from the user via the console.
     * Continues to prompt the user until a valid integer is entered.
     *
     * @return The integer input provided by the user.
     */
    private static int getIntInput() {
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

    /**
     * Reads string input from the user via the console with a provided prompt.
     *
     * @param prompt The prompt to display to the user.
     * @return The string input provided by the user.
     */
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

