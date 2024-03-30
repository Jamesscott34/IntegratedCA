# integrated college Management System

This project represents an integrated university management system, facilitating various tasks for different roles within the university. Below is an overview of the project structure, including classes, functionalities, and database usage.

The integrated college management system project comprises several Java classes meticulously designed to cater to the diverse roles and responsibilities present within the university ecosystem. Each class encapsulates specific functionalities tailored to streamline the tasks associated with distinct user roles, ensuring smooth operation and efficient management of university resources.

Within this project, the Admin class stands as the backbone of administrative operations, offering a comprehensive suite of functionalities essential for overseeing and managing the university's administrative tasks. From modifying usernames to changing passwords, adding new users, and generating reports, the Admin class provides a robust set of methods to empower administrative users with the tools they need to maintain system integrity and manage user accounts effectively.

In parallel, the Lecturer class caters to the unique requirements of academic staff members, primarily focusing on facilitating tasks related to academic reporting and feedback management. By enabling lecturers to generate detailed reports in various formats and print them for further analysis or dissemination, this class empowers educators to track student progress, provide valuable feedback, and contribute to academic excellence effectively.

Similarly, the Office class addresses the operational needs of administrative staff responsible for office management tasks. From updating usernames and passwords to generating comprehensive reports and printing them for internal use, this class ensures that office personnel have the necessary tools at their disposal to efficiently handle day-to-day administrative operations and contribute to the smooth functioning of the university. Collectively, these classes form a cohesive framework that supports the diverse needs of university stakeholders, promoting efficiency, transparency, and collaboration across all administrative and academic functions.

## Project Overview

The project includes several Java classes to manage different roles within the university:

## Table of Contents
1. [Admin.java](#admin-java)
2. [Lecturer.java](#lecturer-java)
3. [Office.java](#office-java)
4. [User.java](#user-java)
5. [Main.java](#main-java)

### Admin.java
-Implements functionalities for modifying usernames, changing passwords, adding new users, deleting users, and generating reports.
-Utilizes updateUserInDatabase() and updatePasswordInDatabase() methods to update usernames and passwords, respectively.
-Employs addNewUserManually() to allow manual addition of users to the system.
-Implements deleteFromTable() method to delete users from the database tables.
-Provides createCSVReport() to generate CSV reports for administrative purposes.
-Includes error handling mechanisms for database operations using try-catch blocks.
-Ensures secure password handling through PreparedStatement parameters to prevent SQL injection attacks.
-Facilitates user-friendly interactions through input prompts and success/failure messages.
### Lecturer.java
-Offers functionalities tailored for lecturers, particularly in report generation and management.
-Implements methods such as createCSVReport() and createTXTReport() to generate reports in CSV and TXT formats, respectively.
-Provides printToConsole() method to display reports directly on the console for quick access.
-Enables lecturers to efficiently manage student progress and feedback through generated reports.
-Ensures report accuracy by fetching data from the database using SQL queries.
-Incorporates robust exception handling to gracefully handle database connectivity and query execution errors.
-Supports a seamless user experience through clear and concise console output.
-Promotes data integrity by securely accessing and processing sensitive information from the database.
### Office.java
-Centralizes functionalities related to office management tasks within the university system.
-Implements methods like ChangeUserName() and changePassword() to facilitate username and password updates for office users.
-Offers report generation capabilities through createCSVReport() and createTXTReport() methods for office-related data analysis.
-Enables quick access to reports through printToConsole() method, enhancing workflow efficiency.
-Ensures data accuracy by retrieving information directly from the database using SQL queries.
-Incorporates error handling mechanisms to address potential database connectivity issues or query failures.
-Provides a user-friendly interface with intuitive prompts and feedback messages.
-Fosters a secure environment by utilizing parameterized queries to prevent SQL injection attacks.
### User.java
-Represents a fundamental entity within the university system, storing essential attributes like username and role.
-Implements getters and setters to facilitate access and modification of user attributes.
-Supports role-based access control by storing and managing user roles.
-Ensures encapsulation of user data through private member variables and controlled access via accessor methods.
-Facilitates modular design and extensibility by serving as a base class for different user types within the system.
-Supports role-based functionalities by providing role-specific operations and permissions.
-Promotes code maintainability and readability by adhering to object-oriented principles.
-Enhances data integrity by enforcing encapsulation and controlled access to user attributes.
### Main.java
-Serves as the entry point for the application, orchestrating user ----interactions and system navigation.
-Implements the main() method to initialize the application and display the main menu.
-Offers intuitive navigation through the system using the Menu class methods.
-Provides error handling mechanisms to gracefully manage runtime exceptions and ensure application robustness.
-Supports seamless integration with other classes by invoking appropriate methods based on user inputs.
-Facilitates a user-friendly experience through clear instructions and informative prompts.
-Ensures scalability and maintainability through modular design and separation of concerns.
-Promotes system reliability by handling potential edge cases and exceptions effectively.


GitHub Repository: [IntegratedCA](https://github.com/Jamesscott34/IntegratedCA.git)

## Database

The project uses a MySQL database named "management" with the following tables:

### Admins
- Stores information about admin users, including username and password.

### Lecturer
- Contains data about lecturers, including their username and password.

### Office
- Stores details about office users, including username and password.

### Students
- Stores information about students, including their names.

### Courses
- Contains data about courses offered in the university, including course names.

### Grades
- Stores grades for different students in different courses.

### Lecturerreports
- Contains reports generated by lecturers, including student names, course names, grades, and feedback.

### Officereports
- Stores reports generated by the office, including student names, course names, grades, feedback, and room details.

