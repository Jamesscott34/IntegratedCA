import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Scanner;

import static com.mysql.cj.conf.PropertyKey.PASSWORD;

/**
 * Represents the office functionality in a university system.
 * This class provides methods for managing office-related tasks, such as updating usernames and passwords,
 * generating reports, and printing reports to the console.
 */
public class Office {
    private static Scanner input = new Scanner(System.in);


    /**
     * Changes the username of an office user in the database.
     * Prompts the user to enter the new username and updates it in the database.
     */
    public static void ChangeUserName() {
        System.out.print("Enter the new username: ");
        String newUsername = input.nextLine();

        // Update the username in the database
        boolean updated = updateUserInDatabase(newUsername);

        if (updated) {
            System.out.println("Office username updated successfully.");
        } else {
            System.out.println("Failed to update office username.");
        }
    }

    /**
     * Changes the password of an office user in the database.
     * Prompts the user to enter the new password and updates it in the database.
     */
    public static void changePassword() {
        System.out.print("Enter the new password: ");
        String newPassword = input.nextLine();

        // Update the password in the database
        boolean updated = updatePasswordInDatabase(newPassword);

        if (updated) {
            System.out.println("Office password updated successfully.");
        } else {
            System.out.println("Failed to update office password.");
        }
    }

    /**
     * Updates the username of an office user in the database.
     *
     * @param newUsername The new username to be set for the office user.
     * @return true if the username is updated successfully, false otherwise.
     */
    private static boolean updateUserInDatabase(String newUsername) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updated = false;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");
            String sql = "UPDATE OFFICE SET username = ? WHERE role = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newUsername);
            stmt.setString(2, "Office");

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                updated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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
     * Updates the password of an office user in the database.
     *
     * @param newPassword The new password to be set for the office user.
     * @return true if the password is updated successfully, false otherwise.
     */
    private static boolean updatePasswordInDatabase(String newPassword) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updated = false;

        try {
            conn = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, String.valueOf(PASSWORD));
            String sql = "UPDATE OFFICE SET password = ? WHERE role = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newPassword);
            stmt.setString(2, "Office");

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                updated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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
     * Generates a CSV report containing office data and writes it to a file.
     *
     * @param lecturerName The name of the lecturer for whom the report is generated.
     */
    public static void createCSVReport(String lecturerName) {


        String sql = "SELECT Students.StudentName, Courses.CourseName, Officereports.Grade, Officereports.LecturerFeedbackText, Officereports.StudentFeedbackText, Officereports.Room " +
                "FROM Officereports " +
                "INNER JOIN Students ON Officereports.StudentID = Students.StudentID " +
                "INNER JOIN Courses ON Officereports.CourseID = Courses.CourseID";

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, String.valueOf(PASSWORD));
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            Path filePath = Paths.get("reports/officereport.csv");
            writeReportToFile(resultSet, filePath);

            System.out.println("CSV report generated successfully!");
        } catch (SQLException | IOException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }

    /**
     * Generates a TXT report containing office data and writes it to a file.
     *
     * @param lecturerName The name of the lecturer for whom the report is generated.
     */
    public static void createTXTReport(String lecturerName) {


        String sql = "SELECT Students.StudentName, Courses.CourseName, Officereports.Grade, Officereports.LecturerFeedbackText, Officereports.StudentFeedbackText, Officereports.Room " +
                "FROM Officereports " +
                "INNER JOIN Students ON Officereports.StudentID = Students.StudentID " +
                "INNER JOIN Courses ON Officereports.CourseID = Courses.CourseID";

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, String.valueOf(PASSWORD));
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            Path filePath = Paths.get("reports/officereport.txt");
            writeReportToFile(resultSet, filePath);

            System.out.println("TXT report generated successfully!");
        } catch (SQLException | IOException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }

    /**
     * Prints office data to the console.
     *
     * @param lecturerName The name of the lecturer for whom the report is generated.
     */
    public static void printToConsole(String lecturerName) {


        String sql = "SELECT Students.StudentName, Courses.CourseName, Officereports.Grade, Officereports.LecturerFeedbackText, Officereports.StudentFeedbackText, Officereports.Room " +
                "FROM Officereports " +
                "INNER JOIN Students ON Officereports.StudentID = Students.StudentID " +
                "INNER JOIN Courses ON Officereports.CourseID = Courses.CourseID";

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, String.valueOf(PASSWORD));
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                String studentName = resultSet.getString("StudentName");
                String courseName = resultSet.getString("CourseName");
                double grade = resultSet.getDouble("Grade");
                String lecturerFeedback = resultSet.getString("LecturerFeedbackText");
                String studentFeedback = resultSet.getString("StudentFeedbackText");
                String room = resultSet.getString("Room");

                System.out.println("Student Name: " + studentName);
                System.out.println("Course Name: " + courseName);
                System.out.println("Grade: " + grade);
                System.out.println("Lecturer Feedback: " + lecturerFeedback);
                System.out.println("Student Feedback: " + studentFeedback);
                System.out.println("Room: " + room);
                System.out.println();
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }

    /**
     * Writes the office report data to a file.
     *
     * @param resultSet The result set containing the office report data.
     * @param filePath  The path of the file where the report will be written.
     * @throws IOException  If an I/O error occurs while writing to the file.
     * @throws SQLException If a SQL error occurs while processing the result set.
     */
    private static void writeReportToFile(ResultSet resultSet, Path filePath) throws IOException, SQLException {
        try (FileWriter writer = new FileWriter(filePath.toFile())) {
            writer.write("Student Name, Course Name, Grade, Lecturer Feedback, Student Feedback, Room\n");

            while (resultSet.next()) {
                String studentName = resultSet.getString("StudentName");
                String courseName = resultSet.getString("CourseName");
                double grade = resultSet.getDouble("Grade");
                String lecturerFeedback = resultSet.getString("LecturerFeedbackText");
                String studentFeedback = resultSet.getString("StudentFeedbackText");
                String room = resultSet.getString("Room");

                writer.write(studentName + ", " + courseName + ", " + grade + ", " + lecturerFeedback + ", " + studentFeedback + ", " + room + "\n");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
