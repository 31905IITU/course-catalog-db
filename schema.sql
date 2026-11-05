-- Course Catalog database schema

-- Remove existing tables in dependency order
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;

-- Courses
CREATE TABLE courses (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    credits INTEGER NOT NULL CHECK (credits > 0),
    is_elective BOOLEAN NOT NULL DEFAULT FALSE,
    likes INTEGER NOT NULL DEFAULT 0 CHECK (likes >= 0)
);

-- Students
CREATE TABLE students (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL CHECK (LENGTH(name) >= 2),
    email TEXT NOT NULL UNIQUE
);

-- Enrollments
CREATE TABLE enrollments (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_id TEXT NOT NULL REFERENCES courses(id) ON DELETE RESTRICT,
    student_id BIGINT NOT NULL REFERENCES students(id) ON DELETE CASCADE,
    enrolled_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (course_id, student_id)
);

-- Index on the foreign key student_id.
-- PostgreSQL does not automatically create indexes on foreign keys.
CREATE INDEX enrollments_student_id_idx
ON enrollments (student_id);