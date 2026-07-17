-- Member Task: Faculty Table

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);

INSERT INTO Faculty (faculty_id, name, email, department) VALUES

(1, 'John Smith', 'john.smith@school.edu', 'Computer Science'),
(2, 'Mary Jones', 'mary.jones@school.edu', 'Information Technology'),
(3, 'Uwase Marie', 'uwase.marie@school.edu', 'Computer Science'),
(4, 'Keza Aline', 'keza.aline@school.edu', 'Software Engineering'),
(5, 'Mugisha Jean', 'mugisha.jean@school.edu', 'Mathematics'),
(6, 'Kagame Eric', 'kagame.eric@school.edu', 'Data Science'),
(7, 'Nshuti Thierry', 'nshuti.thierry@school.edu', 'Information Technology'),
(8, 'Achol Deng', 'achol.deng@school.edu', 'Computer Science'),
(9, 'Mohamed Mustafa', 'mohamed.mustafa@school.edu', 'Software Engineering'),
(10, 'Omer Ali', 'omer.ali@school.edu', 'Mathematics'),
(11, 'Ilunga Mwamba', 'ilunga.mwamba@school.edu', 'Data Science');
