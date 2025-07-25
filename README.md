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
```mermaid
graph TD
    A[Client] -->|HTTP Requests| B[Ballerina Service]
    B --> C[In-Memory Storage]
    C --> D[Student Records]
    B --> E[Logging System]
    
    subgraph Ballerina Runtime
        B -->|CRUD Operations| C
        C -->|Data Persistence| D[Table<Student>]
        B -->|Log Events| E[Console Logger]
    end
