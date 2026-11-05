-- Initial Course Catalog data

INSERT INTO courses (id, title, description, credits, is_elective, likes)
VALUES
('modern-frontend', 'Modern Frontend: React & Next.js', 'Frontend development', 5, FALSE, 24),
('backend-fastapi', 'Backend Foundations: FastAPI', 'Backend development', 5, FALSE, 19),
('databases-postgresql', 'Relational Databases: PostgreSQL', 'Database fundamentals', 5, FALSE, 15),
('api-design', 'API Design: REST vs GraphQL', 'API design principles', 4, TRUE, 11),
('web-security', 'Web Security Essentials', 'Web application security', 4, FALSE, 21),
('ai-integration', 'AI/LLM Integration', 'AI integration fundamentals', 5, TRUE, 32);

INSERT INTO students (name, email)
VALUES
('Aigerim Sadykova', 'aigerim@example.com'),
('Daniyar Bekov', 'daniyar@example.com'),
('Asel Omarova', 'asel@example.com');

INSERT INTO enrollments (course_id, student_id)
VALUES
('modern-frontend', 1),
('ai-integration', 1),
('modern-frontend', 2),
('backend-fastapi', 2),
('ai-integration', 2),
('ai-integration', 3);
