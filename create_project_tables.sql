DROP DATABASE project; -- Drops database so whole file can be re-run

CREATE DATABASE project;

USE project;

CREATE TABLE teachers (
teacher_id INT PRIMARY KEY,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
class_id INT
);

CREATE TABLE class (
class_id INT AUTO_INCREMENT PRIMARY KEY,
class_name VARCHAR(25),
teacher_id INT,
FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE students (
student_id INT PRIMARY KEY,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
gender ENUM ('M', 'F', 'O'), 
class_id INT,
FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE rewards (
reward_id INT AUTO_INCREMENT PRIMARY KEY,
reward_name VARCHAR(25) NOT NULL,
reward_value INT NOT NULL,
quantity INT
);

CREATE TABLE points (
student_id INT PRIMARY KEY,
FOREIGN KEY (student_id) REFERENCES students(student_id),
points INT UNSIGNED
);

CREATE TABLE points_record (
ID INT AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,
date_granted DATE,
points_gained INT SIGNED,
reason VARCHAR(50),
teacher_id INT, 
FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE rewards_record (
ID INT AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,
date_granted DATE,
reward_id INT,
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (reward_id) REFERENCES rewards(reward_id)
);
