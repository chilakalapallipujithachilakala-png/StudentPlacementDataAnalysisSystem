CREATE DATABASE IF NOT EXISTS student_placement;
USE student_placement;

CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    roll_no VARCHAR(20) NOT NULL UNIQUE,
    department VARCHAR(80) NOT NULL,
    graduation_year INT NOT NULL,
    eligible_for_placement BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS skills (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS student_skills (
    student_id INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (student_id, skill_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);

CREATE TABLE IF NOT EXISTS placements (
    placement_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    company VARCHAR(120) NOT NULL,
    role VARCHAR(120) NOT NULL,
    package_lpa DECIMAL(7,2) NOT NULL,
    placement_date DATE NOT NULL,
    status ENUM('Offered', 'Accepted', 'Rejected') NOT NULL,
    CONSTRAINT chk_package_nonnegative CHECK (package_lpa >= 0),
    CONSTRAINT uq_duplicate_offer UNIQUE (student_id, company, role, placement_date),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
