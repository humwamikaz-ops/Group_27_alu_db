# ALU School Management Database System

## Project Overview
This repository contains the Relational Database Management System (RDBMS) schema for a school management system designed as part of the **ALU Play with SQL Basics** peer group activity for Group 27. The database handles core school components, tracking relationships between students, their assigned classrooms, faculty members, courses, and extracurricular clubs using a Linux terminal, MySQL, and GitHub.

---

## Database Schema Layout
The system is built around 5 main entities structured in Third Normal Form (3NF) to avoid duplicate data:

*   **Classroom**: Tracks physical locations, buildings, and capacities.
*   **Faculty**: Stores instructor names, contact emails, and academic departments.
*   **Students**: Manages student enrollments linked directly to their primary classrooms.
*   **Courses**: Maps classes to both the physical classroom and the assigned faculty instructor.
*   **Extra-Curricular Clubs**: Tracks school activities supervised by faculty advisors.

### Junction Tables (Many-to-Many)
*   `Student_Courses`: Maps which students are enrolled in which specific courses.
*   `Student_Activities`: Tracks student participation across different extracurricular clubs.

---

## Group 27 Roles & Table Allocations

| Group Member | Assigned Table | Core Responsibilities |
| :--- | :--- | :--- |
| **Member A** | `Students` | Defined schema structure, configured primary keys, added 5 sample student rows, and wrote isolated CRUD queries. |
| **Member B** | `Classroom` | Defined schema structure, configured primary keys, added 5 sample classroom rows, and wrote isolated CRUD queries. |
| **Member C (Nix)** | `Faculty` | Wrote the code to create the Faculty table, defined primary keys, added 5 sample instructor rows, and wrote isolated CRUD queries. |
| **Member D** | `Courses` | Defined schema structure, configured primary keys, added 5 sample course rows, and wrote isolated CRUD queries. |
| **Member E** | `Extra_Curricular_Activities` | Defined schema structure, configured primary keys, added 5 sample club rows, and wrote isolated CRUD queries. |
| **Member E (Junction)** | `Student_Courses` & `Student_Activities` | Implemented many-to-many relational mapping rules using twin isolated junction tables to maintain 3NF database normalization. |

---

## How to Run and Test the Database

### Prerequisites
*   A Linux terminal environment.
*   MySQL Server installed and actively running.
*   Git configured on your terminal machine.

### Setup Instructions
1. Clone the repository to your local directory:
   ```bash
   git clone [https://github.com/humwamikaz-ops/Group_27_alu_db.git](https://github.com/humwamikaz-ops/Group_27_alu_db.git)
   cd Group_27_alu_db
