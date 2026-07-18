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
