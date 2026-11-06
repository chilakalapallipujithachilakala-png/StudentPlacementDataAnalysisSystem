# Student Placement Data Analysis System
**Beginner-friendly B.Tech project | Python + MySQL + Pandas + NumPy + Matplotlib**

## 1. Project objective
Analyze student placement outcomes, department-wise placement rates, package distributions, and skill demand using fictional sample data.

## 2. Technology used
- Python 3.10+
- MySQL 8+
- `mysql-connector-python`
- Pandas, NumPy, Matplotlib

## 3. Important definitions and rules
1. **Eligible student:** `eligible_for_placement = 1` and the student's `graduation_year` matches the reporting cohort.
2. **Placed student:** an eligible student with at least one placement row whose status is `Accepted`.
3. **Placement rate:** `distinct eligible students with an Accepted offer / total eligible students * 100`.
4. **Multiple offers:** students can have more than one offer, but are counted only once in the placement-rate numerator. The offer table still stores each distinct offer.
5. **Duplicate offer row:** same student, company, role, and placement date. The database has a unique constraint for this combination; the Python analysis also removes repeated identical rows if imported from a CSV.
6. **Package units:** all package values are annual CTC in **LPA (lakhs per annum)**. Do not mix INR, thousands, or monthly salaries.
7. **Privacy:** reports are aggregate-only. They do not print student names, roll numbers, or individual records.
8. **Package statistics:** package summary uses accepted offers; a student with multiple accepted offers may appear more than once in offer-level package statistics. Placement rate always counts distinct students.

## 4. Folder contents
- `schema.sql` — creates database tables and constraints.
- `seed.sql` — inserts fictional sample data.
- `main.py` — connects to MySQL and generates aggregate reports and charts.
- `requirements.txt` — Python packages.
- `data/sample_students.csv` — fictional student data.
- `data/sample_skills.csv` — fictional student-skill mapping.
- `data/sample_placements.csv` — fictional offers.
- `reports/` — charts and CSV reports are generated here when the program runs.

## 5. Setup
### Step A — Install Python packages
Open a terminal in this project folder and run:
```bash
pip install -r requirements.txt
```

### Step B — Create the database
1. Open MySQL Workbench.
2. Open and run `schema.sql`.
3. Open and run `seed.sql`.

Alternatively, run the SQL files from the MySQL command line.

### Step C — Configure your MySQL login
Set environment variables before running the program.

**Windows Command Prompt:**
```bat
set DB_HOST=localhost
set DB_USER=root
set DB_PASSWORD=your_mysql_password
set DB_NAME=student_placement
python main.py
```

**PowerShell:**
```powershell
$env:DB_HOST="localhost"
$env:DB_USER="root"
$env:DB_PASSWORD="your_mysql_password"
$env:DB_NAME="student_placement"
python main.py
```

Replace `your_mysql_password` with your actual local MySQL password. Do not put passwords into code or share them.

### Step D — Run
```bash
python main.py
```
The program prints aggregate summaries and saves reports/charts under `reports/`.

## 6. Expected outputs
- `reports/department_placement_report.csv`
- `reports/package_summary.csv`
- `reports/skill_demand_report.csv`
- `reports/placement_rate_by_department.png`
- `reports/accepted_package_distribution.png`
- `reports/top_skills.png`

## 7. Troubleshooting
- `Access denied`: check the MySQL username/password and that the MySQL service is running.
- `Unknown database`: run `schema.sql` first.
- `ModuleNotFoundError`: run `pip install -r requirements.txt`.
- If you change sample records, keep package units in LPA and use statuses `Offered`, `Accepted`, or `Rejected`.
