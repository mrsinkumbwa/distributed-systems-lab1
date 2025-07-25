🎓 Student Management API - Ballerina Implementation
https://img.shields.io/badge/Ballerina-2201.7%252B-blue
https://img.shields.io/badge/API-RESTful-green
https://img.shields.io/badge/Operations-CRUD-success

📋 Table of Contents
Project Overview

System Architecture

Prerequisites

Installation Guide

Project Structure

API Reference

Testing Guide

Error Handling

Logging System

Troubleshooting

Sample Data

License

🏁 Project Overview
This project implements a RESTful API for student management using Ballerina. It provides complete CRUD (Create, Read, Update, Delete) functionality with an in-memory storage solution. The API allows you to:

Add new student records

Retrieve student information by ID

Update existing student records

Delete student records

List all students in the system

The system uses Ballerina's built-in HTTP service capabilities and table data structure for efficient in-memory storage with O(1) lookups using student ID as the primary key.

🏗 System Architecture
Diagram
Code










Key Components:

HTTP Listener: Handles incoming requests on port 8080

Student Service: Processes REST API requests

In-Memory Table: Stores student records with ID as primary key

Logger: Records system events and operations

🛠 Prerequisites
Software Requirements
Software	Minimum Version	Installation Guide
Git	2.25+	Git Downloads
Ballerina	2201.7.0	Ballerina Downloads
cURL	7.68+	cURL Downloads
Verification Commands
bash
# Verify installations
git --version
bal version
curl --version
System Requirements
2GB RAM minimum

500MB disk space

Windows, macOS, or Linux

💻 Installation Guide
Step 1: Clone Repository
bash
git clone https://github.com/your-username/student-management-api.git
cd student-management-api
Step 2: Build Project
bash
bal build
Expected Output:

text
Compiling source
        your/package:0.1.0

Generating executable
Step 3: Run Service
bash
bal run
Successful Startup Output:

text
Running executable

[ballerina/http] started HTTP/WS listener 0.0.0.0:8080
Note: The service runs on port 8080 by default. Press Ctrl+C to stop the service.

📂 Project Structure
text
student-management-api/
├── course_crud.bal        # Main service implementation
├── Ballerina.toml         # Project configuration
├── README.md              # Project documentation
└── resources/             # Additional resources (if any)
File Descriptions:
course_crud.bal:

Contains the HTTP service definition

Implements all CRUD operations

Defines the Student record type

Initializes the in-memory student table

Ballerina.toml:

Project configuration file

Defines package metadata and dependencies

🌐 API Reference
Base URL
http://localhost:8080/students

Endpoints
Method	Endpoint	Description	Parameters	Payload
POST	/addStudent	Add new student	None	JSON Student object
GET	/getStudent	Get student by ID	id (query)	None
PUT	/updateStudent	Update student	None	JSON Student object
DELETE	/deleteStudent	Delete student	id (query)	None
GET	/listStudents	List all students	None	None
Student Object Schema
json
{
  "id": "string",
  "name": "string",
  "courseCode": "string",
  "designation": "string"
}
Field Descriptions
Field	Type	Description	Constraints
id	string	Student ID	Readonly, unique
name	string	Full name	2-100 characters
courseCode	string	Course code	6-10 characters
designation	string	Student status	3-50 characters
🧪 Testing Guide
➕ Add Student
bash
curl -X POST http://localhost:8080/students/addStudent \
  -H "Content-Type: application/json" \
  -d '{
    "id": "202099999",
    "name": "Alice Max",
    "courseCode": "WIL721S",
    "designation": "Intern"
  }'
Expected Responses:

Success (201 Created):

text
✅ Student added successfully.
Conflict (409):

text
⚠️ Student already exists.
🔍 Get Student
bash
curl "http://localhost:8080/students/getStudent?id=202099999"
Expected Responses:

Success (200 OK):

json
{
  "id": "202099999",
  "name": "Alice Max",
  "courseCode": "WIL721S",
  "designation": "Intern"
}
Not Found (404):

text
❌ Student not found.
🖊️ Update Student
bash
curl -X PUT http://localhost:8080/students/updateStudent \
  -H "Content-Type: application/json" \
  -d '{
    "id": "202099999",
    "name": "Alice Maxine",
    "courseCode": "WIL721S",
    "designation": "Graduate Intern"
  }'
Expected Responses:

Success (200 OK):

text
✅ Student updated.
Not Found (404):

text
⚠️ Student does not exist.
❌ Delete Student
bash
curl -X DELETE "http://localhost:8080/students/deleteStudent?id=202099999"
Expected Responses:

Success (200 OK):

text
✅ Student deleted.
Not Found (404):

text
❌ Student not found.
📋 List All Students
bash
curl http://localhost:8080/students/listStudents
Example Response:

json
[
  {
    "id": "220034311",
    "name": "Mbanga Sinkumbwa",
    "courseCode": "DSA621S",
    "designation": "Computer Science Major"
  },
  {
    "id": "202099999",
    "name": "Alice Maxine",
    "courseCode": "WIL721S",
    "designation": "Graduate Intern"
  }
]
⚠️ Error Handling
HTTP Status Codes
Code	Status	Description
200	OK	Successful operation
400	Bad Request	Invalid input parameters
404	Not Found	Student record not found
409	Conflict	Attempt to add existing student
500	Internal Server Error	Unexpected server error
Error Responses
All error responses follow the format:

json
{
  "error": "Error message describing the issue"
}
Example:

json
{
  "error": "Student not found for ID: 202011111"
}
📝 Logging System
Log Format
text
[timestamp] [log-level] - [message]
Log Levels
Level	Description	Example
INFO	Successful operations	Student added: 202099999
WARN	Non-critical issues	Attempt to add existing student: 202099999
ERROR	Critical errors	Database connection failed
Sample Log Output
text
[2023-10-15 10:30:45,000] INFO  - Student added: 202099999
[2023-10-15 10:31:22,000] WARN  - Student not found for ID: 202011111
[2023-10-15 10:32:10,000] INFO  - Student updated: 202099999
🛠 Troubleshooting
Port Conflict Solution
bash
# Run on alternative port
bal run -- port=9090
cURL Command Reference
Windows CMD Format
cmd
curl -X POST http://localhost:8080/students/addStudent ^
  -H "Content-Type: application/json" ^
  -d "{\"id\":\"202099999\", \"name\":\"Alice Max\", \"courseCode\":\"WIL721S\", \"designation\":\"Intern\"}"
PowerShell Format
powershell
curl -X POST http://localhost:8080/students/addStudent `
  -H "Content-Type: application/json" `
  -d '{\"id\":\"202099999\", \"name\":\"Alice Max\", \"courseCode\":\"WIL721S\", \"designation\":\"Intern\"}'
Common Issues
Ballerina command not found:

Verify installation: bal version

Add Ballerina to PATH: export PATH=$PATH:/path/to/ballerina/bin (Linux/macOS)

JSON parsing errors:

Validate JSON using JSONLint

Ensure proper escaping in command line

Service not responding:

Verify service is running: netstat -ano | findstr :8080 (Windows), lsof -i :8080 (Linux/macOS)

Check for firewall restrictions

📊 Sample Data
Valid Student Records
json
{
  "id": "220034311",
  "name": "Mbanga Sinkumbwa",
  "courseCode": "DSA621S",
  "designation": "Computer Science Major"
}
json
{
  "id": "202199998",
  "name": "John Smith",
  "courseCode": "MAT101",
  "designation": "Freshman"
}
Invalid Student Records (for testing)
json
// Missing required field
{
  "name": "Incomplete Record",
  "courseCode": "TEST101",
  "designation": "Test Student"
}
json
// Invalid data types
{
  "id": 202099999,
  "name": "Numeric ID",
  "courseCode": "TYP101",
  "designation": "Type Test"
}
📜 License
This project is licensed under the MIT License - see the LICENSE file for full details.

MIT License Summary:

Permission is granted for free use, modification, and distribution

The software is provided "AS IS" without warranty

The license text must be included in all copies

Developer not liable for any damages

Developed with ❤️ using Ballerina
For support, please open an issue in the GitHub repository.

