CREATE TABLE IF NOT EXISTS Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL DEFAULT 3,
    faculty_id INT,
    classroom_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id) ON DELETE SET NULL
);

INSERT INTO Faculty (first_name, last_name, email, department) VALUES 
('Alice', 'Smith', 'asmith@alu.edu', 'Computer Science'),
('Bob', 'Jones', 'bjones@alu.edu', 'Data Science');

INSERT INTO Courses (course_code, course_name, credits, faculty_id, classroom_id) VALUES 
('CS101', 'Introduction to Computer Science', 4, 1, 1),
('DB302', 'Relational Database Design', 3, 2, 2);
CREATE DATABASE IF NOT EXISTS alu_db;
USE alu_db;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    classroom_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id) ON DELETE SET NULL
);

INSERT INTO Students (name, email, classroom_id, enrollment_date) VALUES
('Alice Smith', 'alice.smith@alu.edu', 1, '2026-01-15'),
('Bob Johnson', 'bob.johnson@alu.edu', 2, '2026-01-16'),
('Charlie Brown', 'charlie.brown@alu.edu', 1, '2026-01-15'),
('Diana Prince', 'diana.prince@alu.edu', 3, '2026-02-01'),
('Evan Wright', 'evan.wright@alu.edu', 4, '2026-02-10');

UPDATE Students SET email = 'alice.new@alu.edu' WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 5;
SELECT * FROM Students WHERE enrollment_date >= '2026-01-16';
DROP TABLE IF EXISTS Classroom;

CREATE TABLE Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);

INSERT INTO Classroom (room_number, building, capacity) VALUES
('Room 101', 'Innovation Hall', 30),
('Room 102', 'Innovation Hall', 25),
('Room 201', 'Science Center', 40),
('Room 202', 'Science Center', 20),
('Room 301', 'Engineering Block', 50);

UPDATE Classroom
SET capacity = 35
WHERE classroom_id = 2;

DELETE FROM Classroom
WHERE classroom_id = 5;

-- Fixed: Changed building_name to building to match the schema above
SELECT * FROM Classroom
WHERE building = 'Innovation Hall';
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

INSERT INTO Courses (course_code, course_name, credits, faculty_id, classroom_id) VALUES 
('CS101', 'Introduction to Computer Science', 4, 1, 1),
('DB302', 'Relational Database Design', 3, 2, 2);`
