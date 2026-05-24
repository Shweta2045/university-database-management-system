# 🎓 University Database Management System (SQL Project)

![SQL](https://img.shields.io/badge/SQL-MySQL-blue?style=for-the-badge&logo=mysql)
![Database](https://img.shields.io/badge/Database-Management-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen?style=for-the-badge)

---

# 📌 Project Overview

The **University Database Management System** is a structured SQL project developed using **MySQL**.  
This project demonstrates how to design and manage a university database using:

- Tables
- Primary Keys
- Foreign Keys
- Constraints
- Joins
- Aggregate Functions
- Subqueries
- Indexing

The project simulates real-world university operations such as:

- Managing students
- Managing faculty
- Managing courses
- Advisor relationships
- Department-wise analysis

---

# 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| MySQL | Database Management |
| SQL | Query Language |
| MySQL Workbench | Database GUI Tool |
| GitHub | Version Control |

---

# 📂 Database Structure

## 📘 Tables Used

### 1️⃣ Faculty Table
Stores faculty details.

| Column Name | Description |
|-------------|-------------|
| FacultyID | Unique Faculty ID |
| FacultyName | Faculty Name |
| Dept | Department |
| Email | Faculty Email |
| HireDate | Joining Date |
| Salary | Faculty Salary |

---

### 2️⃣ Courses Table
Stores course information.

| Column Name | Description |
|-------------|-------------|
| CourseID | Unique Course ID |
| CourseName | Course Name |
| Dept | Department |
| Credits | Credit Score |
| FacultyID | Instructor ID |

---

### 3️⃣ Students Table
Stores student details.

| Column Name | Description |
|-------------|-------------|
| StudentID | Unique Student ID |
| StudentName | Student Name |
| Gender | Gender |
| Dept | Department |
| Year | Academic Year |
| GPA | Student GPA |
| AdvisorID | Faculty Advisor ID |

---

# 🔗 Entity Relationship

- One Faculty can teach many Courses
- One Faculty can advise many Students
- Students belong to Departments
- Courses belong to Departments

---

# ✨ SQL Concepts Covered

✅ CREATE DATABASE  
✅ CREATE TABLE  
✅ PRIMARY KEY  
✅ FOREIGN KEY  
✅ CHECK Constraints  
✅ INSERT INTO  
✅ SELECT Queries  
✅ WHERE Clause  
✅ ORDER BY  
✅ BETWEEN  
✅ IN Operator  
✅ LIKE Operator  
✅ JOINS  
✅ GROUP BY  
✅ HAVING Clause  
✅ Aggregate Functions  
✅ Subqueries  
✅ EXISTS  
✅ INDEXING  

---


---

# 📚 SQL Queries

## 🔹 List All Students

```sql
SELECT * FROM Students;
```
<img width="1153" height="680" alt="image" src="https://github.com/user-attachments/assets/89a659a7-427d-49b7-9693-0bea1aceaf22" />

---

## 🔹 List CS students (WHERE).

```sql
SELECT StudentID, StudentName, Dept, Year, GPA
FROM Students
WHERE Dept = 'CS';
```
<img width="1162" height="677" alt="image" src="https://github.com/user-attachments/assets/5c40af8e-1f8f-47b4-a88a-bc7337d12e28" />

---

## 🔹 Students with GPA ≥ 8.5 (comparison).

```sql
SELECT StudentName, Dept, GPA
FROM Students
WHERE GPA >= 8.5
ORDER BY GPA DESC;
```
<img width="1167" height="637" alt="image" src="https://github.com/user-attachments/assets/459b01ab-c6cd-49a6-a63f-241d4d11bf10" />

---

## 🔹 Faculty hired after 2016 (date filter).

```sql
SELECT FacultyName, Dept, HireDate
FROM Faculty
WHERE HireDate > '2016-12-31'
ORDER BY HireDate;
```
<img width="1157" height="677" alt="image" src="https://github.com/user-attachments/assets/7274e94c-5bb5-4b89-a3e7-c89512016318" />

---

## 5.Courses with 4 credits (exact match).
```
SELECT CourseID, CourseName, Dept, Credits
FROM Courses
WHERE Credits = 4
ORDER BY Dept, CourseName;
```
<img width="1155" height="666" alt="image" src="https://github.com/user-attachments/assets/1f02c7cd-8879-4afb-941a-0df70b7f9acf" />


##  B) BETWEEN / IN / AND / OR-- 

-- 6.Students with GPA between 8.0 and 9.5.
```
SELECT StudentName, Dept, GPA
FROM Students
WHERE GPA BETWEEN 8.0 AND 9.5
ORDER BY GPA DESC;
```
<img width="1148" height="690" alt="image" src="https://github.com/user-attachments/assets/4de3b90c-0b51-4864-b1db-d033fb3ea975" />

-- 7.Faculty in CS or Math (IN).
```
SELECT FacultyName, Dept
FROM Faculty
WHERE Dept IN ('CS','Math')
ORDER BY Dept, FacultyName;
```
<img width="1146" height="660" alt="image" src="https://github.com/user-attachments/assets/baa96f46-867d-465f-94b2-aeb904ca29e8" />

-- 8.ECE students in Year 2 or 4 (AND + IN).
```
SELECT StudentName, Dept, Year
FROM Students
WHERE Dept = 'ECE' AND Year IN (2,4);
```
<img width="1151" height="708" alt="image" src="https://github.com/user-attachments/assets/2bdadceb-efd0-4d73-afa1-57a5fed18bd3" />

-- 9.Students from CS or ECE with GPA > 8.0 (OR + AND).
```
SELECT StudentName, Dept, GPA
FROM Students
WHERE (Dept = 'CS' OR Dept = 'ECE')
  AND GPA > 8.0;
```
<img width="1152" height="710" alt="image" src="https://github.com/user-attachments/assets/25196f91-c068-4b74-b69c-6a5160107286" />

-- 10.Faculty with salary NOT between 115k and 140k.
```
SELECT FacultyName, Dept, Salary
FROM Faculty
WHERE Salary NOT BETWEEN 115000 AND 140000
ORDER BY Salary DESC;
```
<img width="1156" height="706" alt="image" src="https://github.com/user-attachments/assets/cd605a47-a9ec-444b-9fd5-eb661d2b1f80" />

                      -- C) LIKE (pattern matching)-- 

11.Students whose name starts with 'A' or ends with 'a'.
```
SELECT StudentName
FROM Students
WHERE StudentName LIKE 'A%' OR StudentName LIKE '%a';
```
<img width="1157" height="691" alt="image" src="https://github.com/user-attachments/assets/750369c5-a8e9-4306-b863-353bd250198d" />

-- 12.Courses containing 'Data' or 'Math' in name.
```
SELECT CourseName, Dept
FROM Courses
WHERE CourseName LIKE '%Data%' OR CourseName LIKE '%Math%';
```
<img width="1153" height="695" alt="image" src="https://github.com/user-attachments/assets/e343876e-d6ed-4cd7-85ff-dbfc77ec2da9" />

-- D) JOINS (based on foreign keys)

-- 13.List each course with its instructor.
```
SELECT c.CourseID, c.CourseName, c.Dept AS CourseDept,
       f.FacultyName AS Instructor, f.Dept AS FacultyDept
FROM Courses c
JOIN Faculty f ON c.FacultyID = f.FacultyID
ORDER BY c.CourseID;
```
<img width="1146" height="695" alt="image" src="https://github.com/user-attachments/assets/8ff8fbe8-e17a-40da-a074-fc191df54f58" />

-- 14.List each student with their advisor’s name and department.
```
SELECT s.StudentID, s.StudentName, s.Dept AS StudentDept,
       f.FacultyName AS AdvisorName, f.Dept AS AdvisorDept
FROM Students s
JOIN Faculty f ON s.AdvisorID = f.FacultyID
ORDER BY s.StudentID;
```
<img width="1141" height="692" alt="image" src="https://github.com/user-attachments/assets/56b92716-3461-454e-be69-e87c77e24c2b" />

-- 15.Courses taught by Math faculty only.
```
SELECT c.CourseID, c.CourseName, c.Dept, f.FacultyName
FROM Courses c
JOIN Faculty f ON c.FacultyID = f.FacultyID
WHERE f.Dept = 'Math';
```
<img width="1158" height="697" alt="image" src="https://github.com/user-attachments/assets/bae4c045-05b4-4e44-a7ca-a2091aab46f5" />

-- 16.Students advised by CS faculty (cross-dept advising).
```
SELECT s.StudentName, s.Dept AS StudentDept, f.FacultyName AS Advisor, f.Dept AS AdvisorDept
FROM Students s
JOIN Faculty f ON s.AdvisorID = f.FacultyID
WHERE f.Dept = 'CS';
```
<img width="1156" height="707" alt="image" src="https://github.com/user-attachments/assets/bc68e4b4-869c-48b4-8cdf-6caa03765648" />

           -- E) GROUP BY / Aggregation / HAVING-- 

-- 17.Count of students per department.
```
SELECT Dept, COUNT(*) AS NumStudents
FROM Students
GROUP BY Dept
ORDER BY NumStudents DESC;
```
<img width="1157" height="707" alt="image" src="https://github.com/user-attachments/assets/018883ef-9432-4535-b40a-b5d149ef76cc" />


-- 18.Average GPA per department (rounded).
```
SELECT Dept, ROUND(AVG(GPA), 2) AS AvgGPA
FROM Students
GROUP BY Dept
ORDER BY AvgGPA DESC;
```
<img width="1148" height="697" alt="image" src="https://github.com/user-attachments/assets/eba1da21-d0b9-4bb4-b5d8-fde056f42db1" />


-- 19.Departments with more than 2 students (HAVING).
```
SELECT Dept, COUNT(*) AS NumStudents
FROM Students
GROUP BY Dept
HAVING COUNT(*) > 2;
```
<img width="1145" height="703" alt="image" src="https://github.com/user-attachments/assets/1956406a-79a7-45ba-8d82-1a5bedad64a5" />

-- 20.Average salary by faculty department where avg > 125k (HAVING).
```
SELECT Dept, ROUND(AVG(Salary), 2) AS AvgSalary
FROM Faculty
GROUP BY Dept
HAVING AVG(Salary) > 125000
ORDER BY AvgSalary DESC;
```
<img width="1162" height="677" alt="image" src="https://github.com/user-attachments/assets/331fe08d-49ce-4a1d-9ba6-9daedd43224c" />

-- 21.Number of courses per instructor (GROUP BY on join).
```
SELECT f.FacultyName, f.Dept, COUNT(*) AS CourseCount
FROM Faculty f
JOIN Courses c ON c.FacultyID = f.FacultyID
GROUP BY f.FacultyID, f.FacultyName, f.Dept
ORDER BY CourseCount DESC, f.FacultyName;
```
<img width="1152" height="671" alt="image" src="https://github.com/user-attachments/assets/88cd38a7-9e46-4ce3-8963-93074730873c" />

                       -- F) Subqueries (scalar / IN / EXISTS)-- 
-- 22.Students with GPA above overall average GPA (scalar subquery).
```
SELECT StudentName, Dept, GPA
FROM Students
WHERE GPA > (SELECT AVG(GPA) FROM Students)
ORDER BY GPA DESC;
```
<img width="1160" height="670" alt="image" src="https://github.com/user-attachments/assets/6e90a163-7140-4c95-a439-8231bd488ea1" />

-- 23.Courses taught by faculty earning above department’s average salary (correlated subquery).
```
SELECT c.CourseID, c.CourseName, f.FacultyName, f.Dept, f.Salary
FROM Courses c
JOIN Faculty f ON c.FacultyID = f.FacultyID
WHERE f.Salary > (
  SELECT AVG(Salary) FROM Faculty WHERE Dept = f.Dept
)
ORDER BY f.Dept, f.Salary DESC;
```
<img width="1155" height="677" alt="image" src="https://github.com/user-attachments/assets/e2d39cd1-0c5e-404c-9298-3241c026b842" />

-- 24.Students whose advisor is in CS (IN with subquery).
```
SELECT StudentName, Dept, AdvisorID
FROM Students
WHERE AdvisorID IN (SELECT FacultyID FROM Faculty WHERE Dept = 'CS');
```
<img width="1165" height="672" alt="image" src="https://github.com/user-attachments/assets/5e9fed8b-07f6-4d45-b329-9a96ce651187" />

-- 25.List departments that have both students and at least one course (EXISTS with subqueries).
```
SELECT DISTINCT s.Dept
FROM Students s
WHERE EXISTS (SELECT 1 FROM Courses c WHERE c.Dept = s.Dept);
```
<img width="1161" height="676" alt="image" src="https://github.com/user-attachments/assets/bb01f0d8-b1a2-4da8-bc21-108614007519" />


# 📊 Features of the Project

✔️ Real-world university database structure  
✔️ Proper relational database design  
✔️ Optimized using indexes  
✔️ Includes advanced SQL queries  
✔️ Beginner-friendly and easy to understand  
✔️ Demonstrates normalization concepts  

---



---

# 📁 Folder Structure

```text
University-Database-Project/
│
├── README.md
├── university_database.sql
├── screenshots/
│   ├── students_table.png
│   ├── faculty_table.png
│   ├── joins_output.png
│   └── aggregate_output.png
```

---



