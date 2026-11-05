-- SQL queries for the Course Catalog API

-- 1. GET /courses - first page
SELECT id, title, credits, likes
FROM courses
WHERE is_elective = false
ORDER BY likes DESC, id ASC
LIMIT 3 OFFSET 0;


-- 1b. GET /courses - second page
SELECT id, title, credits, likes
FROM courses
WHERE is_elective = false
ORDER BY likes DESC, id ASC
LIMIT 3 OFFSET 3;


-- 2. GET /courses/{course_id}
SELECT id, title, credits, is_elective, likes
FROM courses
WHERE id = 'api-design';


-- 2b. Test nonexistent course
SELECT id, title, credits, is_elective, likes
FROM courses
WHERE id = 'no-such-course';


-- 3. POST /courses/{course_id}/like
BEGIN;

UPDATE courses
SET likes = likes + 1
WHERE id = 'api-design'
RETURNING id, likes;

-- 3b. Test a nonexistent course
UPDATE courses
SET likes = likes + 1
WHERE id = 'no-such-course'
RETURNING id, likes;

ROLLBACK;


-- 4. POST /enrollments
BEGIN;

INSERT INTO enrollments (course_id, student_id)
VALUES ('web-security', 3)
RETURNING id, course_id, student_id;

ROLLBACK;


-- 5. GET /enrollments
SELECT
    e.id,
    s.name AS student,
    c.title AS course
FROM enrollments e
JOIN students s
    ON e.student_id = s.id
JOIN courses c
    ON e.course_id = c.id
ORDER BY e.id;


-- 6. Enrollment statistics for every course
SELECT
    c.id,
    c.title,
    COUNT(e.id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e
    ON c.id = e.course_id
GROUP BY c.id, c.title
ORDER BY enrollment_count DESC, c.id;