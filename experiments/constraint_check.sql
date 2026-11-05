-- 1. NULL in a required column
INSERT INTO courses (id, title, description, credits)
VALUES ('x-test', NULL, 'Test', 3);


-- 2. Zero credits (credits must be greater than zero)
INSERT INTO courses (id, title, description, credits)
VALUES ('x-test', 'Test', 'Test', 0);


-- 3. Negative number of likes (likes cannot be negative)
UPDATE courses
SET likes = -1
WHERE id = 'api-design';


-- 4. Student name that is too short
INSERT INTO students (name, email)
VALUES ('A', 'a@example.com');


-- 5. Duplicate student email
INSERT INTO students (name, email)
VALUES ('Dup Student', 'aigerim@example.com');


-- 6. Duplicate course ID
INSERT INTO courses (id, title, description, credits)
VALUES ('api-design', 'Duplicate course', 'Test', 1);


-- 7. Duplicate enrollment for the same student and course
INSERT INTO enrollments (course_id, student_id)
VALUES ('modern-frontend', 1);


-- 8. Enrollment in a course that does not exist
INSERT INTO enrollments (course_id, student_id)
VALUES ('no-such-course', 1);


-- 9. Enrollment for a student that does not exist
INSERT INTO enrollments (course_id, student_id)
VALUES ('web-security', 999);


-- 10. Delete a course that still has enrollments
DELETE FROM courses
WHERE id = 'modern-frontend';