# ALU Database System - Play with SQL Basics

## Project Overview
This repository contains a Relational Database Management System (RDBMS) designed for a school environment using MySQL. The project focuses on creating a structured database layout that models five core school elements: students, classrooms, teachers, courses, and extra-curricular activities. It establishes reliable links between data tables while preventing duplication.

---

## Learning Objectives
* Designing relational database tables with accurate and optimized data types.
* Implementing Primary Keys (PK) and Foreign Keys (FK) to establish clear table relationships.
* Practicing database normalization techniques to eliminate redundant data.
* Writing structural SQL statements including table creation, data insertion, updates, and deletions.
* Executing complex JOIN queries and aggregate functions to extract meaningful information.

---

## Database Schema Structure
The system architecture consists of five interconnected tables:
* **Classroom**: Holds the physical location details, including room numbers, building names, and maximum seating capacities.
* **Faculty**: Stores teacher profiles, contact information, and their assigned academic departments.
* **Students**: Contains student registration details and associates each student with a primary classroom.
* **Courses**: Manages academic courses, linking each course to a specific instructor and a designated classroom.
* **Extra-Curricular Activities**: Details campus groups and activities, along with their assigned faculty advisors.

---

## Team Roles and Contributions
This project was built collaboratively. Each member took complete ownership of a specific database table, writing the necessary generation scripts, sample data insertions, and individual verification queries:

* **Classroom Table**: Managed and implemented by Member A.
* **Faculty Table**: Managed and implemented by Nix.
* **Students Table**: Managed and implemented by Member C.
* **Courses Table**: Managed and implemented by Member D.
* **Extra-Curricular Activities & Junction Tables**: Managed and implemented by Member E.

---

## Execution and Build Order
Because certain tables rely on data from other tables via Foreign Key constraints, the single shared SQL script must be run in a precise chronological order:
1. **Base Tables**: Classroom and Faculty are created first because they do not depend on external data.
2. **Component Tables**: Students and Courses are created next, referencing the primary keys of the base tables.
3. **Dependent Tables**: Extra-Curricular Activities and connecting junction tables are created last to complete the network.

---

## How to Run the Script
This database project is designed to run entirely within a Linux terminal environment with MySQL installed. 

### 1. Clone the Repository
Clone this shared project repository to your local terminal environment:
```bash
git clone <your-repository-link>
cd <your-repository-folder>
