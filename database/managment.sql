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
CREATE TABLE Programmes (
  ProgrammeID INT AUTO_INCREMENT PRIMARY KEY,
  ProgrammeName VARCHAR(255) NOT NULL
);

CREATE TABLE Students (
  StudentID INT AUTO_INCREMENT PRIMARY KEY,
  StudentName VARCHAR(255) NOT NULL,
  ProgrammeID INT NOT NULL,
  FOREIGN KEY (ProgrammeID) REFERENCES Programmes(ProgrammeID)
);

CREATE TABLE Courses (
  CourseID INT AUTO_INCREMENT PRIMARY KEY,
  CourseName VARCHAR(255) NOT NULL,
  ProgrammeID INT NOT NULL,
  LecturerID INT NOT NULL,
  Room VARCHAR(50) NOT NULL,
  FOREIGN KEY (ProgrammeID) REFERENCES Programmes(ProgrammeID),
  FOREIGN KEY (LecturerID) REFERENCES Lecturer(Lecturer_id)  -- Corrected reference to LECTURER table
);

CREATE TABLE Enrollments (
  EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
  StudentID INT,
  CourseID INT,
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Grades (
  GradeID INT AUTO_INCREMENT PRIMARY KEY,
  EnrollmentID INT,
  StudentID INT,
  Grade DECIMAL(4, 2),
  FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID),
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE LecturerFeedback (
  LecturerFeedbackID INT AUTO_INCREMENT PRIMARY KEY,
  LecturerID INT,
  CourseID INT,
  StudentID INT,
  LecturerFeedbackText TEXT
  
);

CREATE TABLE StudentFeedback (
  StudentFeedbackID INT AUTO_INCREMENT PRIMARY KEY,
  StudentID INT,
  CourseID INT,
  FeedbackText TEXT
  
);


CREATE TABLE Officereports (
    OfficereportID INT AUTO_INCREMENT PRIMARY KEY,
    OfficeID INT,
    StudentID INT,
    CourseID INT,
    StudentFeedbackText TEXT,
    Room VARCHAR(50)
);
 
CREATE TABLE Lecturerreports (
    LecturerreportsID INT AUTO_INCREMENT PRIMARY KEY,
    LecturerID INT,
    CourseID INT,
    StudentID INT,
    StudentName VARCHAR(255),
    EnrollmentID INT,
    Grade DECIMAL(4, 2),
    LecturerFeedbackText TEXT,
    Room VARCHAR(50)
);






INSERT INTO ADMINS (username, password,role)
Values
('Admin','Java','Admin');

INSERT INTO LECTURER (username, password, role)
VALUES 
('JohnSmith', 'password1', 'Lecturer'),
('SarahJohnson', 'password2', 'Lecturer'),
('MichaelWilliams', 'password3', 'Lecturer'),
('EmilyJones', 'password4', 'Lecturer'),
('DanielBrown', 'password5', 'Lecturer'),
('JessicaDavis', 'password6', 'Lecturer'),
('MatthewMiller', 'password7', 'Lecturer'),
('AshleyWilson', 'password8', 'Lecturer'),
('ChristopherMoore', 'password9', 'Lecturer'),
('AmandaTaylor', 'password10', 'Lecturer'),
('DavidAnderson', 'password11', 'Lecturer'),
('SamanthaThomas', 'password12', 'Lecturer'),
('JamesJackson', 'password13', 'Lecturer'),
('ElizabethWhite', 'password14', 'Lecturer'),
('JoshuaHarris', 'password15', 'Lecturer'),
('LaurenMartin', 'password16', 'Lecturer'),
('AndrewThompson', 'password17', 'Lecturer'),
('RachelGarcia', 'password18', 'Lecturer'),
('NicholasMartinez', 'password19', 'Lecturer'),
('MeganRobinson', 'password20', 'Lecturer'),
('RyanClark', 'password21', 'Lecturer'),
('KimberlyLewis', 'password22', 'Lecturer'),
('BrandonLee', 'password23', 'Lecturer'),
('StephanieHall', 'password24', 'Lecturer'),
('JustinYoung', 'password25', 'Lecturer'),
('BrittanyAllen', 'password26', 'Lecturer'),
('KevinKing', 'password27', 'Lecturer'),
('TaylorScott', 'password28', 'Lecturer'),
('BenjaminGreen', 'password29', 'Lecturer'),
('HaleyCarter', 'password30', 'Lecturer'),
('AlexanderHill', 'password31', 'Lecturer'),
('OliviaAdams', 'password32', 'Lecturer'),
('JonathanTurner', 'password33', 'Lecturer'),
('KaylaWright', 'password34', 'Lecturer'),
('ZacharyPhillips', 'password35', 'Lecturer'),
('VictoriaTorres', 'password36', 'Lecturer'),
('PatrickNguyen', 'password37', 'Lecturer'),
('NataliePerez', 'password38', 'Lecturer'),
('JacobReyes', 'password39', 'Lecturer'),
('NicoleEvans', 'password40', 'Lecturer'),
('SamuelStewart', 'password41', 'Lecturer'),
('DanielleMurphy', 'password42', 'Lecturer'),
('TylerRivera', 'password43', 'Lecturer'),
('EricaCook', 'password44', 'Lecturer'),
('WilliamBailey', 'password45', 'Lecturer'),
('ShannonReed', 'password46', 'Lecturer'),
('BrianWard', 'password47', 'Lecturer'),
('MorganBell', 'password48', 'Lecturer'),
('TimothySanchez', 'password49', 'Lecturer'),
('LisaPrice', 'password50', 'Lecturer');

INSERT INTO OFFICE (username, password, role)
VALUES
('AliceJohnson', 'password1', 'Office'),
('PeterSmith', 'password2', 'Office'),
('RachelWong', 'password3', 'Office'),
('MichaelBrown', 'password4', 'Office'),
('JenniferDavis', 'password5', 'Office'),
('AlexMiller', 'password6', 'Office'),
('EmilyWilson', 'password7', 'Office'),
('ChristopherLee', 'password8', 'Office'),
('SarahGarcia', 'password9', 'Office'),
('DavidTaylor', 'password10', 'Office'),
('JessicaMartinez', 'password11', 'Office'),
('DanielThompson', 'password12', 'Office'),
('LaurenHernandez', 'password13', 'Office'),
('MatthewClark', 'password14', 'Office'),
('AshleyLopez', 'password15', 'Office'),
('AndrewHill', 'password16', 'Office'),
('AmandaYoung', 'password17', 'Office'),
('JamesPerez', 'password18', 'Office'),
('OliviaLewis', 'password19', 'Office'),
('JoshuaNguyen', 'password20', 'Office'),
('SamanthaKing', 'password21', 'Office'),
('RyanScott', 'password22', 'Office'),
('ElizabethGreen', 'password23', 'Office'),
('NicholasHall', 'password24', 'Office'),
('TaylorAdams', 'password25', 'Office'),
('BenjaminThomas', 'password26', 'Office'),
('MeganWhite', 'password27', 'Office'),
('KevinRodriguez', 'password28', 'Office'),
('KimberlyMartinez', 'password29', 'Office'),
('BrandonLopez', 'password30', 'Office'),
('StephanieCook', 'password31', 'Office'),
('JonathanRivera', 'password32', 'Office'),
('KaylaMitchell', 'password33', 'Office'),
('ZacharyCarter', 'password34', 'Office'),
('VictoriaRoberts', 'password35', 'Office'),
('PatrickRamirez', 'password36', 'Office'),
('NatalieRussell', 'password37', 'Office'),
('JacobHughes', 'password38', 'Office'),
('NicoleSanders', 'password39', 'Office'),
('SamuelMorales', 'password40', 'Office');


-- Inserting 50 Programmes
INSERT INTO Programmes (ProgrammeName) VALUES
('Computer Science'),
('Mechanical Engineering'),
('Electrical Engineering'),
('Civil Engineering'),
('Chemical Engineering'),
('Physics'),
('Mathematics'),
('Biology'),
('Chemistry'),
('Psychology'),
('Economics'),
('Business Administration'),
('English Literature'),
('History'),
('Sociology'),
('Political Science'),
('Art History'),
('Music'),
('Film Studies'),
('Environmental Science'),
('Geology'),
('Philosophy'),
('Anthropology'),
('Architecture'),
('Nursing'),
('Medicine'),
('Dentistry'),
('Veterinary Science'),
('Law'),
('Education'),
('Linguistics'),
('Communication'),
('Information Technology'),
('Graphic Design'),
('Fashion Design'),
('Culinary Arts'),
('Hospitality Management'),
('Agriculture'),
('Forestry'),
('Urban Planning'),
('Public Health'),
('International Relations'),
('Finance'),
('Marketing'),
('Human Resources'),
('Nutrition'),
('Physics'),
('Statistics');


INSERT INTO Courses (CourseName, ProgrammeID, LecturerID, Room) VALUES
('Introduction to Programming', 1, 1, 'Room 101'),
('Data Structures and Algorithms', 1, 2, 'Room 102'),
('Database Management Systems', 1, 3, 'Room 103'),
('Computer Networks', 1, 4, 'Room 104'),
('Software Engineering', 1, 5, 'Room 105'),
('Introduction to Mechanical Engineering', 2, 6, 'Room 201'),
('Thermodynamics', 2, 7, 'Room 202'),
('Fluid Mechanics', 2, 8, 'Room 203'),
('Introduction to Electrical Engineering', 3, 9, 'Room 204'),
('Circuit Theory', 3, 10, 'Room 205'),
('Digital Electronics', 3, 11, 'Room 206'),
('Power Systems', 3, 12, 'Room 207'),
('Control Systems', 3, 13, 'Room 208'),
('Introduction to Civil Engineering', 4, 14, 'Room 209'),
('Structural Analysis', 4, 15, 'Room 210'),
('Geotechnical Engineering', 4, 16, 'Room 211'),
('Transportation Engineering', 4, 17, 'Room 212'),
('Environmental Engineering', 4, 18, 'Room 213'),
('Introduction to Chemical Engineering', 5, 19, 'Room 214'),
('Chemical Reaction Engineering', 5, 20, 'Room 215'),
('Process Control', 5, 21, 'Room 216'),
('Heat Transfer', 5, 22, 'Room 217'),
('Mass Transfer', 5, 23, 'Room 218'),
('Introduction to Physics', 6, 24, 'Room 219'),
('Classical Mechanics', 6, 25, 'Room 220'),
('Quantum Mechanics', 6, 26, 'Room 221'),
('Thermal Physics', 6, 27, 'Room 222'),
('Electromagnetism', 6, 28, 'Room 223'),
('Introduction to Mathematics', 7, 29, 'Room 224'),
('Calculus', 7, 30, 'Room 225'),
('Linear Algebra', 7, 31, 'Room 226'),
('Probability Theory', 7, 32, 'Room 227'),
('Discrete Mathematics', 7, 33, 'Room 228'),
('Introduction to Biology', 8, 34, 'Room 229'),
('Cell Biology', 8, 35, 'Room 230'),
('Genetics', 8, 36, 'Room 231'),
('Ecology', 8, 37, 'Room 232'),
('Evolutionary Biology', 8, 38, 'Room 233'),
('Introduction to Chemistry', 9, 39, 'Room 234'),
('Organic Chemistry', 9, 40, 'Room 235'),
('Inorganic Chemistry', 9, 41, 'Room 236'),
('Physical Chemistry', 9, 42, 'Room 237'),
('Analytical Chemistry', 9, 43, 'Room 238'),
('Introduction to Psychology', 10, 44, 'Room 239'),
('Developmental Psychology', 10, 45, 'Room 240');


-- Inserting 50 Students
INSERT INTO Students (StudentName, ProgrammeID) VALUES
('Alice Smith', 1),
('Bob Johnson', 1),
('Charlie Brown', 2),
('Diana Wilson', 2),
('Emma Davis', 3),
('Frank Martinez', 3),
('Grace Taylor', 4),
('Henry Anderson', 4),
('Isabella Thomas', 5),
('Jack Garcia', 5),
('Katherine Martinez', 6),
('Liam Robinson', 6),
('Mia Clark', 7),
('Noah Lee', 7),
('Olivia Hernandez', 8),
('Patrick Lewis', 8),
('Quinn Walker', 9),
('Ryan Hall', 9),
('Sophia Perez', 10),
('Thomas Moore', 10),
('Uma King', 11),
('Victor Green', 11),
('Willow Adams', 12),
('Xavier Mitchell', 12),
('Yara Hill', 13),
('Zachary Turner', 13),
('Abigail Carter', 14),
('Benjamin Baker', 14),
('Charlotte White', 15),
('Daniel Young', 15),
('Ella Rodriguez', 16),
('Finn Foster', 16),
('Gabriella Sanchez', 17),
('Henry Nguyen', 17),
('Isaac Rivera', 18),
('Jasmine Cox', 18),
('Kai Stewart', 19),
('Lily Brooks', 19),
('Matthew Ramirez', 20),
('Natalie Reed', 20),
('Oliver Scott', 21),
('Penelope Ward', 21),
('Quincy Martinez', 22),
('Riley Brown', 22),
('Sophie Evans', 23),
('Theodore Perez', 23),
('Uma Roberts', 24),
('Vincent Baker', 24),
('Willa Torres', 25),
('Xavier Wright', 25);

INSERT INTO Grades (EnrollmentID, Grade)
SELECT EnrollmentID, ROUND(RAND() * 100, 2) AS Grade
FROM Enrollments
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    GROUP BY StudentID
    HAVING COUNT(*) > 1
);


-- Inserting enrollments for students, limiting each student to a maximum of three courses
INSERT INTO Enrollments (StudentID, CourseID)
SELECT S.StudentID, C.CourseID
FROM Students S
CROSS JOIN Courses C
WHERE (
    SELECT COUNT(*)
    FROM Enrollments E
    WHERE E.StudentID = S.StudentID
) < 3;

-- Inserting grades for students who are enrolled in multiple courses, ensuring each grade corresponds to a valid enrollment
INSERT INTO Grades (EnrollmentID, Grade)
SELECT E.EnrollmentID, ROUND(RAND() * 100, 2) AS Grade
FROM (
    SELECT E.*, ROW_NUMBER() OVER (PARTITION BY E.StudentID ORDER BY E.EnrollmentID) AS EnrollRank
    FROM Enrollments E
) AS E
INNER JOIN (
    SELECT StudentID
    FROM Enrollments
    GROUP BY StudentID
    HAVING COUNT(*) > 1
) AS MultipleEnrollments ON E.StudentID = MultipleEnrollments.StudentID
WHERE E.EnrollRank <= 3;
       
       
-- Generate feedback entries for each student, course, and lecturer combination
INSERT INTO LecturerFeedback (LecturerID, CourseID, StudentID, LecturerFeedbackText)
VALUES 
    (1, 1, 1, 'Great lecturer, very helpful'),
    (2, 2, 2, 'Enjoyed the course content'),
    (3, 3, 3, 'Well-organized lectures and materials'),
    (4, 4, 4, 'The instructor was knowledgeable and engaging'),
    (5, 5, 5, 'The course material was presented clearly'),
    (6, 6, 6, 'Excellent support from the teaching staff'),
    (7, 7, 7, 'Interactive classes made learning enjoyable'),
    (8, 8, 8, 'The course exceeded my expectations'),
    (9, 9, 9, 'The lecturer was responsive to questions'),
    (10, 10, 10, 'Practical examples helped understanding'),
    (11, 11, 11, 'The course structure was well-designed'),
    (12, 12, 12, 'Interesting assignments challenged me'),
    (13, 13, 13, 'The course covered relevant topics'),
    (14, 14, 14, 'The lecturer provided valuable insights'),
    (15, 15, 15, 'I would recommend this course to others'),
    (16, 16, 16, 'Engaging discussions in class'),
    (17, 17, 17, 'The course materials were comprehensive'),
    (18, 18, 18, 'Clear explanations made concepts easy to grasp'),
    (19, 19, 19, 'The course was well-paced'),
    (20, 20, 20, 'The instructor was approachable and supportive'),
    (21, 21, 21, 'Enjoyed collaborating with classmates'),
    (22, 22, 22, 'Interactive learning activities were helpful'),
    (23, 23, 23, 'The course provided valuable practical skills'),
    (24, 24, 24, 'The instructor provided timely feedback'),
    (25, 25, 25, 'The course improved my understanding of the subject'),
    (26, 26, 26, 'The course materials were well-organized'),
    (27, 27, 27, 'The instructor was enthusiastic and passionate'),
    (28, 28, 28, 'The course challenged me to think critically'),
    (29, 29, 29, 'The instructor created a supportive learning environment'),
    (30, 30, 30, 'The course content was relevant to real-world applications'),
    (31, 31, 31, 'Enjoyed the hands-on learning experiences'),
    (32, 32, 32, 'The course provided valuable industry insights'),
    (33, 33, 33, 'The instructor was knowledgeable and approachable'),
    (34, 34, 34, 'The course helped me develop new skills'),
    (35, 35, 35, 'The instructor encouraged participation and discussion'),
    (36, 36, 36, 'The course assignments were engaging and challenging'),
    (37, 37, 37, 'The course content was up-to-date and relevant'),
    (38, 38, 38, 'The instructor provided helpful resources'),
    (39, 39, 39, 'The course improved my problem-solving abilities'),
    (40, 40, 40, 'The instructor was effective at explaining complex concepts'),
    (41, 41, 41, 'The course was well-structured and organized'),
    (42, 42, 42, 'The instructor was responsive to student needs'),
    (43, 43, 43, 'The course provided opportunities for practical application'),
    (44, 44, 44, 'The instructor was supportive and encouraging'),
    (45, 45, 45, 'The course content was engaging and informative'),
    (46, 46, 46, 'The instructor provided clear instructions'),
    (47, 47, 47, 'The course enhanced my understanding of the subject matter'),
    (48, 48, 48, 'The instructor provided helpful feedback on assignments'),
    (49, 49, 49, 'The course challenged me to think creatively'),
    (50, 50, 50, 'The instructor fostered a collaborative learning environment');


INSERT INTO StudentFeedback (StudentID, CourseID, FeedbackText)
VALUES
    (1, 1, 'Great lecturer, very helpful'),
    (2, 2, 'Enjoyed the course content'),
    (3, 3, 'Well-organized lectures and materials'),
    (4, 4, 'The instructor was knowledgeable and engaging'),
    (5, 5, 'The course material was presented clearly'),
    (6, 6, 'Excellent support from the teaching staff'),
    (7, 7, 'Interactive classes made learning enjoyable'),
    (8, 8, 'The course exceeded my expectations'),
    (9, 9, 'The lecturer was responsive to questions'),
    (10, 10, 'Practical examples helped understanding'),
    (11, 11, 'The course structure was well-designed'),
    (12, 12, 'Interesting assignments challenged me'),
    (13, 13, 'The course covered relevant topics'),
    (14, 14, 'The lecturer provided valuable insights'),
    (15, 15, 'I would recommend this course to others'),
    (16, 16, 'Engaging discussions in class'),
    (17, 17, 'The course materials were comprehensive'),
    (18, 18, 'Clear explanations made concepts easy to grasp'),
    (19, 19, 'The course was well-paced'),
    (20, 20, 'The instructor was approachable and supportive'),
    (21, 21, 'Enjoyed collaborating with classmates'),
    (22, 22, 'Interactive learning activities were helpful'),
    (23, 23, 'The course provided valuable practical skills'),
    (24, 24, 'The instructor provided timely feedback'),
    (25, 25, 'The course improved my understanding of the subject'),
    (26, 26, 'The course materials were well-organized'),
    (27, 27, 'The instructor was enthusiastic and passionate'),
    (28, 28, 'The course challenged me to think critically'),
    (29, 29, 'The instructor created a supportive learning environment'),
    (30, 30, 'The course content was relevant to real-world applications'),
    (31, 31, 'Enjoyed the hands-on learning experiences'),
    (32, 32, 'The course provided valuable industry insights'),
    (33, 33, 'The instructor was knowledgeable and approachable'),
    (34, 34, 'The course helped me develop new skills'),
    (35, 35, 'The instructor encouraged participation and discussion'),
    (36, 36, 'The course assignments were engaging and challenging'),
    (37, 37, 'The course content was up-to-date and relevant'),
    (38, 38, 'The instructor provided helpful resources'),
    (39, 39, 'The course improved my problem-solving abilities'),
    (40, 40, 'The instructor was effective at explaining complex concepts'),
    (41, 41, 'The course was well-structured and organized'),
    (42, 42, 'The instructor was responsive to student needs'),
    (43, 43, 'The course provided opportunities for practical application'),
    (44, 44, 'The instructor was supportive and encouraging'),
    (45, 45, 'The course content was engaging and informative'),
    (46, 46, 'The instructor provided clear instructions'),
    (47, 47, 'The course enhanced my understanding of the subject matter'),
    (48, 48, 'The instructor provided helpful feedback on assignments'),
    (49, 49, 'The course challenged me to think creatively'),
    (50, 50, 'The instructor fostered a collaborative learning environment');


INSERT INTO Officereports (OfficeID, StudentID, CourseID, StudentFeedbackText, Room)
SELECT 
    L.Lecturer_id AS OfficeID,
    S.StudentID,
    E.CourseID,
    SF.FeedbackText AS StudentFeedbackText,
    C.Room
FROM 
    Students S
    JOIN Enrollments E ON S.StudentID = E.StudentID
    JOIN StudentFeedback SF ON S.StudentID = SF.StudentID AND E.CourseID = SF.CourseID
    JOIN Courses C ON E.CourseID = C.CourseID
    JOIN Lecturer L ON C.LecturerID = L.Lecturer_id;
    
INSERT INTO Lecturerreports (LecturerID, CourseID, StudentID, EnrollmentID, Grade, LecturerFeedbackText, Room)
SELECT 
    L.Lecturer_id AS LecturerID,
    C.CourseID,
    S.StudentID,
    E.EnrollmentID,
    G.Grade,
    LF.LecturerFeedbackText,
    C.Room
FROM 
    Enrollments E
    JOIN Courses C ON E.CourseID = C.CourseID
    JOIN Lecturer L ON C.LecturerID = L.Lecturer_id
    JOIN Students S ON E.StudentID = S.StudentID
    JOIN Grades G ON E.EnrollmentID = G.EnrollmentID
    JOIN LecturerFeedback LF ON C.CourseID = LF.CourseID;