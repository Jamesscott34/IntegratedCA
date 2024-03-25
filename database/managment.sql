-- Create the database
CREATE DATABASE Management;

-- Use the database
USE Management;

CREATE TABLE ADMINS (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) ,
    password VARCHAR(50) ,
    role varchar (50)
);

INSERT INTO ADMINS (username, password,role)
Values
('Admin','Java','Admin');




CREATE TABLE OFFICE (
    Office_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) ,
    password VARCHAR(50) ,
    role varchar (50)
   
);

CREATE TABLE LECTURER (
    Lecturer_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) ,
    password VARCHAR(50) ,
    role varchar (50)
    
);
INSERT INTO LECTURER (Username, password, role)
VALUES 
	('lecturer1', 'password1', 'lecturer'),
    ('lecturer2', 'password2', 'lecturer'),
    ('lecturer3', 'password3', 'lecturer'),
    ('lecturer4', 'password4', 'lecturer'),
    ('lecturer5', 'password5', 'lecturer'),
    ('lecturer6', 'password6', 'lecturer'),
    ('lecturer7', 'password7', 'lecturer'),
    ('lecturer8', 'password8', 'lecturer'),
    ('lecturer9', 'password9', 'lecturer'),
    ('lecturer10', 'password10', 'lecturer'),
    ('lecturer11', 'password11', 'lecturer'),
    ('lecturer12', 'password12', 'lecturer'),
    ('lecturer13', 'password13', 'lecturer'),
    ('lecturer14', 'password14', 'lecturer'),
    ('lecturer15', 'password15', 'lecturer'),
    ('lecturer16', 'password16', 'lecturer'),
    ('lecturer17', 'password17', 'lecturer'),
    ('lecturer18', 'password18', 'lecturer'),
    ('lecturer19', 'password19', 'lecturer'),
    ('lecturer20', 'password20', 'lecturer'),
	('lecturer21', 'password21', 'lecturer'),
    ('lecturer22', 'password22', 'lecturer'),
    ('lecturer23', 'password23', 'lecturer'),
    ('lecturer24', 'password24', 'lecturer'),
    ('lecturer25', 'password25', 'lecturer'),
    ('lecturer26', 'password26', 'lecturer'),
    ('lecturer27', 'password27', 'lecturer'),
    ('lecturer28', 'password28', 'lecturer'),
    ('lecturer29', 'password29', 'lecturer'),
    ('lecturer30', 'password30', 'lecturer'),
    ('lecturer31', 'password31', 'lecturer'),
    ('lecturer32', 'password32', 'lecturer'),
    ('lecturer33', 'password33', 'lecturer'),
    ('lecturer34', 'password34', 'lecturer'),
    ('lecturer35', 'password35', 'lecturer'),
    ('lecturer36', 'password36', 'lecturer'),
    ('lecturer37', 'password37', 'lecturer'),
    ('lecturer38', 'password38', 'lecturer'),
    ('lecturer39', 'password39', 'lecturer'),
    ('lecturer40', 'password40', 'lecturer');

INSERT INTO OFFICE (Username, password, role)
VALUES 
    
    ('office1', 'password1', 'office'),
    ('office2', 'password2', 'office'),
    ('office3', 'password3', 'office'),
    ('office4', 'password4', 'office'),
    ('office5', 'password5', 'office'),
    ('office6', 'password6', 'office'),
    ('office7', 'password7', 'office'),
    ('office8', 'password8', 'office'),
    ('office9', 'password9', 'office'),
    ('office10', 'password10', 'office'),
    ('office11', 'password11', 'office'),
    ('office12', 'password12', 'office'),
    ('office13', 'password13', 'office'),
    ('office14', 'password14', 'office'),
    ('office15', 'password15', 'office'),
    ('office16', 'password16', 'office'),
    ('office17', 'password17', 'office'),
    ('office18', 'password18', 'office'),
    ('office19', 'password19', 'office'),
    ('office20', 'password20', 'office'),
    ('office21', 'password1', 'office'),
    ('office22', 'password2', 'office'),
    ('office23', 'password3', 'office'),
    ('office24', 'password4', 'office'),
    ('office25', 'password5', 'office'),
    ('office26', 'password6', 'office'),
    ('office27', 'password7', 'office'),
    ('office28', 'password8', 'office'),
    ('office29', 'password9', 'office'),
    ('office30', 'password10', 'office'),
    ('office31', 'password11', 'office'),
    ('office32', 'password12', 'office'),
    ('office33', 'password13', 'office'),
    ('office34', 'password14', 'office'),
    ('office35', 'password15', 'office'),
    ('office36', 'password16', 'office'),
    ('office37', 'password17', 'office'),
    ('office38', 'password18', 'office'),
    ('office39', 'password19', 'office'),
    ('office40', 'password20', 'office');
    


-- Create tables
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    Programme VARCHAR(255) NOT NULL,
    Lecturer VARCHAR(255) NOT NULL,
    Room VARCHAR(50) NOT NULL
);

-- Generating data for Courses table
INSERT INTO Courses (CourseName, Programme, Lecturer, Room)
VALUES 
    ('Mathematics 101', 'Mathematics', 'lecturer1', 'Room A101'),
    ('Physics 101', 'Physics', 'lecturer2', 'Room B102'),
    ('Biology 101', 'Biology', 'lecturer3', 'Room C103'),
    ('Chemistry 101', 'Chemistry', 'lecturer4', 'Room D104'),
    ('Computer Science 101', 'Computer Science', 'lecturer5', 'Room E105'),
    ('Literature 101', 'Literature', 'lecturer6', 'Room F106'),
    ('History 101', 'History', 'lecturer7', 'Room G107'),
    ('Economics 101', 'Economics', 'lecturer8', 'Room H108'),
    ('Psychology 101', 'Psychology', 'lecturer9', 'Room I109'),
    ('Sociology 101', 'Sociology', 'lecturer10', 'Room J110'),
    ('Mathematics 102', 'Mathematics', 'lecturer1', 'Room A111'),
    ('Physics 102', 'Physics', 'lecturer2', 'Room B112'),
    ('Biology 102', 'Biology', 'lecturer3', 'Room C113'),
    ('Chemistry 102', 'Chemistry', 'lecturer4', 'Room D114'),
    ('Computer Science 102', 'Computer Science', 'lecturer5', 'Room E115'),
    ('Literature 102', 'Literature', 'lecturer6', 'Room F116'),
    ('History 102', 'History', 'lecturer7', 'Room G117'),
    ('Economics 102', 'Economics', 'lecturer8', 'Room H118'),
    ('Psychology 102', 'Psychology', 'lecturer9', 'Room I119'),
    ('Sociology 102', 'Sociology', 'lecturer10', 'Room J120'),
    ('Mathematics 110', 'Mathematics', 'lecturer1', 'Room A201'),
    ('Physics 110', 'Physics', 'lecturer2', 'Room B202'),
    ('Biology 110', 'Biology', 'lecturer3', 'Room C203'),
    ('Chemistry 110', 'Chemistry', 'lecturer4', 'Room D204'),
    ('Computer Science 110', 'Computer Science', 'lecturer5', 'Room E205'),
    ('Literature 110', 'Literature', 'lecturer6', 'Room F206'),
    ('History 110', 'History', 'lecturer7', 'Room G207'),
    ('Economics 110', 'Economics', 'lecturer8', 'Room H208'),
    ('Psychology 110', 'Psychology', 'lecturer9', 'Room I209'),
    ('Introduction to Programming', 'Computer Science', 'lecturer11', 'Room A101'),
    ('Data Structures and Algorithms', 'Computer Science', 'lecturer12', 'Room B102'),
    ('Object-Oriented Programming', 'Computer Science', 'lecturer13', 'Room C103'),
    ('Web Development', 'Computer Science', 'lecturer14', 'Room D104'),
    ('Database Management', 'Computer Science', 'lecturer15', 'Room E105'),
    ('Software Engineering', 'Computer Science', 'lecturer16', 'Room F106'),
    ('Computer Networks', 'Computer Science', 'lecturer17', 'Room G107'),
    ('Operating Systems', 'Computer Science', 'lecturer18', 'Room H108'),
    ('Artificial Intelligence', 'Computer Science', 'lecturer19', 'Room I109'),
    ('Cybersecurity', 'Computer Science', 'lecturer20', 'Room J110'),
    ('Python Programming', 'Computer Science', 'lecturer21', 'Room A111'),
    ('Java Programming', 'Computer Science', 'lecturer22', 'Room B112'),
    ('C++ Programming', 'Computer Science', 'lecturer23', 'Room C113'),
    ('JavaScript Programming', 'Computer Science', 'lecturer24', 'Room D114'),
    ('Ruby Programming', 'Computer Science', 'lecturer25', 'Room E115'),
    ('PHP Programming', 'Computer Science', 'lecturer26', 'Room F116'),
    ('Swift Programming', 'Computer Science', 'lecturer27', 'Room G117'),
    ('Kotlin Programming', 'Computer Science', 'lecturer28', 'Room H118'),
    ('R Programming', 'Computer Science', 'lecturer29', 'Room I119'),
    ('Go Programming', 'Computer Science', 'lecturer30', 'Room J120'),
    ('Scala Programming', 'Computer Science', 'lecturer31', 'Room A121'),
    ('Rust Programming', 'Computer Science', 'lecturer32', 'Room B122'),
    ('TypeScript Programming', 'Computer Science', 'lecturer33', 'Room C123'),
    ('Haskell Programming', 'Computer Science', 'lecturer34', 'Room D124'),
    ('Perl Programming', 'Computer Science', 'lecturer35', 'Room E125'),
    ('Lua Programming', 'Computer Science', 'lecturer36', 'Room F126'),
    ('Dart Programming', 'Computer Science', 'lecturer37', 'Room G127'),
    ('Matlab Programming', 'Computer Science', 'lecturer38', 'Room H128'),
    ('Clojure Programming', 'Computer Science', 'lecturer39', 'Room I129'),
    ('Julia Programming', 'Computer Science', 'lecturer40', 'Room J130'),
    ('Python Programming', 'Computer Science', 'lecturer22', 'Room A131'),
    ('Java Programming', 'Computer Science', 'lecturer32', 'Room B132'),
    ('C++ Programming', 'Computer Science', 'lecturer33', 'Room C133'),
    ('JavaScript Programming', 'Computer Science', 'lecturer24', 'Room D134'),
    ('Ruby Programming', 'Computer Science', 'lecturer5', 'Room E135'),
    ('PHP Programming', 'Computer Science', 'lecturer6', 'Room F136'),
    ('Swift Programming', 'Computer Science', 'lecturer7', 'Room G137'),
    ('Kotlin Programming', 'Computer Science', 'lecturer8', 'Room H138'),
    ('R Programming', 'Computer Science', 'lecturer4', 'Room I139'),
    ('Go Programming', 'Computer Science', 'lecturer40', 'Room J140'),
    ('Sociology 110', 'Sociology', 'lecturer10', 'Room J210');


CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(255) NOT NULL,
    Programme VARCHAR(255) NOT NULL
);

-- Generating data for Students table
INSERT INTO Students (StudentName, Programme)
VALUES 
    ('Alice', 'Computer Science'),
    ('Bob', 'Computer Science'),
    ('Charlie', 'Computer Science'),
    ('David', 'Computer Science'),
    ('Emma', 'Computer Science'),
    ('Frank', 'Computer Science'),
    ('Grace', 'Computer Science'),
    ('Henry', 'Computer Science'),
    ('Ivy', 'Computer Science'),
    ('Jack', 'Computer Science'),
    ('Katie', 'Computer Science'),
    ('Liam', 'Computer Science'),
    ('Mia', 'Computer Science'),
    ('Noah', 'Computer Science'),
    ('Olivia', 'Computer Science'),
    ('Sophia', 'Computer Science'),
    ('William', 'Computer Science'),
    ('Ava', 'Computer Science'),
    ('Ethan', 'Computer Science'),
    ('Amelia', 'Computer Science'),
    ('James', 'Computer Science'),
    ('Isabella', 'Computer Science'),
    ('Alexander', 'Computer Science'),
    ('Abigail', 'Computer Science'),
    ('Michael', 'Computer Science'),
    ('Emily', 'Computer Science'),
    ('Benjamin', 'Computer Science'),
    ('Charlotte', 'Computer Science'),
    ('Daniel', 'Computer Science'),
    ('Harper', 'Computer Science'),
    ('Matthew', 'Computer Science'),
    ('Ella', 'Computer Science'),
    ('Jackson', 'Computer Science'),
    ('Scarlett', 'Computer Science'),
    ('Lucas', 'Computer Science'),
    ('Avery', 'Computer Science'),
    ('Logan', 'Computer Science'),
    ('Mila', 'Computer Science'),
    ('Oliver', 'Computer Science'),
    ('Lily', 'Computer Science'),
    ('Elijah', 'Computer Science'),
    ('Aria', 'Computer Science'),
    ('Jacob', 'Computer Science'),
    ('Sofia', 'Computer Science'),
    ('Sebastian', 'Computer Science'),
    ('Luna', 'Computer Science'),
    ('Carter', 'Computer Science'),
    ('Chloe', 'Computer Science'),
    ('Wyatt', 'Computer Science'),
    ('Layla', 'Computer Science');


CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Generating data for Enrollments table
INSERT INTO Enrollments (StudentID, CourseID)
VALUES 
    -- Enrollment for student 1
    (1, 1), -- Alice enrolled in Mathematics 101
    (1, 11), -- Alice enrolled in Introduction to Programming

    -- Enrollment for student 2
    (2, 2), -- Bob enrolled in Physics 101
    (2, 12), -- Bob enrolled in Data Structures and Algorithms

    -- Enrollment for student 3
    (3, 3), -- Charlie enrolled in Biology 101
    (3, 13), -- Charlie enrolled in Object-Oriented Programming

    -- Continue enrolling students in courses...

    -- Repeating enrollments to reach 50 observations
    (25, 10), -- Michael enrolled in Cybersecurity
    (25, 20), -- Michael enrolled in Python Programming

    (26, 5), -- Emily enrolled in Software Engineering
    (26, 15), -- Emily enrolled in Database Management

    (27, 15), -- Benjamin enrolled in Database Management
    (27, 25), -- Benjamin enrolled in Ruby Programming

    (28, 20), -- Charlotte enrolled in Python Programming
    (28, 30), -- Charlotte enrolled in Go Programming

    -- Continue repeating enrollments until reaching 50 observations
    (29, 10), -- Daniel enrolled in Cybersecurity
    (29, 21), -- Daniel enrolled in Python Programming

    (30, 5), -- Harper enrolled in Software Engineering
    (30, 22), -- Harper enrolled in Java Programming

    (31, 1), -- Matthew enrolled in Mathematics 101
    (31, 23), -- Matthew enrolled in C++ Programming

    (32, 3), -- Ella enrolled in Biology 101
    (32, 24), -- Ella enrolled in JavaScript Programming

    (33, 12), -- Jackson enrolled in Data Structures and Algorithms
    (33, 25), -- Jackson enrolled in Ruby Programming

    (34, 13), -- Scarlett enrolled in Object-Oriented Programming
    (34, 26), -- Scarlett enrolled in PHP Programming

    (35, 11), -- Lucas enrolled in Introduction to Programming
    (35, 27), -- Lucas enrolled in Swift Programming

    (36, 14), -- Avery enrolled in Web Development
    (36, 28), -- Avery enrolled in Kotlin Programming

    (37, 15), -- Logan enrolled in Database Management
    (37, 29), -- Logan enrolled in R Programming

    (38, 16), -- Mila enrolled in Software Engineering
    (38, 30), -- Mila enrolled in Go Programming

    (39, 17), -- Oliver enrolled in Computer Networks
    (39, 31), -- Oliver enrolled in Scala Programming

    (40, 18), -- Elijah enrolled in Operating Systems
    (40, 32), -- Elijah enrolled in Rust Programming

    (41, 19), -- Aria enrolled in Artificial Intelligence
    (41, 33), -- Aria enrolled in TypeScript Programming

    (42, 20), -- Jacob enrolled in Cybersecurity
    (42, 34), -- Jacob enrolled in Haskell Programming

    (43, 21), -- Sofia enrolled in Python Programming
    (43, 35), -- Sofia enrolled in Perl Programming

    (44, 22), -- Sebastian enrolled in Java Programming
    (44, 36), -- Sebastian enrolled in Lua Programming

    (45, 23), -- Luna enrolled in C++ Programming
    (45, 37), -- Luna enrolled in Dart Programming

    (46, 24), -- Carter enrolled in JavaScript Programming
    (46, 38), -- Carter enrolled in Matlab Programming

    (47, 25), -- Chloe enrolled in Ruby Programming
    (47, 39), -- Chloe enrolled in Clojure Programming

    (48, 26), -- Wyatt enrolled in PHP Programming
    (48, 40), -- Wyatt enrolled in Julia Programming

    (49, 27), -- Layla enrolled in Swift Programming
    (49, 1), -- Layla enrolled in Mathematics 101

    (50, 28), -- Emily enrolled in Kotlin Programming
    (50, 2); -- Emily enrolled in Physics 101


CREATE TABLE Grades (
    GradeID INT AUTO_INCREMENT PRIMARY KEY,
    EnrollmentID INT,
    Grade DECIMAL(4, 2),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);
-- Generating data for Grades table
INSERT INTO Grades (EnrollmentID, Grade)
VALUES 
    (1, 87.5),
    (2, 92.0),
    (3, 78.0),
    (4, 85.5),
    (5, 91.0),
    (6, 83.5),
    (7, 89.0),
    (8, 94.5),
    (9, 85.0),
    (10, 90.5),
    (11, 88.0),
    (12, 93.0),
    (13, 81.5),
    (14, 88.5),
    (15, 92.5),
    (16, 84.0),
    (17, 90.0),
    (18, 86.0),
    (19, 89.5),
    (20, 93.5),
    (21, 87.0),
    (22, 94.0),
    (23, 89.0),
    (24, 95.0),
    (25, 82.5),
    (26, 91.0),
    (27, 87.5),
    (28, 93.0),
    (29, 90.5),
    (30, 86.5),
    (31, 92.0),
    (32, 85.5),
    (33, 90.0),
    (34, 88.5),
    (35, 92.0),
    (36, 87.0),
    (37, 94.0),
    (38, 83.5),
    (39, 91.5),
    (40, 89.5),
    (41, 93.5),
    (42, 88.0),
    (43, 95.0),
    (44, 84.5),
    (45, 90.5),
    (46, 87.0),
    (47, 92.0),
    (48, 86.5),
    (49, 93.0),
    (50, 89.0);


CREATE TABLE Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FeedbackText TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Generating data for Feedback table
INSERT INTO Feedback (StudentID, CourseID, FeedbackText)
VALUES 
    (1, 1, 'The course was well-structured and informative.'),
    (2, 2, 'The lecturer explained complex concepts clearly.'),
    (3, 3, 'I enjoyed the hands-on labs in this course.'),
    (4, 4, 'The course material was challenging but rewarding.'),
    (5, 5, 'I appreciated the practical applications covered in the course.'),
    (6, 6, 'The group projects helped me improve my teamwork skills.'),
    (7, 7, 'The course content was relevant to my field of study.'),
    (8, 8, 'The lecturer provided helpful feedback on assignments.'),
    (9, 9, 'I found the guest lectures insightful.'),
    (10, 10, 'The course encouraged critical thinking and problem-solving.'),
    (11, 11, 'The course introduced me to programming concepts effectively.'),
    (12, 12, 'I gained a deep understanding of data structures and algorithms.'),
    (13, 13, 'Object-oriented programming was taught in a clear and concise manner.'),
    (14, 14, 'The web development projects were engaging and practical.'),
    (15, 15, 'The database management assignments were challenging but valuable.'),
    (16, 16, 'Software engineering principles were well-covered in this course.'),
    (17, 17, 'I learned a lot about computer networks and their applications.'),
    (18, 18, 'Operating systems concepts were explained thoroughly.'),
    (19, 19, 'The artificial intelligence lectures were fascinating.'),
    (20, 20, 'Cybersecurity topics were presented in an engaging way.'),
    (21, 21, 'Python programming language is versatile and easy to learn.'),
    (22, 22, 'Java programming language is widely used and practical.'),
    (23, 23, 'C++ offers strong performance and control.'),
    (24, 24, 'JavaScript is essential for web development.'),
    (25, 25, 'Ruby programming language is elegant and enjoyable.'),
    (26, 26, 'PHP is great for web development.'),
    (27, 27, 'Swift programming language is ideal for iOS app development.'),
    (28, 28, 'Kotlin programming language is modern and concise.'),
    (29, 29, 'R programming language is excellent for data analysis.'),
    (30, 30, 'Go programming language is efficient and easy to use.'),
    (31, 31, 'Scala programming language assignments were interesting.'),
    (32, 32, 'I enjoyed learning Rust programming language.'),
    (33, 33, 'TypeScript made front-end development much more manageable.'),
    (34, 34, 'Haskell was a challenging but rewarding language to learn.'),
    (35, 35, 'Perl programming offered unique insights into scripting.'),
    (36, 36, 'Lua programming was fun and versatile.'),
    (37, 37, 'Dart programming language is great for building mobile apps.'),
    (38, 38, 'Matlab helped me gain insights into data analysis.'),
    (39, 39, 'Clojure provided a fresh perspective on functional programming.'),
    (40, 40, 'Julia programming language is powerful for scientific computing.'),
    (41, 41, 'Python programming language is versatile and easy to learn.'),
    (42, 42, 'Java programming language is widely used and practical.'),
    (43, 43, 'C++ offers strong performance and control.'),
    (44, 44, 'JavaScript is essential for web development.'),
    (45, 45, 'Ruby programming language is elegant and enjoyable.'),
    (46, 46, 'PHP is great for web development.'),
    (47, 47, 'Swift programming language is ideal for iOS app development.'),
    (48, 48, 'Kotlin programming language is modern and concise.'),
    (49, 49, 'R programming language is excellent for data analysis.'),
    (50, 50, 'Go programming language is efficient and easy to use.');





