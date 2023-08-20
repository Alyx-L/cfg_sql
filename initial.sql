DROP DATABASE project;

CREATE DATABASE project;

USE project;

CREATE TABLE teachers (
teacher_id INT PRIMARY KEY,
First_name VARCHAR(25) NOT NULL,
surname VARCHAR(25) NOT NULL,
class_id INT
-- FOREIGN KEY (class_id) REFERENCES class(class_id)
);

INSERT INTO teachers
(teacher_id, first_name, surname)
VALUES
(5001, 'Gabe', 'Sanchez'),
(5002, 'Chloe', 'Taylor'),
(5003, 'Leanne', 'Haywood'),
(5004, 'Rhianna', 'Smith');

CREATE TABLE class (
class_id INT NOT NULL AUTO_INCREMENT,
class_name VARCHAR(25),
teacher_id INT,
PRIMARY KEY (class_id),
FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

INSERT INTO class
(class_name, teacher_id)
VALUES
('Manor', 5001),
('Warwick', 5002),
('Greyhound', 5003),
('Lenham', 5004);

CREATE TABLE students (
student_id INT PRIMARY KEY,
first_name VARCHAR(25) NOT NULL,
surname VARCHAR(25) NOT NULL,
gender ENUM ('M', 'F', 'O'),
class_id INT,
FOREIGN KEY (class_id) REFERENCES class(class_id)
);

INSERT INTO students
(student_id, first_name, surname, gender, class_id)
VALUES
(11112, 'Julie', 'Smith', 'F'),
(11113, 'James', 'Andrews', 'M'),
(11114, 'Jack', 'Oakes', 'M'),
(11115, 'Jasper', 'Wolfe', 'O'),
(11116, 'Ruby', 'Jones', 'F'),
(11117, 'Yohann', 'Lovell', 'M'),
(11118, 'Shaan', 'Jassal', 'F'),
(11119, 'Wendy', 'Claire', 'F'),
(11120, 'Preet', 'Atwal', 'F'),
(11121, 'Rachel', 'Farmer', 'F'),
(11122, 'Helene', 'Evans', 'F'),
(11123, 'Debbie', 'Huang', 'F');


