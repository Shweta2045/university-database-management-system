
CREATE DATABASE university;
USE university;

-- ========== TABLES ==========
-- 1) Faculty (PK: FacultyID)
CREATE TABLE Faculty (
  FacultyID   INT PRIMARY KEY,
  FacultyName VARCHAR(100) NOT NULL,
  Dept        VARCHAR(50)  NOT NULL,
  Email       VARCHAR(120) UNIQUE,
  HireDate    DATE         NOT NULL,
  Salary      DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

-- 2) Courses (PK: CourseID, FK -> Faculty)
CREATE TABLE Courses (
  CourseID    INT PRIMARY KEY,
  CourseName  VARCHAR(100) NOT NULL,
  Dept        VARCHAR(50)  NOT NULL,
  Credits     TINYINT      NOT NULL CHECK (Credits BETWEEN 1 AND 6),
  FacultyID   INT NOT NULL,
  CONSTRAINT fk_courses_faculty
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 3) Students (PK: StudentID, FK -> Faculty (Advisor))
CREATE TABLE Students (
  StudentID   INT PRIMARY KEY,
  StudentName VARCHAR(100) NOT NULL,
  Gender      ENUM('M','F','O') NOT NULL,
  Dept        VARCHAR(50)  NOT NULL,
  Year        TINYINT      NOT NULL CHECK (Year BETWEEN 1 AND 4),
  GPA         DECIMAL(3,2) NOT NULL CHECK (GPA BETWEEN 0.00 AND 10.00),
  AdvisorID   INT NOT NULL,
  CONSTRAINT fk_students_advisor
    FOREIGN KEY (AdvisorID) REFERENCES Faculty(FacultyID)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ========== DATA SEED ==========
-- Faculty
INSERT INTO Faculty (FacultyID, FacultyName, Dept, Email, HireDate, Salary) VALUES
(1, 'Dr. Asha Nair',        'CS',      'asha.nair@uni.edu',      '2014-07-01', 145000.00),
(2, 'Dr. Vivek Menon',      'CS',      'vivek.menon@uni.edu',    '2017-01-15', 132000.00),
(3, 'Dr. Priya Kulkarni',   'ECE',     'priya.k@uni.edu',        '2016-03-10', 128500.00),
(4, 'Dr. Rohan Deshpande',  'ECE',     'rohan.d@uni.edu',        '2019-08-21', 115000.00),
(5, 'Dr. Meera Iyer',       'Math',    'meera.iyer@uni.edu',     '2012-06-12', 150000.00),
(6, 'Dr. Karan Shah',       'Physics', 'karan.shah@uni.edu',     '2018-09-03', 121000.00),
(7, 'Dr. Neha Bhat',        'ME',      'neha.bhat@uni.edu',      '2015-11-30', 126000.00),
(8, 'Dr. Salim Ahmed',      'Business','salim.ahmed@uni.edu',    '2013-02-01', 139500.00),
(9, 'Dr. Kavita Joshi',     'CS',      'kavita.j@uni.edu',       '2021-07-19', 108000.00),
(10,'Dr. Anil Patil',       'Math',    'anil.patil@uni.edu',     '2020-01-10', 112000.00);

-- Courses (each tied to an instructor via FacultyID)
INSERT INTO Courses (CourseID, CourseName, Dept, Credits, FacultyID) VALUES
(101, 'Data Structures',               'CS',      4, 1),
(102, 'Database Systems',              'CS',      4, 2),
(103, 'Algorithms',                    'CS',      4, 9),
(104, 'Signals & Systems',             'ECE',     3, 3),
(105, 'Digital Communication',         'ECE',     3, 4),
(106, 'Linear Algebra',                'Math',    4, 5),
(107, 'Probability & Statistics',      'Math',    4, 10),
(108, 'Classical Mechanics',           'Physics', 4, 6),
(109, 'Thermodynamics',                'ME',      3, 7),
(110, 'Financial Accounting',          'Business',3, 8),
(111, 'Machine Learning',              'CS',      4, 2),
(112, 'Discrete Mathematics',          'Math',    3, 5);

-- Students (each tied to an advisor via AdvisorID)
INSERT INTO Students (StudentID, StudentName, Gender, Dept, Year, GPA, AdvisorID) VALUES
(201, 'Ankit Verma',        'M', 'CS',      2, 8.20, 1),
(202, 'Sneha Gupta',        'F', 'CS',      3, 9.10, 2),
(203, 'Rohit Nair',         'M', 'ECE',     1, 7.50, 3),
(204, 'Ishita Desai',       'F', 'ECE',     4, 8.80, 4),
(205, 'Mohit Sharma',       'M', 'Math',    2, 7.90, 5),
(206, 'Pooja Patil',        'F', 'Math',    1, 8.70, 10),
(207, 'Kunal Mehta',        'M', 'Physics', 3, 8.00, 6),
(208, 'Riya Iyer',          'F', 'CS',      4, 9.50, 9),
(209, 'Aarav Kulkarni',     'M', 'ME',      2, 7.30, 7),
(210, 'Neha Singh',         'F', 'Business',1, 8.40, 8),
(211, 'Vikram Rao',         'M', 'CS',      1, 6.90, 1),
(212, 'Khushi Jain',        'F', 'Math',    3, 9.00, 5),
(213, 'Sarthak Joshi',      'M', 'Physics', 2, 7.80, 6),
(214, 'Mira Banerjee',      'F', 'ECE',     2, 8.10, 4),
(215, 'Devansh Kapoor',     'M', 'CS',      3, 7.60, 2),
(216, 'Prerna Salunkhe',    'F', 'Business',4, 8.95, 8);

-- Helpful indexes (optional but good practice)
CREATE INDEX idx_courses_faculty ON Courses(FacultyID);
CREATE INDEX idx_students_advisor ON Students(AdvisorID);
CREATE INDEX idx_students_dept ON Students(Dept);


-- A) Simple SELECT / WHERE / ORDER BY
-- 1.List all students.
SELECT * FROM Students;

-- 2.List CS students (WHERE).
SELECT StudentID, StudentName, Dept, Year, GPA
FROM Students
WHERE Dept = 'CS';

-- 3.Students with GPA ≥ 8.5 (comparison).
SELECT StudentName, Dept, GPA
FROM Students
WHERE GPA >= 8.5
ORDER BY GPA DESC;

-- 4.Faculty hired after 2016 (date filter).
SELECT FacultyName, Dept, HireDate
FROM Faculty
WHERE HireDate > '2016-12-31'
ORDER BY HireDate;

-- 5.Courses with 4 credits (exact match).
SELECT CourseID, CourseName, Dept, Credits
FROM Courses
WHERE Credits = 4
ORDER BY Dept, CourseName;

              -- B) BETWEEN / IN / AND / OR-- 

-- 6.Students with GPA between 8.0 and 9.5.
SELECT StudentName, Dept, GPA
FROM Students
WHERE GPA BETWEEN 8.0 AND 9.5
ORDER BY GPA DESC;

-- 7.Faculty in CS or Math (IN).
SELECT FacultyName, Dept
FROM Faculty
WHERE Dept IN ('CS','Math')
ORDER BY Dept, FacultyName;

-- 8.ECE students in Year 2 or 4 (AND + IN).
SELECT StudentName, Dept, Year
FROM Students
WHERE Dept = 'ECE' AND Year IN (2,4);

-- 9.Students from CS or ECE with GPA > 8.0 (OR + AND).
SELECT StudentName, Dept, GPA
FROM Students
WHERE (Dept = 'CS' OR Dept = 'ECE')
  AND GPA > 8.0;
  
-- 10.Faculty with salary NOT between 115k and 140k.
SELECT FacultyName, Dept, Salary
FROM Faculty
WHERE Salary NOT BETWEEN 115000 AND 140000
ORDER BY Salary DESC;

                      -- C) LIKE (pattern matching)-- 

-- 11.Students whose name starts with 'A' or ends with 'a'.
SELECT StudentName
FROM Students
WHERE StudentName LIKE 'A%' OR StudentName LIKE '%a';


-- 12.Courses containing 'Data' or 'Math' in name.
SELECT CourseName, Dept
FROM Courses
WHERE CourseName LIKE '%Data%' OR CourseName LIKE '%Math%';

          -- D) JOINS (based on foreign keys) -- 

13.List each course with its instructor.
SELECT c.CourseID, c.CourseName, c.Dept AS CourseDept,
       f.FacultyName AS Instructor, f.Dept AS FacultyDept
FROM Courses c
JOIN Faculty f ON c.FacultyID = f.FacultyID
ORDER BY c.CourseID;

-- 14.List each student with their advisor’s name and department.
SELECT s.StudentID, s.StudentName, s.Dept AS StudentDept,
       f.FacultyName AS AdvisorName, f.Dept AS AdvisorDept
FROM Students s
JOIN Faculty f ON s.AdvisorID = f.FacultyID
ORDER BY s.StudentID;

-- 15.Courses taught by Math faculty only.
SELECT c.CourseID, c.CourseName, c.Dept, f.FacultyName
FROM Courses c
JOIN Faculty f ON c.FacultyID = f.FacultyID
WHERE f.Dept = 'Math';

-- 16.Students advised by CS faculty (cross-dept advising).
SELECT s.StudentName, s.Dept AS StudentDept, f.FacultyName AS Advisor, f.Dept AS AdvisorDept
FROM Students s
JOIN Faculty f ON s.AdvisorID = f.FacultyID
WHERE f.Dept = 'CS';


           -- E) GROUP BY / Aggregation / HAVING-- 

-- 17.Count of students per department.
SELECT Dept, COUNT(*) AS NumStudents
FROM Students
GROUP BY Dept
ORDER BY NumStudents DESC;

-- 18.Average GPA per department (rounded).
SELECT Dept, ROUND(AVG(GPA), 2) AS AvgGPA
FROM Students
GROUP BY Dept
ORDER BY AvgGPA DESC;

-- 19.Departments with more than 2 students (HAVING).
SELECT Dept, COUNT(*) AS NumStudents
FROM Students
GROUP BY Dept
HAVING COUNT(*) > 2;

-- 20.Average salary by faculty department where avg > 125k (HAVING).
SELECT Dept, ROUND(AVG(Salary), 2) AS AvgSalary
FROM Faculty
GROUP BY Dept
HAVING AVG(Salary) > 125000
ORDER BY AvgSalary DESC;

-- 21.Number of courses per instructor (GROUP BY on join).
SELECT f.FacultyName, f.Dept, COUNT(*) AS CourseCount
FROM Faculty f
JOIN Courses c ON c.FacultyID = f.FacultyID
GROUP BY f.FacultyID, f.FacultyName, f.Dept
ORDER BY CourseCount DESC, f.FacultyName;

                       -- F) Subqueries (scalar / IN / EXISTS)-- 
-- 22.Students with GPA above overall average GPA (scalar subquery).
SELECT StudentName, Dept, GPA
FROM Students
WHERE GPA > (SELECT AVG(GPA) FROM Students)
ORDER BY GPA DESC;

-- 23.Courses taught by faculty earning above department’s average salary (correlated subquery).
SELECT c.CourseID, c.CourseName, f.FacultyName, f.Dept, f.Salary
FROM Courses c
JOIN Faculty f ON c.FacultyID = f.FacultyID
WHERE f.Salary > (
  SELECT AVG(Salary) FROM Faculty WHERE Dept = f.Dept
)
ORDER BY f.Dept, f.Salary DESC;

-- 24.Students whose advisor is in CS (IN with subquery).
SELECT StudentName, Dept, AdvisorID
FROM Students
WHERE AdvisorID IN (SELECT FacultyID FROM Faculty WHERE Dept = 'CS');

-- 25.List departments that have both students and at least one course (EXISTS with subqueries).
SELECT DISTINCT s.Dept
FROM Students s
WHERE EXISTS (SELECT 1 FROM Courses c WHERE c.Dept = s.Dept);




