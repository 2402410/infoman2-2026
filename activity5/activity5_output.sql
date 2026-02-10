-- Part 1
SELECT COUNT(*) FROM students;

-- Part 2
 EXPLAIN ANALYZE SELECT * FROM students WHERE middle_name = 'quasi';

-- Part3 
CREATE INDEX idx_students_middle_name
ON students(middle_name);

-- Part 4
INSERT INTO students (first_name, middle_name, last_name, school_id, course, adress) 
VALUES ('Daryl', 'Buccat', 'Montipalco', 2402410, 'IT', 'La Union');