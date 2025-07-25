Student Management API - Ballerina Implementation
This project provides a RESTful API for managing student records using Ballerina. It features CRUD operations (Create, Read, Update, Delete) with an in-memory storage solution.

Prerequisites
Git

Ballerina (version 2201.7.0 or higher)

cURL (for API testing)

Getting Started
1. Clone the Repository
bash
git clone https://github.com/your-username/student-management-api.git
cd student-management-api
2. Project Structure
text
student-management-api/
├── course_crud.bal    # Main Ballerina service file
└── README.md           # This documentation
3. Build the Project
bash
bal build
4. Run the Service
bash
bal run
Successful startup will show:

text
Compiling source
        your/package:0.1.0

Running executable

[ballerina/http] started HTTP/WS listener 0.0.0.0:8080
API Endpoints
Method	Endpoint	Description
POST	/students/addStudent	Add a new student
GET	/students/getStudent	Get a student by ID
PUT	/students/updateStudent	Update an existing student
DELETE	/students/deleteStudent	Delete a student by ID
GET	/students/listStudents	List all students
Testing the API
➕ Add Student
bash
curl -X POST http://localhost:8080/students/addStudent \
  -H "Content-Type: application/json" \
  -d "{\"id\":\"202099999\", \"name\":\"Alice Max\", \"courseCode\":\"WIL721S\", \"designation\":\"Intern\"}"
Expected Response:

text
✅ Student added successfully.
🔍 Get Student
bash
curl "http://localhost:8080/students/getStudent?id=202099999"
Expected Response:

json
{
  "id":"202099999",
  "name":"Alice Max",
  "courseCode":"WIL721S",
  "designation":"Intern"
}
🖊️ Update Student
bash
curl -X PUT http://localhost:8080/students/updateStudent \
  -H "Content-Type: application/json" \
  -d "{\"id\":\"202099999\", \"name\":\"Alice Maxine\", \"courseCode\":\"WIL721S\", \"designation\":\"Graduate Intern\"}"
Expected Response:

text
✅ Student updated.
❌ Delete Student
bash
curl -X DELETE "http://localhost:8080/students/deleteStudent?id=202099999"
Expected Response:

text
✅ Student deleted.
📋 List All Students
bash
curl http://localhost:8080/students/listStudents
Example Response:

json
[
  {
    "id":"220034311",
    "name":"Mbanga Sinkumbwa",
    "courseCode":"DSA621S",
    "designation":"Computer Science Major"
  },
  {
    "id":"202099999",
    "name":"Alice Maxine",
    "courseCode":"WIL721S",
    "designation":"Graduate Intern"
  }
]
Error Handling
The API returns appropriate error messages with HTTP status codes:

400 Bad Request: Invalid input parameters

404 Not Found: Student not found

409 Conflict: Attempt to add existing student

500 Internal Server Error: Unexpected server errors

Logging
All operations are logged to the console:

text
[2023-10-15 10:30:45,000] INFO {course_crud} - Student added: 202099999
[2023-10-15 10:31:22,000] WARN {course_crud} - Student not found for ID: 202011111
Stopping the Service
Press Ctrl+C in the terminal where the service is running to stop it.

Troubleshooting
Port Conflict: If port 8080 is in use:

bash
bal run -- port=9090
Then update curl commands to use the new port

Ballerina Not Found: Verify installation with:

bash
bal version
cURL Errors: Ensure JSON formatting is correct and use double quotes in Windows CMD:

cmd
curl -X POST http://localhost:8080/students/addStudent -H "Content-Type: application/json" -d "{\"id\":\"202099999\", \"name\":\"Alice Max\", \"courseCode\":\"WIL721S\", \"designation\":\"Intern\"}"
Sample Student Data
Use this sample data for testing:

json
{
  "id": "220034311",
  "name": "Mbanga Sinkumbwa",
  "courseCode": "DSA621S",
  "designation": "Computer Science Major"
}
License
This project is licensed under the MIT License - see the LICENSE file for details.

