
import sqlite3

conn = sqlite3.connect("placement.db")
cur = conn.cursor()

cur.executescript("""
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS students (
    student_id INTEGER PRIMARY KEY,
    roll_no TEXT UNIQUE NOT NULL,
    department TEXT NOT NULL,
    graduation_year INTEGER,
    eligible_for_placement INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS skills (
    skill_id INTEGER PRIMARY KEY,
    skill_name TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS student_skills (
    student_id INTEGER,
    skill_id INTEGER,
    PRIMARY KEY (student_id, skill_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);

CREATE TABLE IF NOT EXISTS placements (
    placement_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    company TEXT NOT NULL,
    role TEXT NOT NULL,
    package_lpa REAL NOT NULL,
    placement_date TEXT,
    status TEXT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT OR IGNORE INTO students VALUES
(1,'FIC001','CSE',2027,1),
(2,'FIC002','CSE',2027,1),
(3,'FIC003','CSE',2027,1),
(4,'FIC004','AI&ML',2027,1),
(5,'FIC005','AI&ML',2027,1),
(6,'FIC006','AI&ML',2027,1),
(7,'FIC007','ECE',2027,1),
(8,'FIC008','ECE',2027,1),
(9,'FIC009','ECE',2027,0),
(10,'FIC010','IT',2027,1),
(11,'FIC011','IT',2027,1),
(12,'FIC012','IT',2027,1);

INSERT OR IGNORE INTO skills VALUES
(1,'Python'),(2,'Java'),(3,'SQL'),
(4,'Communication'),(5,'Machine Learning'),
(6,'HTML/CSS'),(7,'Data Analysis');

INSERT OR IGNORE INTO student_skills VALUES
(1,1),(1,3),(1,4),(2,2),(2,3),(2,4),(3,1),(3,5),(3,7),
(4,1),(4,5),(4,7),(5,2),(5,3),(5,4),(6,1),(6,3),(6,5),
(7,2),(7,3),(7,4),(8,1),(8,6),(8,4),(9,2),(9,3),
(10,1),(10,3),(10,7),(11,2),(11,3),(11,4),(12,1),(12,5),(12,7);

INSERT OR IGNORE INTO placements VALUES
(1,1,'TechNova','Python Developer',6.50,'2026-08-10','Accepted'),
(2,1,'CodeCraft','Software Engineer',7.20,'2026-08-15','Offered'),
(3,2,'TechNova','Java Developer',5.80,'2026-08-12','Accepted'),
(4,3,'DataNest','Data Analyst',8.00,'2026-08-20','Accepted'),
(5,4,'AIWorks','ML Engineer',9.50,'2026-08-11','Accepted'),
(6,5,'CodeCraft','Software Engineer',6.00,'2026-08-18','Offered'),
(7,6,'AIWorks','Python Developer',7.50,'2026-08-22','Accepted'),
(8,7,'TechNova','Systems Engineer',4.80,'2026-08-14','Accepted'),
(9,8,'WebOrbit','Web Developer',5.20,'2026-08-21','Rejected'),
(10,10,'DataNest','Data Analyst',6.80,'2026-08-16','Accepted'),
(11,11,'CodeCraft','Java Developer',5.60,'2026-08-19','Accepted'),
(12,12,'AIWorks','ML Engineer',8.80,'2026-08-24','Accepted');
""")

conn.commit()

for table in ("students", "skills", "student_skills", "placements"):
    cur.execute(f"SELECT COUNT(*) FROM {table}")
    print(f"{table}: {cur.fetchone()[0]} records")

conn.close()
print("Database created successfully!")
