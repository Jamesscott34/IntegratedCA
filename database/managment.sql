-- Create the database
CREATE DATABASE Management;

-- Use the database
USE Management;

Create Table ADMINS(
admin_id int auto_increment primary key,
username varchar(50),
password varchar(50),
role varchar(50)
);


Create Table LECTURER(
Lecturer_id int auto_increment primary key,
username varchar(50),
password varchar(50),
role varchar(50)
);

Create Table OFFICE(
Office_id int auto_increment primary key,
username varchar(50),
password varchar(50),
role varchar(50)
);

CREATE TABLE Students ( StudentID
 INT AUTO_INCREMENT PRIMARY KEY,
 StudentName VARCHAR(255) NOT NULL,
 Programme VARCHAR(255) NOT NULL 
);


 CREATE TABLE Enrollments ( EnrollmentID
 INT AUTO_INCREMENT PRIMARY KEY, StudentID INT,
 CourseID INT,
 FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
 FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 

 CREATE TABLE Courses ( 
 CourseID INT AUTO_INCREMENT PRIMARY KEY, 
 CourseName VARCHAR(255) NOT NULL,
 Programme VARCHAR(255) NOT NULL, LecturerID INT NOT NULL,
 Room VARCHAR(50) NOT NULL,
 FOREIGN KEY (LecturerID) REFERENCES LECTURER(Lecturer_id)
 );
 
CREATE TABLE Grades (
 GradeID INT AUTO_INCREMENT PRIMARY KEY, EnrollmentID INT,
 Grade DECIMAL(4, 2),
 FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID) 
); 
CREATE TABLE LecturerFeedback ( LecturerFeedbackID
	 INT AUTO_INCREMENT PRIMARY KEY, LecturerID INT,
	 CourseID INT, 
	 StudentID INT, 
	 LecturerFeedbackText TEXT, 
	 FOREIGN KEY (LecturerID) REFERENCES 
	 LECTURER(Lecturer_id), FOREIGN KEY (CourseID) REFERENCES Courses(CourseID), 
	 FOREIGN KEY (StudentID) REFERENCES Students(StudentID) 
);

CREATE TABLE StudentFeedback ( StudentFeedbackID
	 INT AUTO_INCREMENT PRIMARY KEY, 
	 StudentID INT, CourseID INT, FeedbackText TEXT, 
	 FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	 FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 


CREATE TABLE Officereports (
	 OfficereportID INT AUTO_INCREMENT PRIMARY KEY,
	 OfficeID INT, StudentID INT,
	 CourseID INT, Grade DECIMAL(4, 2),
	 LecturerFeedbackText TEXT,
	 StudentFeedbackText TEXT,
	 Room VARCHAR(50),
	 FOREIGN KEY (OfficeID) REFERENCES Office(Office_id),
	 FOREIGN KEY (StudentID) REFERENCES Students(StudentID), FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
 );
 
 CREATE TABLE Lecturerreports ( LecturerreportsID 
	 INT AUTO_INCREMENT PRIMARY KEY, LecturerID INT, 
	 CourseID INT, StudentID INT, 
	 EnrollmentID INT, Grade DECIMAL(4, 2), 
	 LecturerFeedbackText TEXT,
	 Room VARCHAR(50), FOREIGN KEY (LecturerID) REFERENCES LECTURER(Lecturer_id), 
	 FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
	 FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	 FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);




INSERT INTO ADMINS (username, password,role)
Values
('Admin','Java','Admin');

INSERT INTO LECTURER (username, password, role)
VALUES ('lecturer1', 'lecturerpass1', 'Lecturer'),
       ('lecturer2', 'lecturerpass2', 'Lecturer'),
       ('lecturer3', 'lecturerpass3', 'Lecturer');

INSERT INTO OFFICE (username, password, role)
VALUES ('office1', 'officepass1', 'Office'),
       ('office2', 'officepass2', 'Office'),
       ('office3', 'officepass3', 'Office');


INSERT INTO Students (StudentName, Programme)
VALUES ('John Doe', 'Computer Science'),
       ('Jane Smith', 'Engineering'),
       ('Alice Johnson', 'Business Administration');


INSERT INTO Courses (CourseName, Programme, LecturerID, Room)
VALUES ('Introduction to Programming', 'Computer Science', 1, 'Room101'),
       ('Mechanics 101', 'Engineering', 2, 'Room201'),
       ('Business Management', 'Business Administration', 3, 'Room301');

-- Assuming students are enrolled in courses
INSERT INTO Enrollments (StudentID, CourseID)
VALUES (1, 1),
       (2, 2),
       (3, 3);
       
       
-- Assuming grades are assigned to enrollments
INSERT INTO Grades (EnrollmentID, Grade)
VALUES (1, 90),
       (2, 85),
       (3, 88);
       
       
INSERT INTO LecturerFeedback (LecturerID, CourseID, StudentID, LecturerFeedbackText)
VALUES (1, 1, 1, 'Excellent student'),
       (2, 2, 2, 'Hardworking and dedicated'),
       (3, 3, 3, 'Active participation in class discussions');

INSERT INTO StudentFeedback (StudentID, CourseID, FeedbackText)
VALUES (1, 1, 'Great lecturer, very helpful'),
       (2, 2, 'Enjoyed the course content'),
       (3, 3, 'Well-organized lectures and materials');

-- Assuming office reports are generated for each student-course combination
INSERT INTO Officereports (OfficeID, StudentID, CourseID, Grade, LecturerFeedbackText, StudentFeedbackText, Room)
VALUES (1, 1, 1, 90, 'Excellent student', 'Great lecturer, very helpful', 'Room101'),
       (2, 2, 2, 85, 'Hardworking and dedicated', 'Enjoyed the course content', 'Room201'),
       (3, 3, 3, 88, 'Active participation in class discussions', 'Well-organized lectures and materials', 'Room301');


-- Assuming lecturer reports are generated for each enrollment
INSERT INTO Lecturerreports (LecturerID, CourseID, StudentID, EnrollmentID, Grade, LecturerFeedbackText, Room)
VALUES (1, 1, 1, 1, 90, 'Excellent student', 'Room101'),
       (2, 2, 2, 2, 85, 'Hardworking and dedicated', 'Room201'),
       (3, 3, 3, 3, 88, 'Active participation in class discussions', 'Room301');
