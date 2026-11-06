USE student_placement;

INSERT INTO students (student_id, roll_no, department, graduation_year, eligible_for_placement) VALUES
(1, 'FIC001', 'CSE', 2027, TRUE),
(2, 'FIC002', 'CSE', 2027, TRUE),
(3, 'FIC003', 'CSE', 2027, TRUE),
(4, 'FIC004', 'AI&ML', 2027, TRUE),
(5, 'FIC005', 'AI&ML', 2027, TRUE),
(6, 'FIC006', 'AI&ML', 2027, TRUE),
(7, 'FIC007', 'ECE', 2027, TRUE),
(8, 'FIC008', 'ECE', 2027, TRUE),
(9, 'FIC009', 'ECE', 2027, FALSE),
(10, 'FIC010', 'IT', 2027, TRUE),
(11, 'FIC011', 'IT', 2027, TRUE),
(12, 'FIC012', 'IT', 2027, TRUE);

INSERT INTO skills (skill_id, skill_name) VALUES
(1, 'Python'), (2, 'Java'), (3, 'SQL'), (4, 'Communication'),
(5, 'Machine Learning'), (6, 'HTML/CSS'), (7, 'Data Analysis');

INSERT INTO student_skills (student_id, skill_id) VALUES
(1,1),(1,3),(1,4),(2,2),(2,3),(2,4),(3,1),(3,5),(3,7),
(4,1),(4,5),(4,7),(5,2),(5,3),(5,4),(6,1),(6,3),(6,5),
(7,2),(7,3),(7,4),(8,1),(8,6),(8,4),(9,2),(9,3),
(10,1),(10,3),(10,7),(11,2),(11,3),(11,4),(12,1),(12,5),(12,7);

INSERT INTO placements (placement_id, student_id, company, role, package_lpa, placement_date, status) VALUES
(1, 1, 'TechNova', 'Python Developer', 6.50, '2026-08-10', 'Accepted'),
(2, 1, 'CodeCraft', 'Software Engineer', 7.20, '2026-08-15', 'Offered'),
(3, 2, 'TechNova', 'Java Developer', 5.80, '2026-08-12', 'Accepted'),
(4, 3, 'DataNest', 'Data Analyst', 8.00, '2026-08-20', 'Accepted'),
(5, 4, 'AIWorks', 'ML Engineer', 9.50, '2026-08-11', 'Accepted'),
(6, 5, 'CodeCraft', 'Software Engineer', 6.00, '2026-08-18', 'Offered'),
(7, 6, 'AIWorks', 'Python Developer', 7.50, '2026-08-22', 'Accepted'),
(8, 7, 'TechNova', 'Systems Engineer', 4.80, '2026-08-14', 'Accepted'),
(9, 8, 'WebOrbit', 'Web Developer', 5.20, '2026-08-21', 'Rejected'),
(10, 10, 'DataNest', 'Data Analyst', 6.80, '2026-08-16', 'Accepted'),
(11, 11, 'CodeCraft', 'Java Developer', 5.60, '2026-08-19', 'Accepted'),
(12, 12, 'AIWorks', 'ML Engineer', 8.80, '2026-08-24', 'Accepted');
