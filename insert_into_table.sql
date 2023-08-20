INSERT INTO teachers
(teacher_id, first_name, last_name)
VALUES
(5001, 'Gabe', 'Sanchez'),
(5002, 'Chloe', 'Stone'),
(5003, 'Leanne', 'Swift'),
(5004, 'Rhianna', 'Smith');

INSERT INTO class
(class_name, teacher_id)
VALUES
('Manor', 5001),
('Warwick', 5002),
('Greyhound', 5003),
('Lenham', 5004);

INSERT INTO students
(student_id, first_name, last_name, gender, class_id)
VALUES
(11112, 'Julie', 'Smith', 'F', 1),
(11113, 'James', 'Andrews', 'M', 1),
(11114, 'Jack', 'Oakes', 'M', 2),
(11115, 'Jasper', 'Wolfe', 'O', 2),
(11116, 'Ruby', 'Jones', 'F', 3),
(11117, 'Yo', 'Lovell', 'M', 3),
(11118, 'Sean', 'Evans', 'F', 4),
(11119, 'Jasmine', 'Claire', 'F', 4),
(11120, 'Harinder', 'Atwal', 'F', 1),
(11121, 'Rachel', 'Smith', 'F', 2),
(11122, 'Helene', 'Evans', 'F', 3),
(11123, 'Sarah', 'Huang', 'F', 4);

INSERT INTO rewards
(reward_name, reward_value, quantity)
VALUES
('pencil', 50, 5),
('pencil case', 50, 3),
('hand bag', 200, 3),
('bike', 1000, 2),
('necklace', 75, 5),
('toy car', 25, 4),
('poppet', 50, 10),
('Disney toy', 500, 5),
('fake plant', 200, 3),
('football', 200, 6);

INSERT INTO points
(student_id, points)
VALUES
(11112, 0),
(11113, 0),
(11114, 0),
(11115, 0),
(11116, 0),
(11117, 0),
(11118, 0),
(11119, 0),
(11120, 0),
(11121, 0),
(11122, 0),
(11123, 0);

TRUNCATE points_record;
INSERT INTO points_record
(student_id, date_granted, points_gained, reason, teacher_id)
VALUES
(11112, DATE("2023-04-23"), 24, "submitted homework", 5001),
(11113, DATE("2023-04-23"), 201, "helped a friend", 5001),
(11114, DATE("2023-04-23"), 40, "put books away", 5001),
(11122, DATE("2023-04-23"), -5, "unkind comment", 5002),
(11115, DATE("2023-04-23"), 35, "cleaned the whiteboard", 5003),
(11116, DATE("2023-04-23"), 22, "submitted homework", 5003),
(11117, DATE("2023-04-23"), 58, "handed out textbooks", 5003),
(11118, DATE("2023-04-23"), 135, "gave a good answer in class", 5003),
(11119, DATE("2023-04-23"), 263, "gave a good answer in class", 5003),
(11120, DATE("2023-04-23"), 25, "submitted homework", 5004),
(11121, DATE("2023-04-23"), 48, "helped a friend", 5004),
(11122, DATE("2023-04-23"), 36, "submitted homework", 5004),
(11122, DATE("2023-04-23"), -5, "unkind comment", 5004),
(11123, DATE("2023-04-23"), 362, "handed out textbooks", 5004);
