import ballerina/http;
import ballerina/log;

// Define the Student record
type Student record {
    // 'id' is a readonly field used as the unique key
    readonly string id;
    string name;
    string courseCode;
    string designation;
};

// In-memory table with 'id' as primary key
table<Student> key(id) studentTable = table [
    {
        id: "220034311",
        name: "Mbanga Sinkumbwa",
        courseCode: "DSA621S",
        designation: "Computer Science Major"
    }
];

// Define a RESTful service mounted at /students
service /students on new http:Listener(8080) {

    // ✅ CREATE: Add a new student
    resource function post addStudent(@http:Payload Student student) returns string {
        if studentTable.hasKey(student.id) {
            log:printWarn("Attempt to add an existing student with ID: " + student.id);
            return "⚠️ Student already exists.";
        }
        studentTable.add(student);
        log:printInfo("Student added: " + student.id);
        return "✅ Student added successfully.";
    }

    // 🔍 READ: Get a student by ID
    resource function get getStudent(@http:Query string id) returns Student|error {
        Student? student = studentTable[id];
        if student is Student {
            return student;
        }
        log:printWarn("Student not found for ID: " + id);
        return error("❌ Student not found.");
    }

    // 🖊️ UPDATE: Update existing student
    resource function put updateStudent(@http:Payload Student updatedStudent) returns string {
        if studentTable.hasKey(updatedStudent.id) {
            // Replace old record by removing and re-adding
            _ = studentTable.remove(updatedStudent.id);
            studentTable.add(updatedStudent);
            log:printInfo("Student updated: " + updatedStudent.id);
            return "✅ Student updated.";
        }
        log:printWarn("Attempt to update non-existing student: " + updatedStudent.id);
        return "⚠️ Student does not exist.";
    }

    // ❌ DELETE: Delete a student by ID
    resource function delete deleteStudent(@http:Query string id) returns string {
        if studentTable.hasKey(id) {
            _ = studentTable.remove(id);
            log:printInfo("Student deleted: " + id);
            return "✅ Student deleted.";
        }
        log:printWarn("Attempt to delete non-existing student: " + id);
        return "❌ Student not found.";
    }

    // 📋 LIST: List all students
    resource function get listStudents() returns Student[] {
        return studentTable.toArray();
    }
}
