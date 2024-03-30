import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Scanner;

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

    public static void createCSVReport(String lecturerName) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/management";
        String username = "root";
        String password = "Alison12@";

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
                Path filePath = Paths.get("reports/" + lecturerName + ".csv");
                writeCSVReportToFile(resultSet, filePath);
            }
            System.out.println("CSV report generated successfully!");
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }


    public static void writeCSVReportToFile(ResultSet resultSet, Path filePath) {
        // Create the reports folder if it doesn't exist
        createReportsFolder();

        // Append the file name to the reports folder path
        Path reportFilePath = Paths.get(REPORTS_FOLDER, filePath.getFileName().toString());

        try (FileWriter writer = new FileWriter(reportFilePath.toFile())) {
            writer.write("Student Name, Course Name, Grade, Lecturer Feedback\n");
            while (resultSet.next()) {
                String studentName = resultSet.getString("StudentName");
                String courseName = resultSet.getString("CourseName");
                double grade = resultSet.getDouble("Grade");
                String lecturerFeedback = resultSet.getString("LecturerFeedbackText");
                writer.write(studentName + ", " + courseName + ", " + grade + ", " + lecturerFeedback + "\n");
            }
            System.out.println("CSV report saved successfully at: " + reportFilePath.toString());
        } catch (SQLException | IOException e) {
            System.err.println("Error writing CSV file: " + e.getMessage());
        }
    }

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

    public static void createTXTReport(String lecturerName) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/management";
        String username = "root";
        String password = "Alison12@";

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
                Path filePath = Paths.get("reports/" + lecturerName + ".txt");
                writeTXTReportToFile(resultSet, filePath);
            }
            System.out.println("TXT report generated successfully!");
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }

    public static void printToConsole(String lecturerName) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/management";
        String username = "root";
        String password = "Alison12@";

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
                printReportToConsole(resultSet);
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }


    private static void writeTXTReportToFile(ResultSet resultSet, Path filePath) {
        try (BufferedWriter writer = Files.newBufferedWriter(filePath)) {
            writer.write("Student Name\tCourse Name\tGrade\tLecturer Feedback\n");
            while (resultSet.next()) {
                String studentName = resultSet.getString("StudentName");
                String courseName = resultSet.getString("CourseName");
                double grade = resultSet.getDouble("Grade");
                String lecturerFeedback = resultSet.getString("LecturerFeedbackText");
                writer.write(studentName + "\t" + courseName + "\t" + grade + "\t" + lecturerFeedback + "\n");
            }
        } catch (SQLException | IOException e) {
            System.err.println("Error writing TXT file: " + e.getMessage());
        }
    }

    private static void printReportToConsole(ResultSet resultSet) {
        try {
            while (resultSet.next()) {
                String studentName = resultSet.getString("StudentName");
                String courseName = resultSet.getString("CourseName");
                double grade = resultSet.getDouble("Grade");
                String lecturerFeedback = resultSet.getString("LecturerFeedbackText");
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