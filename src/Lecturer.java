import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Scanner;

/**
 * Represents a lecturer in a college managment system.
 * This class provides functionality related to managing lecturer data and generating reports.
 */
public class Lecturer {
    private static Scanner input = new Scanner(System.in);
    private static final String REPORTS_FOLDER = "reports";

    /**
     * Allows the admin to change their username.
     * Prompts the admin to enter the new username and updates it in the database.
     * Prints a success message if the username is updated successfully, otherwise prints a failure message.
     */
    public static void ChangeUserName() {
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

    /**
     * Allows the admin to change their password.
     * Prompts the admin to enter the new password and updates it in the database.
     * Prints a success message if the password is updated successfully, otherwise prints a failure message.
     */
    public static void changePassword() {
        // Prompt the admin to enter the new password
        System.out.print("Enter the new password: ");
        String newPassword = input.nextLine();

        // Update the password in the database
        boolean updated = updatePasswordInDatabase(newPassword);

        if (updated) {
            System.out.println("Admin password updated successfully.");
        } else {
            System.out.println("Failed to update admin password.");
        }
    }


    /**
     * Updates the username of a lecturer in the database.
     *
     * @param newUsername The new username to be set for the lecturer.
     * @return true if the username is updated successfully, false otherwise.
     */
    private static boolean updateUserInDatabase(String newUsername) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updated = false;

        try {
            // Establish connection to MySQL database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

            // Prepare SQL query to update username
            String sql = "UPDATE LECTURER SET username = ? WHERE role = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newUsername);
            stmt.setString(2, "Lecturer"); // Assuming 'Lecturer' is the role of the lecturer user

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

    /**
     * Updates the password of a lecturer in the database.
     *
     * @param newPassword The new password to be set for the lecturer.
     * @return true if the password is updated successfully, false otherwise.
     */
    private static boolean updatePasswordInDatabase(String newPassword) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updated = false;

        try {
            // Establish connection to MySQL database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

            // Prepare SQL query to update password
            String sql = "UPDATE LECTURER SET password = ? WHERE role = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newPassword);
            stmt.setString(2, "Lecturer"); // Assuming 'Lecturer' is the role of the lecturer user

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

    /**
     * Generates a CSV report for a lecturer containing student names, course names, grades, and lecturer feedback.
     * Retrieves data from the database based on the provided lecturer's username and writes it to a CSV file.
     *
     * @param lecturerName The username of the lecturer for whom the report is generated.
     */
    public static void createCSVReport(String lecturerName) {
        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/management";
        String username = "root";
        String password = "Alison12@";

        // SQL query to retrieve report data
        String sql = "SELECT Students.StudentName, Courses.CourseName, Grades.Grade, Lecturerreports.LecturerFeedbackText " +
                "FROM Lecturerreports " +
                "INNER JOIN Students ON Lecturerreports.StudentID = Students.StudentID " +
                "INNER JOIN Courses ON Lecturerreports.CourseID = Courses.CourseID " +
                "INNER JOIN Grades ON Lecturerreports.EnrollmentID = Grades.EnrollmentID " +
                "INNER JOIN Lecturer ON Lecturerreports.LecturerID = Lecturer.Lecturer_id " +
                "WHERE Lecturer.username = ?";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, lecturerName);
            try (ResultSet resultSet = statement.executeQuery()) {
                // Define the file path for the CSV report
                Path filePath = Paths.get("reports/" + lecturerName + ".csv");
                // Write the result set data to the CSV file
                writeCSVReportToFile(resultSet, filePath);
            }
            System.out.println("CSV report generated successfully!");
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }

    /**
     * Writes the data from the ResultSet to a CSV file.
     *
     * @param resultSet The ResultSet containing the data to be written.
     * @param filePath   The path to the CSV file where the data will be written.
     */
    public static void writeCSVReportToFile(ResultSet resultSet, Path filePath) {
        // Create the reports folder if it doesn't exist
        createReportsFolder();

        // Append the file name to the reports folder path
        Path reportFilePath = Paths.get(REPORTS_FOLDER, filePath.getFileName().toString());

        try (FileWriter writer = new FileWriter(reportFilePath.toFile())) {
            // Write the CSV header
            writer.write("Student Name, Course Name, Grade, Lecturer Feedback\n");
            // Write data for each row in the ResultSet
            while (resultSet.next()) {
                String studentName = resultSet.getString("StudentName");
                String courseName = resultSet.getString("CourseName");
                double grade = resultSet.getDouble("Grade");
                String lecturerFeedback = resultSet.getString("LecturerFeedbackText");
                // Write data for each row to the CSV file
                writer.write(studentName + ", " + courseName + ", " + grade + ", " + lecturerFeedback + "\n");
            }
            System.out.println("CSV report saved successfully at: " + reportFilePath.toString());
        } catch (SQLException | IOException e) {
            System.err.println("Error writing CSV file: " + e.getMessage());
        }
    }

    /**
     * Creates a folder named "reports" if it does not exist.
     * This folder is used for storing generated reports.
     */
    private static void createReportsFolder() {
        Path folderPath = Paths.get(REPORTS_FOLDER);
        if (!Files.exists(folderPath)) {
            try {
                Files.createDirectories(folderPath);
                System.out.println("Reports folder created at: " + folderPath.toAbsolutePath());
            } catch (IOException e) {
                System.err.println("Error creating reports folder: " + e.getMessage());
            }
        }
    }

    /**
     * Generates a TXT report for a lecturer containing student names, course names, grades, and lecturer feedback.
     * Retrieves data from the database based on the provided lecturer's name and writes it to a TXT file.
     *
     * @param lecturerName The name of the lecturer for whom the report is generated.
     */
    public static void createTXTReport(String lecturerName) {
        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/management";
        String username = "root";
        String password = "Alison12@";

        // SQL query to retrieve report data
        String sql = "SELECT Students.StudentName, Courses.CourseName, Grades.Grade, Lecturerreports.LecturerFeedbackText " +
                "FROM Lecturerreports " +
                "INNER JOIN Students ON Lecturerreports.StudentID = Students.StudentID " +
                "INNER JOIN Courses ON Lecturerreports.CourseID = Courses.CourseID " +
                "INNER JOIN Grades ON Lecturerreports.EnrollmentID = Grades.EnrollmentID " +
                "WHERE Lecturerreports.LecturerID = (SELECT Lecturer_id FROM Lecturer WHERE LecturerName = ?)";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, lecturerName);
            try (ResultSet resultSet = statement.executeQuery()) {
                // Define the file path for the TXT report
                Path filePath = Paths.get("reports/" + lecturerName + ".txt");
                // Write the result set data to the TXT file
                writeTXTReportToFile(resultSet, filePath);
            }
            System.out.println("TXT report generated successfully!");
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }

    /**
     * Prints a report for a lecturer to the console.
     * Retrieves data from the database based on the provided lecturer's name and prints it to the console.
     *
     * @param lecturerName The name of the lecturer for whom the report is printed.
     */
    public static void printToConsole(String lecturerName) {
        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/management";
        String username = "root";
        String password = "Alison12@";

        // SQL query to retrieve report data
        String sql = "SELECT Students.StudentName, Courses.CourseName, Grades.Grade, Lecturerreports.LecturerFeedbackText " +
                "FROM Lecturerreports " +
                "INNER JOIN Students ON Lecturerreports.StudentID = Students.StudentID " +
                "INNER JOIN Courses ON Lecturerreports.CourseID = Courses.CourseID " +
                "INNER JOIN Grades ON Lecturerreports.EnrollmentID = Grades.EnrollmentID " +
                "WHERE Lecturerreports.LecturerID = (SELECT Lecturer_id FROM Lecturer WHERE LecturerName = ?)";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, lecturerName);
            try (ResultSet resultSet = statement.executeQuery()) {
                // Print the report to the console
                printReportToConsole(resultSet);
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }

    /**
     * Writes the data from the ResultSet to a TXT file.
     *
     * @param resultSet The ResultSet containing the data to be written.
     * @param filePath   The path to the TXT file where the data will be written.
     */
    private static void writeTXTReportToFile(ResultSet resultSet, Path filePath) {
        try (BufferedWriter writer = Files.newBufferedWriter(filePath)) {
            // Write the TXT file header
            writer.write("Student Name\tCourse Name\tGrade\tLecturer Feedback\n");
            // Write data for each row in the ResultSet
            while (resultSet.next()) {
                String studentName = resultSet.getString("StudentName");
                String courseName = resultSet.getString("CourseName");
                double grade = resultSet.getDouble("Grade");
                String lecturerFeedback = resultSet.getString("LecturerFeedbackText");
                // Write data for each row to the TXT file
                writer.write(studentName + "\t" + courseName + "\t" + grade + "\t" + lecturerFeedback + "\n");
            }
        } catch (SQLException | IOException e) {
            System.err.println("Error writing TXT file: " + e.getMessage());
        }
    }

    /**
     * Prints the report data from the ResultSet to the console.
     *
     * @param resultSet The ResultSet containing the report data.
     */
    private static void printReportToConsole(ResultSet resultSet) {
        try {
            // Iterate over the ResultSet and print each row to the console
            while (resultSet.next()) {
                String studentName = resultSet.getString("StudentName");
                String courseName = resultSet.getString("CourseName");
                double grade = resultSet.getDouble("Grade");
                String lecturerFeedback = resultSet.getString("LecturerFeedbackText");
                // Print data for each row to the console
                System.out.println("Student Name: " + studentName);
                System.out.println("Course Name: " + courseName);
                System.out.println("Grade: " + grade);
                System.out.println("Lecturer Feedback: " + lecturerFeedback + "\n");
            }
        } catch (SQLException e) {
            System.err.println("Error printing report to console: " + e.getMessage());
        }
    }

}