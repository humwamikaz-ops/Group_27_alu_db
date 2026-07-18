-- Create and initialize the database environment
CREATE DATABASE IF NOT EXISTS alu_db;
USE alu_db;

-- Clear out any existing tables in reverse dependency order to prevent errors
DROP TABLE IF EXISTS Student_Activities;
DROP TABLE IF EXISTS Student_Courses;
DROP TABLE IF EXISTS Extra_Curricular_Activities;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Faculty;
DROP TABLE IF EXISTS Classroom;


-- ==========================================
-- 1. MEMBER B: CLASSROOM TABLE (No dependencies)
-- ==========================================
CREATE TABLE Classroom (
    classroom_id INT PRIMARY KEY,
    room_number VARCHAR(50),
    building VARCHAR(50),
    capacity INT
);

INSERT INTO Classroom (classroom_id, room_number, building, capacity) VALUES
(1, 'Room 101', 'Innovation Hall', 30),
(2, 'Room 102', 'Innovation Hall', 25),
(3, 'Room 201', 'Science Center', 40),
(4, 'Room 202', 'Science Center', 20),
(5, 'Room 301', 'Engineering Block', 50);

-- Individual Operations (Member B)
UPDATE Classroom SET capacity = 35 WHERE classroom_id = 2;
DELETE FROM Classroom WHERE classroom_id = 5;
SELECT * FROM Classroom WHERE building = 'Innovation Hall';


-- ==========================================
-- 2. MEMBER C (Nix): FACULTY TABLE (No dependencies)
-- ==========================================
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);

INSERT INTO Faculty (faculty_id, name, email, department) VALUES
(1, 'John Smith', 'john.smith@alu.edu', 'Computer Science'),
(2, 'Mary Jones', 'mary.jones@alu.edu', 'Information Technology'),
(3, 'Uwase Marie', 'uwase.marie@alu.edu', 'Computer Science'),
(4, 'Mugisha Jean', 'mugisha.jean@alu.edu', 'Mathematics'),
(5, 'Kagame Eric', 'kagame.eric@alu.edu', 'Data Science');

-- Individual Operations (Member C)
UPDATE Faculty SET department = 'Software Engineering' WHERE faculty_id = 5;
DELETE FROM Faculty WHERE faculty_id = 4;
SELECT * FROM Faculty WHERE department = 'Computer Science';


-- ==========================================
-- 3. MEMBER A: STUDENTS TABLE (Depends on Classroom)
-- ==========================================
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    classroom_id INT,
    enrollment_date DATE,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

INSERT INTO Students (student_id, name, email, classroom_id, enrollment_date) VALUES
(1, 'Adhieu Aliak', 'adhieu@alu.edu', 1, '2026-01-15'),
(2, 'Grace Nyakim', 'grace@alu.edu', 2, '2026-01-15'),
(3, 'Peter Otieno', 'peter@alu.edu', 1, '2026-01-16'),
(4, 'Sarah Uwase', 'sarah@alu.edu', 3, '2026-01-16'),
(5, 'James Mugisha', 'james@alu.edu', 2, '2026-01-17');

-- Individual Operations (Member A)
UPDATE Students SET email = 'adhieu.new@alu.edu' WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 5;
SELECT * FROM Students WHERE classroom_id = 1;


-- ==========================================
-- 4. MEMBER D: COURSES TABLE (Depends on Faculty & Classroom)
-- ==========================================
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    faculty_id INT,
    classroom_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

INSERT INTO Courses (course_id, course_name, credits, faculty_id, classroom_id) VALUES
(101, 'Introduction to SQL', '4', 1, 1),
(102, 'Data Structures', '4', 3, 2),
(103, 'Web Development', '3', 2, 3),
(104, 'Discrete Mathematics', '4', 5, 1),
(105, 'Network Security', '3', 2, 2);

-- Individual Operations (Member D)
UPDATE Courses SET credits = 5 WHERE course_id = 101;
DELETE FROM Courses WHERE course_id = 105;
SELECT * FROM Courses WHERE credits = 4;


-- ==========================================
-- 5. MEMBER E: EXTRA CURRICULAR ACTIVITIES (Depends on Faculty)
-- ==========================================
CREATE TABLE Extra_Curricular_Activities (
    activity_id INT PRIMARY KEY,
    activity_name VARCHAR(100),
    category VARCHAR(50),
    faculty_advisor_id INT,
    FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);

INSERT INTO Extra_Curricular_Activities (activity_id, activity_name, category, faculty_advisor_id) VALUES
(1, 'Tech Innovation Club', 'Academic', 1),
(2, 'ALU Sports Society', 'Sports', 3),
(3, 'Debate Team', 'Arts', 2),
(4, 'Coding BootCamp Crew', 'Academic', 5),
(5, 'Music & Arts Club', 'Arts', 1);

-- Individual Operations (Member E)
UPDATE Extra_Curricular_Activities SET category = 'Engineering' WHERE activity_id = 1;
DELETE FROM Extra_Curricular_Activities WHERE activity_id = 5;
SELECT * FROM Extra_Curricular_Activities WHERE category = 'Academic';


-- ==========================================
-- JUNCTION TABLES (Owned by Member E for Many-to-Many Layout)
-- ==========================================
CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Student_Courses (student_id, course_id) VALUES
(1, 101), (1, 102), (2, 102), (3, 101), (4, 103);

CREATE TABLE Student_Activities (
    student_id INT,
    activity_id INT,
    PRIMARY KEY (student_id, activity_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);

INSERT INTO Student_Activities (student_id, activity_id) VALUES
(1, 1), (2, 2), (3, 1), (4, 3), (1, 4);


-- =========================================================================
-- GROUP TASKS: ADVANCED JOINS & AGGREGATE QUERIES
-- =========================================================================

-- Student enrollment breakdown (Student, Course, Faculty, Classroom)
SELECT s.name AS 'Student Name', c.course_name AS 'Course Title', f.name AS 'Instructor', cl.room_number AS 'Room'
FROM Students s
JOIN Student_Courses sc ON s.student_id = sc.student_id
JOIN Courses c ON sc.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;

-- Extra-curricular participation tracking (Student, Activity, Advisor)
SELECT s.name AS 'Student Name', eca.activity_name AS 'Activity', f.name AS 'Faculty Advisor'
FROM Students s
JOIN Student_Activities sa ON s.student_id = sa.student_id
JOIN Extra_Curricular_Activities eca ON sa.activity_id = eca.activity_id
JOIN Faculty f ON eca.faculty_advisor_id = f.faculty_id;

-- Department course tracking mapped to physical campus locations
SELECT f.department AS 'Academic Department', c.course_name AS 'Class Offered', cl.building AS 'Campus Building'
FROM Courses c
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;

-- Count the number of active students registered in each course
SELECT c.course_name AS 'Course Name', COUNT(sc.student_id) AS 'Total Enrolled Students'
FROM Courses c
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY c.course_id, c.course_name;
