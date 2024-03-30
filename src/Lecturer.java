import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import static com.mysql.cj.conf.PropertyKey.PASSWORD;


/**
 * Represents a lecturer in a college managment system.
 * This class provides functionality related to managing lecturer data and generating reports.
 */
public class Lecturer {

    private static Scanner input = new Scanner(System.in);



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
            conn = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);

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
            conn = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);

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



    private static void generateLecturerSpecificReport() {
        String lecturerName = getLecturerName();
        String outputFormat = getOutputFormat();

        if ("txt".equalsIgnoreCase(outputFormat) || "csv".equalsIgnoreCase(outputFormat) || "terminal".equalsIgnoreCase(outputFormat)) {
            generateReport(lecturerName, outputFormat);
        } else {
            System.out.println("Invalid output format.");
        }
    }

    static String getLecturerName() {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter the lecturer's name: ");
        return input.nextLine();
    }

    static String getOutputFormat() {
        Scanner input = new Scanner(System.in);
        System.out.println("Choose the output format:");
        System.out.println("1. Text");
        System.out.println("2. CSV");
        System.out.println("3. Terminal");

        int choice = getIntInput(input);

        switch (choice) {
            case 1:
                return "txt";
            case 2:
                return "csv";
            case 3:
                return "terminal";
            default:
                return "invalid";
        }
    }

    private static int getIntInput(Scanner input) {
        while (true) {
            try {
                System.out.print("Enter your choice: ");
                return Integer.parseInt(input.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Invalid input. Please enter a number.");
            }
        }
    }

    public static void generateReport(String lecturerName, String outputFormat) {
        List<String> students = getStudentsForLecturer(lecturerName);

        if (students.isEmpty()) {
            System.out.println("No students found for the lecturer.");
            return;
        }

        Scanner scanner = new Scanner(System.in);
        System.out.println("Select a student:");
        for (int i = 0; i < students.size(); i++) {
            System.out.println((i + 1) + ". " + students.get(i));
        }
        System.out.print("Enter the number of the student: ");
        int choice = scanner.nextInt();

        String selectedStudent = students.get(choice - 1);

        String sql = "SELECT Lecturerreports.StudentName, Lecturerreports.Grade, Lecturerreports.LecturerFeedbackText " +
                "FROM Lecturerreports " +
                "INNER JOIN Students ON Lecturerreports.StudentID = Students.StudentID " +
                "WHERE Lecturerreports.LecturerID = (SELECT LecturerID FROM Lecturer WHERE Username = ?) " +
                "AND Lecturerreports.StudentName = ?";

        // List to store the reports
        List<StudentReport> studentReports = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, lecturerName);
            statement.setString(2, selectedStudent);

            // Execute the query
            try (ResultSet resultSet = statement.executeQuery()) {
                // Populate the list with the results
                while (resultSet.next()) {
                    String studentName = resultSet.getString("StudentName");
                    double grade = resultSet.getDouble("Grade");
                    String feedbackText = resultSet.getString("LecturerFeedbackText");
                    studentReports.add(new StudentReport(studentName, grade, feedbackText));
                }
            }

            // Process the list based on the output format
            if ("csv".equalsIgnoreCase(outputFormat)) {
                saveToCSV(studentReports, lecturerName);
            } else if ("txt".equalsIgnoreCase(outputFormat)) {
                saveToTXT(studentReports, lecturerName);
            } else {
                printToConsole(studentReports);
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }


    public static List<String> getStudentsForLecturer(String lecturerName) {
        List<String> students = new ArrayList<>();

        // Get the programme associated with the lecturer
        String programmeName = getProgrammeForLecturer(lecturerName);

        // If no programme found, return empty list
        if (programmeName == null) {
            return students;
        }

        // Get students for the lecturer's programme
        String lecturerForProgramme = getLecturerForProgramme(programmeName);
        if (lecturerForProgramme != null && lecturerForProgramme.equals(lecturerName)) {
            // Retrieve students enrolled in the lecturer's programme
            students = getStudentsForProgramme(programmeName);
        }

        return students;
    }

    private static String getProgrammeForLecturer(String lecturerName) {
        String programmeName = null;
        String sql = "SELECT Programmes.ProgrammeName " +
                "FROM Courses " +
                "INNER JOIN Lecturer ON Courses.LecturerID = Lecturer.Lecturer_id " +
                "INNER JOIN Programmes ON Courses.ProgrammeID = Programmes.ProgrammeID " +
                "WHERE Lecturer.Username = ?";

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, lecturerName);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    programmeName = resultSet.getString("ProgrammeName");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return programmeName;
    }

    private static List<String> getStudentsForProgramme(String programmeName) {
        List<String> students = new ArrayList<>();
        String sql = "SELECT StudentName FROM Students WHERE ProgrammeID = " +
                "(SELECT ProgrammeID FROM Programmes WHERE ProgrammeName = ?)";

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, programmeName);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    String studentName = resultSet.getString("StudentName");
                    students.add(studentName);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return students;
    }

    private static String getLecturerForProgramme(String programmeName) {
        String lecturerName = null;
        String sql = "SELECT Lecturer.Username " +
                "FROM Courses " +
                "INNER JOIN Lecturer ON Courses.LecturerID = Lecturer.Lecturer_id " +
                "INNER JOIN Programmes ON Courses.ProgrammeID = Programmes.ProgrammeID " +
                "WHERE Programmes.ProgrammeName = ?";

        try (Connection connection = DriverManager.getConnection(User.JDBC_URL, User.USERNAME, User.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, programmeName);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    lecturerName = resultSet.getString("Username");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lecturerName;
    }

    private static void saveToCSV(List<StudentReport> studentReports, String lecturerName) throws IOException {
        Path directoryPath = Paths.get("reports");
        Path filePath = directoryPath.resolve(lecturerName + ".csv");

        // Create the 'reports' directory if it doesn't exist
        if (!Files.exists(directoryPath)) {
            try {
                Files.createDirectories(directoryPath);
            } catch (IOException e) {
                System.err.println("Failed to create the 'reports' directory: " + e.getMessage());
                return;
            }
        }

        try (BufferedWriter writer = Files.newBufferedWriter(filePath)) {
            writer.write("Student Name, Grade, Lecturer Feedback\n");
            for (StudentReport report : studentReports) {
                writer.write(report.getStudentName() + ", " + report.getGrade() + ", " + report.getFeedbackText() + "\n");
            }
            System.out.println("CSV report saved successfully at: " + filePath.toString());
        }
    }

    private static void saveToTXT(List<StudentReport> studentReports, String lecturerName) throws IOException {
        Path filePath = Paths.get("reports/" + lecturerName + ".txt");
        try (BufferedWriter writer = Files.newBufferedWriter(filePath)) {
            writer.write("Student Name\tGrade\tLecturer Feedback\n");
            for (StudentReport report : studentReports) {
                writer.write(report.getStudentName() + "\t" + report.getGrade() + "\t" + report.getFeedbackText() + "\n");
            }
            System.out.println("TXT report saved successfully at: " + filePath.toString());
        }
    }

    private static void printToConsole(List<StudentReport> studentReports) {
        for (StudentReport report : studentReports) {
            System.out.println("Student Name: " + report.getStudentName());
            System.out.println("Grade: " + report.getGrade());
            System.out.println("Lecturer Feedback: " + report.getFeedbackText() + "\n");
        }
    }

}