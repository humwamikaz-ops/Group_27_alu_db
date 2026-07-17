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
