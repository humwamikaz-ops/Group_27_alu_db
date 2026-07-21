CREATE DATABASE IF NOT EXISTS alu_db;
USE alu_db;

CREATE TABLE IF NOT EXISTS Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Extra_Curricular_Activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    activity_name VARCHAR(100) NOT NULL,
    budget DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    classroom_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL DEFAULT 3,
    faculty_id INT,
    classroom_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id) ON DELETE SET NULL,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Student_Courses (
    student_id INT,
    course_id INT,
    enrollment_semester VARCHAR(20) DEFAULT 'Fall 2026',
    grade VARCHAR(2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Student_Activities (
    student_id INT,
    activity_id INT,
    join_date DATE,
    PRIMARY KEY (student_id, activity_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id) ON DELETE CASCADE
);

INSERT INTO Classroom (room_number, building, capacity) VALUES
('Room 101', 'Innovation Hall', 30),
('Room 102', 'Innovation Hall', 25),
('Room 201', 'Science Center', 40),
('Room 202', 'Science Center', 20),
('Room 301', 'Engineering Block', 50);

INSERT INTO Faculty (first_name, last_name, email, department) VALUES 
('Alice', 'Smith', 'asmith@alu.edu', 'Computer Science'),
('Bob', 'Jones', 'bjones@alu.edu', 'Data Science');

INSERT INTO Extra_Curricular_Activities (activity_name, budget) VALUES 
('Tech Club', 500.00),
('Debate Team', 300.00);

INSERT INTO Students (name, email, classroom_id, enrollment_date) VALUES
('Alice Smith', 'alice.smith@alu.edu', 1, '2026-01-15'),
('Bob Johnson', 'bob.johnson@alu.edu', 2, '2026-01-16'),
('Charlie Brown', 'charlie.brown@alu.edu', 1, '2026-01-15'),
('Diana Prince', 'diana.prince@alu.edu', 3, '2026-02-01'),
('Evan Wright', 'evan.wright@alu.edu', 4, '2026-02-10');

INSERT INTO Courses (course_code, course_name, credits, faculty_id, classroom_id) VALUES 
('CS101', 'Introduction to Computer Science', 4, 1, 1),
('DB302', 'Relational Database Design', 3, 2, 2);

INSERT INTO Student_Courses (student_id, course_id, grade) VALUES 
(1, 1, 'A'),
(2, 2, 'B');

INSERT INTO Student_Activities (student_id, activity_id, join_date) VALUES 
(1, 1, '2026-02-01'),
(2, 2, '2026-02-15');

UPDATE Students SET email = 'alice.new@alu.edu' WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 5;

UPDATE Classroom SET capacity = 35 WHERE classroom_id = 2;
DELETE FROM Classroom WHERE classroom_id = 5;

SELECT * FROM Students WHERE enrollment_date >= '2026-01-16';
SELECT * FROM Classroom WHERE building = 'Innovation Hall';

SELECT * FROM Faculty WHERE department = 'Computer Science';
UPDATE Faculty SET department = 'Software Engineering' WHERE faculty_id = 1;
DELETE FROM Faculty WHERE faculty_id = 2;

SELECT * FROM Extra_Curricular_Activities WHERE budget > 400.00;
UPDATE Extra_Curricular_Activities SET budget = 600.00 WHERE activity_id = 1;
DELETE FROM Extra_Curricular_Activities WHERE activity_id = 2;

SELECT * FROM Courses WHERE credits >= 3;
UPDATE Courses SET credits = 4 WHERE course_id = 1;
DELETE FROM Courses WHERE course_id = 2;

SELECT 
    s.name AS student_name, 
    c.course_code, 
    c.course_name, 
    sc.grade
FROM Students s
JOIN Student_Courses sc ON s.student_id = sc.student_id
JOIN Courses c ON sc.course_id = c.course_id;

SELECT 
    s.name AS student_name, 
    a.activity_name, 
    sa.join_date
FROM Students s
JOIN Student_Activities sa ON s.student_id = sa.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id;

SELECT 
    c.course_name, 
    COUNT(sc.student_id) AS total_enrolled
FROM Courses c
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY c.course_id, c.course_name;

SELECT AVG(capacity) AS average_capacity FROM Classroom;
