SELECT * FROM students;

SELECT * FROM class;

-- Creates a view of students first name, last name, class name, and teacher name
DROP view students_class_teacher; -- Drop view used so view can be re-run
CREATE view students_class_teacher AS
SELECT s.first_name, s.last_name, c.class_name, t.last_name as teacher_name
FROM students AS s
INNER JOIN class AS c USING (class_id)
INNER JOIN teachers AS t USING (teacher_id);

SELECT * FROM (students_class_teacher);

-- Creates view of highest, lowest and average amount of points per class 
DROP view highest_lowest_average; -- Drop view used so view can be re-run
CREATE view highest_lowest_average AS
SELECT class.class_name, MAX(points) AS highest, MIN(points) AS lowest, AVG(points) AS average
FROM class
INNER JOIN students USING (class_id)
INNER JOIN points USING (student_id)
GROUP BY class.class_name;

SELECT * FROM points_record;

-- Stored Procedure that calcuates a students point total from the point record table and updates the points table for that student
DELIMITER $$
CREATE PROCEDURE sp_calculatePoints(selected_student_id INT)
BEGIN
	DECLARE total_points INT;
    
    SET total_points = (SELECT SUM(points_gained)
    FROM points_record AS pr
    WHERE pr.student_id = selected_student_id
    GROUP BY selected_student_id);
    
    -- Total points cannot go below 0
    IF total_points < 0 THEN
		SET total_points = 0;
    END IF;
    
    -- Updating the number of points to reflect the total points a student has
    UPDATE points as p
    SET p.points = total_points
    WHERE p.student_id = selected_student_id;

END$$

-- Stored function which sums all the points from the points records table for a student ID and updates the value
CREATE FUNCTION `fn_getSum`(student_id INT) RETURNS INT
READS SQL DATA
BEGIN
      DECLARE total_points INT;
      SELECT  SUM(pr.points_gained)
      INTO    total_points
      FROM    points_record as pr
      WHERE   pr.student_id = student_id
      GROUP BY pr.student_id;
      RETURN total_points;
END $$

-- Stored procedure that calcuates point total from point record table and updates the points table for ALL students and updates the value
CREATE PROCEDURE sp_calculatePointsForAll()
BEGIN

    UPDATE points
    SET points = fn_getSum(student_id)
    WHERE student_id;

END$$
DELIMITER ;

SELECT * FROM points_record;

SELECT student_id, points FROM points;

CALL sp_calculatePoints(11112); -- Calling the stored procedure to update points for a specified student - in this case, student with the id 11112
CALL sp_calculatePointsForAll(); -- Calling the stored procedure to update points for all students

-- Shows first names and last names of teachers and counts the number of times they've given points
-- Left join and query/subquery with 'group by' to filter ONLY positive points gained (i.e., no minus/negative loss of points)
SELECT t.first_name, t.last_name, COUNT(pr.teacher_id) as times_points_given
FROM teachers AS t
LEFT JOIN (
SELECT * 
FROM points_record
WHERE points_record.points_gained >= 0) AS pr
USING (teacher_id)
GROUP BY t.teacher_id;

-- Create a trigger to decrease the quantity of rewards when they are redeemed
DELIMITER $$

CREATE TRIGGER `rewards_AFTER_INSERT`
  AFTER INSERT
  ON `rewards_record`
  FOR EACH ROW
BEGIN
  UPDATE rewards 
  SET quantity = quantity - 1 
  WHERE reward_id = NEW.reward_id;
END;$$

DELIMITER ;

SELECT * FROM rewards
WHERE reward_id = 1;

-- Adding data into the rewards record table to test query
INSERT INTO rewards_record
(student_id, date_granted, reward_id)
VALUES
(11112, DATE("2023-04-23"), 1);

SELECT * FROM rewards_record;

-- Quantity should be decreased by 1 for reward_id 1
SELECT * FROM rewards
WHERE reward_id = 1;
