import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Scanner;

public class Office {
    private static Scanner input = new Scanner(System.in);

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
    private static boolean updateUserInDatabase(String newUsername) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updated = false;

        try {
            // Establish connection to MySQL database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

            // Prepare SQL query to update username
            String sql = "UPDATE OFFICE SET username = ? WHERE role = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newUsername);
            stmt.setString(2, "Office"); // Assuming 'ADMIN' is the role of the admin user

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
    private static boolean updatePasswordInDatabase(String newPassword) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean updated = false;

        try {
            // Establish connection to MySQL database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/management", "root", "Alison12@");

            // Prepare SQL query to update password
            String sql = "UPDATE OFFICE SET password = ? WHERE role = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newPassword);
            stmt.setString(2, "Office"); // Assuming 'ADMIN' is the role of the admin user

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

        String sql = "SELECT Students.StudentName, Courses.CourseName, Officereports.Grade, Officereports.LecturerFeedbackText, Officereports.StudentFeedbackText, Officereports.Room " +
                "FROM Officereports " +
                "INNER JOIN Students ON Officereports.StudentID = Students.StudentID " +
                "INNER JOIN Courses ON Officereports.CourseID = Courses.CourseID";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
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
        String jdbcUrl = "jdbc:mysql://localhost:3306/management";
        String username = "root";
        String password = "Alison12@";

        String sql = "SELECT Students.StudentName, Courses.CourseName, Officereports.Grade, Officereports.LecturerFeedbackText, Officereports.StudentFeedbackText, Officereports.Room " +
                "FROM Officereports " +
                "INNER JOIN Students ON Officereports.StudentID = Students.StudentID " +
                "INNER JOIN Courses ON Officereports.CourseID = Courses.CourseID";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            Path filePath = Paths.get("reports/officereport.txt");
            writeReportToFile(resultSet, filePath);

            System.out.println("TXT report generated successfully!");
        } catch (SQLException | IOException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }

    public static void printToConsole(String lecturerName) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/management";
        String username = "root";
        String password = "Alison12@";

        String sql = "SELECT Students.StudentName, Courses.CourseName, Officereports.Grade, Officereports.LecturerFeedbackText, Officereports.StudentFeedbackText, Officereports.Room " +
                "FROM Officereports " +
                "INNER JOIN Students ON Officereports.StudentID = Students.StudentID " +
                "INNER JOIN Courses ON Officereports.CourseID = Courses.CourseID";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            // Printing to console
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
