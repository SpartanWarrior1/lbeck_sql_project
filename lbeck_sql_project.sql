USE lbeck_sql_project;

INSERT INTO courses(courses_name, courses_professors_id)
VALUES("Course 1", 1);

INSERT INTO courses(courses_name, courses_professors_id)
VALUES("Course 2", 2);

INSERT INTO courses(courses_name, courses_professors_id)
VALUES("Course 3", 3);

INSERT INTO courses(courses_name, courses_professors_id)
VALUES("Course 4", 4);

INSERT INTO courses(courses_name, courses_professors_id)
VALUES("Course 5", 1);

INSERT INTO students(students_name)
VALUES("Student 1");

INSERT INTO students(students_name)
VALUES("Student 2");

INSERT INTO students(students_name)
VALUES("Student 3");

INSERT INTO students(students_name)
VALUES("Student 4");

INSERT INTO professors(professors_name, professors_course_id)
VALUES("Professor 1", 1);

INSERT INTO professors(professors_name, professors_course_id)
VALUES("Professor 2", 2);

INSERT INTO professors(professors_name, professors_course_id)
VALUES("Professor 3", 3);

INSERT INTO professors(professors_name, professors_course_id)
VALUES("Professor 4", 4);


INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(86, 1, 1, 1);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(83, 1, 2, 2);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(90, 1, 5, 1);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(100, 1, 4, 4); 


INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(65, 2, 5, 1);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(50, 2, 2, 2);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(82, 2, 3, 3);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(54, 2, 4, 4);


INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(89, 3, 1, 1);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(94, 3, 2, 2);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(100, 3, 3, 3);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(93, 3, 4, 4);


INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(89, 4, 1, 1);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(72, 4, 2, 2);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(78, 4, 3, 3);

INSERT INTO grades(grades_percent, grades_students_id, grades_course_id, grades_professors_id)
VALUES(75, 4, 4, 4);

SELECT *
FROM courses;

SELECT *
FROM students;

SELECT *
FROM professors;

SELECT *
FROM grades;

-- Average grade given by each professor
SELECT grades_professors_id AS 'Professor', AVG(grades_percent) AS 'Average Grade'
FROM grades
GROUP BY grades_professors_id;

-- Top grades by each student
SELECT grades_students_id AS 'Student', MAX(grades_percent) AS 'Highest Grade'
FROM grades
GROUP BY grades_students_id;

-- Group student by course they are enrolled in
SELECT grades_students_id AS 'Student', grades_course_id AS 'Course'
FROM grades;

-- Average grade for each course from hardest to easiest course
SELECT AVG(grades_percent) AS 'Average Grade', grades_course_id AS 'Course'
FROM grades
GROUP BY grades_course_id
ORDER BY AVG(grades_percent) ASC;

-- Find which student and professor have the most courses in common
SELECT grades_students_id AS 'Student', grades_professors_id AS 'Professors', COUNT(grades_course_id) AS 'Course'
FROM grades
GROUP BY grades_students_id, grades_professors_id;