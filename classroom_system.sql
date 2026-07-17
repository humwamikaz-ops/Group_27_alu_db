CREATE TABLE Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    building_name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);

INSERT INTO Classroom (room_number, building_name, capacity) VALUES
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

SELECT * FROM Classroom
WHERE building_name = 'Innovation Hall'; 
