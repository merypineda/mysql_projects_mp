USE merypineda_mysql_project;

-- Students name

SELECT *
FROM students;

INSERT INTO students(students_name)
VALUES ("Manny");

INSERT INTO students(students_name)
VALUES ("Stephanie");

INSERT INTO students(students_name)
VALUES ("Joseph");

INSERT INTO students(students_name)
VALUES ("Melissa");

INSERT INTO students(students_name)
VALUES ("Britney");

INSERT INTO students(students_name)
VALUES ("James");

INSERT INTO students(students_name)
VALUES ("Nick");

INSERT INTO students(students_name)
VALUES ("Steve");

INSERT INTO students(students_name)
VALUES ("Stephen");

INSERT INTO students(students_name)
VALUES ("Michael");

-- professors

SELECT *
FROM professors;

INSERT INTO professors(professors_id, professors_name)
VALUES (1, "Mr. Peterson");

INSERT INTO professors(professors_id, professors_name)
VALUES (2, "Mr. Rubinsky");

INSERT INTO professors(professors_id, professors_name)
VALUES (3, "Mrs. Polina");

INSERT INTO professors(professors_id, professors_name)
VALUES (4, "Mrs. Suchy");


-- COURSES
SELECT *
FROM courses;

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("Science", 1, 1); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("Science", 1, 3); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("Math", 2, 2); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("Math", 2, 3); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("Math", 2, 4); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("Math", 2, 7);

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("English", 3, 2); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("English", 3, 5); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("English", 3, 6); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("French", 4, 7); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("French", 4, 8);

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("French", 4, 1); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("French", 4, 9); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("French", 4, 10); 

INSERT INTO courses(courses_name, courses_professors_id, courses_students_id)
VALUES ("French", 4, 4); 

-- grades

SELECT * 
FROM grades;

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (2, 7, 1, 70); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (1, 3, 2, 80); 

 INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (2, 2, 3, 60); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (2, 3, 4, 75); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (2, 4, 5, 70); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (3, 2, 6, 75); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (3, 5, 7, 55); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (3, 6, 8, 60); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (4, 7, 9, 90); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (4, 8, 10, 95); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (4, 9, 11, 80); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (4, 10, 12, 85); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (4, 4, 10, 100); 

INSERT INTO grades(grades_professors_id, grades_students_id, grades_courses_id, grades_earned)
VALUES (4, 1, 10, 95); 

-- The average grade that is given by each professor

SELECT professors_id, professors_name, AVG(grades_earned)
FROM grades
INNER JOIN professors
ON grades_professors_id = professors_id
GROUP BY grades_professors_id;

-- The top grades for each student

SELECT students_id, students_name, max(grades_earned)
FROM grades
INNER JOIN students
ON grades_students_id = students_id 
GROUP BY grades_students_id;

-- Group students by the courses that they are enrolled in

SELECT * 
FROM students s   
JOIN courses c
ON  s.students_id = c.courses_students_id  
WHERE c.courses_name = "French";

SELECT * 
FROM students s   
JOIN courses c
ON  s.students_id = c.courses_students_id  
WHERE c.courses_name = "English";

SELECT * 
FROM students s   
JOIN courses c
ON  s.students_id = c.courses_students_id  
WHERE c.courses_name = "Math";

SELECT * 
FROM students s   
JOIN courses c
ON  s.students_id = c.courses_students_id  
WHERE c.courses_name = "Science";


-- Create a summary report of courses and their average grades, sorted by the most challenging course 
-- (course with the lowest average grade) to the easiest course

select *
from courses;

SELECT courses_name as "courses", AVG(grades_earned) as "Average", MAX(grades_earned) as "MAX" , Min(grades_earned) "Min"
FROM grades g
INNER JOIN  courses c
WHERE c.courses_id = g.grades_courses_id
GROUP BY grades_courses_id;

-- Finding which student and professor have the most courses in common
select *
from students;

SELECT students_name as "Students", professors_name as "Professors", Count(*) as "Common_classes"
FROM grades g
JOIN students
ON g.grades_courses_id = students_id
JOIN courses c
ON g.grades_courses_id = courses_id
JOIN professors
ON c.courses_professors_id = professors_id
GROUP BY professors_name, students_name
ORDER BY count(*) DESC
LIMIT 10;







