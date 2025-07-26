# 🎓 Student Management API - Ballerina Implementation

![Ballerina](https://img.shields.io/badge/Ballerina-2201.7%2B-blue)
![REST API](https://img.shields.io/badge/API-RESTful-green)
![CRUD Operations](https://img.shields.io/badge/Operations-CRUD-success)

## 📋 Table of Contents
- [Project Overview](#project-overview)
- [System Architecture](#system-architecture)
- [Prerequisites](#prerequisites)
- [Installation Guide](#installation-guide)
- [Project Structure](#project-structure)
- [API Reference](#api-reference)
- [Testing Guide](#testing-guide)
- [Error Handling](#error-handling)
- [Logging System](#logging-system)
- [Troubleshooting](#troubleshooting)
- [Sample Data](#sample-data)
- [License](#license)

## 🏁 Project Overview
This project implements a RESTful API for student management using Ballerina. It provides complete CRUD (Create, Read, Update, Delete) functionality with an in-memory storage solution.

**Key Features:**
- Add new student records
- Retrieve student information by ID
- Update existing student records
- Delete student records
- List all students in the system

## 🏗 System Architecture

🧪 How to Run This

1. Save it as: `course_crud.bal` in your project folder.  
2. Open terminal in the project folder.  
3. Run the server:

```bash
bal run
```

4. Open a browser or use `curl` to test the endpoints.

---

## 🔧 Testing with CMD (for Windows users)

### ➕ Add Student
```cmd
curl -X POST http://localhost:8080/students/addStudent ^
  -H "Content-Type: application/json" ^
  -d "{\"id\":\"202099999\", \"name\":\"Alice Max\", \"courseCode\":\"WIL721S\", \"designation\":\"Intern\"}"
```

### 🔍 Get Student
```cmd
curl "http://localhost:8080/students/getStudent?id=202099999"
```

### 🖊️ Update Student
```cmd
curl -X PUT http://localhost:8080/students/updateStudent ^
  -H "Content-Type: application/json" ^
  -d "{\"id\":\"202099999\", \"name\":\"Alice Maxine\", \"courseCode\":\"WIL721S\", \"designation\":\"Graduate Intern\"}"
```

### ❌ Delete Student
```cmd
curl -X DELETE "http://localhost:8080/students/deleteStudent?id=202099999"
```

### 📋 List All Students
```cmd
curl http://localhost:8080/students/listStudents
```

