-- ===== Member A (Adhieu): Students Table =====

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

-- UPDATE (Member A)
UPDATE Students SET email = 'adhieu.new@alu.edu' WHERE student_id = 1;

-- DELETE (Member A)
DELETE FROM Students WHERE student_id = 5;

-- SELECT (Member A)
SELECT * FROM Students WHERE classroom_id = 1;
