import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Scanner;



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
            conn = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);
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
            conn = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);
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

    public static void createCSVReport(String lecturerName) {
        String sql = "SELECT S.StudentName, C.CourseName, O.Grade, O.StudentFeedbackText, O.Room " +
                "FROM Officereports O " +
                "INNER JOIN Students S ON O.StudentID = S.StudentID " +
                "INNER JOIN Courses C ON O.CourseID = C.CourseID";

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            Path filePath = Paths.get("reports/officereport.csv");
            writeReportToFile(resultSet, filePath);

            System.out.println("CSV report generated successfully!");
        } catch (SQLException | IOException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }

    public static void createTXTReport(String lecturerName) {
        String sql = "SELECT S.StudentName, C.CourseName, O.Grade, O.StudentFeedbackText, O.Room " +
                "FROM Officereports O " +
                "INNER JOIN Students S ON O.StudentID = S.StudentID " +
                "INNER JOIN Courses C ON O.CourseID = C.CourseID";

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            Path filePath = Paths.get("reports/officereport.txt");
            writeTxtReportToFile(resultSet, filePath);

            System.out.println("TXT report generated successfully!");
        } catch (SQLException | IOException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }

    private static void writeTxtReportToFile(ResultSet resultSet, Path filePath) throws IOException, SQLException {
        try (BufferedWriter writer = Files.newBufferedWriter(filePath)) {
            writer.write("Student Name, Course Name, Grade, Student Feedback, Room\n");

            while (resultSet.next()) {
                String studentName = resultSet.getString("StudentName");
                String courseName = resultSet.getString("CourseName");
                double grade = resultSet.getDouble("Grade");
                String studentFeedback = resultSet.getString("StudentFeedbackText");
                String room = resultSet.getString("Room");

                writer.write(studentName + ", " + courseName + ", " + grade + ", " + studentFeedback + ", " + room + "\n");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private static void writeReportToFile(ResultSet resultSet, Path filePath) throws IOException, SQLException {
        try (BufferedWriter writer = Files.newBufferedWriter(filePath)) {
            writer.write("Student Name, Course Name, Grade, Student Feedback, Room\n");

            while (resultSet.next()) {
                String studentName = resultSet.getString("StudentName");
                String courseName = resultSet.getString("CourseName");
                double grade = resultSet.getDouble("Grade");
                String studentFeedback = resultSet.getString("StudentFeedbackText");
                String room = resultSet.getString("Room");

                writer.write(studentName + ", " + courseName + ", " + grade + ", " + studentFeedback + ", " + room + "\n");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void printToConsole(String lecturerName) {
        String sql = "SELECT S.StudentName, C.CourseName, O.Grade, O.StudentFeedbackText, O.Room " +
                "FROM Officereports O " +
                "INNER JOIN Students S ON O.StudentID = S.StudentID " +
                "INNER JOIN Courses C ON O.CourseID = C.CourseID";

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                String studentName = resultSet.getString("StudentName");
                String courseName = resultSet.getString("CourseName");
                double grade = resultSet.getDouble("Grade");
                String studentFeedback = resultSet.getString("StudentFeedbackText");
                String room = resultSet.getString("Room");

                System.out.println("Student Name: " + studentName);
                System.out.println("Course Name: " + courseName);
                System.out.println("Grade: " + grade);
                System.out.println("Student Feedback: " + studentFeedback);
                System.out.println("Room: " + room);
                System.out.println();
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }
}
