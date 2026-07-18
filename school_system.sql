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
