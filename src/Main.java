/**
 * James Scott
 * Student ID: SBA23056
 *
 * This project represents an integrated college management system.
 * It includes classes for managing different roles within the university, such as Admin, Lecturer, and Office.
 *
 * The Admin class provides functionality for modifying usernames, changing passwords, adding new users manually,
 * deleting users from the database, and generating reports.
 *
 * The Lecturer class manages tasks specific to lecturers, such as generating reports and printing them to console.
 *
 * The Office class handles office-related tasks, including updating usernames and passwords, generating reports
 * in CSV and TXT formats, and printing reports to the console.
 *
 * The User class represents a user in the university system, with attributes for username and role.
 *
 * The Main class serves as the entry point for the application, displaying the main menu and allowing users
 * to navigate through the system.
 *
 * GitHub Repository: <a href="https://github.com/Jamesscott34/IntegratedCA.git">...</a>
 */
public class Main {

    /**
     * The main method serves as the entry point for the application.
     * It displays the main menu of the university management system.
     *
     * @param args The command-line arguments (not used in this application).
     */
    public static void main(String[] args) {
        Menu menu = new Menu();
        menu.displayMainMenu();
    }
}
