# task_manager_app


## Overview
This Flutter project is a task manager app that allows users to manage their tasks efficiently. The app features a clean and intuitive user interface, robust state management using Cubit, seamless performance, local storage for persistent data using Hive, and comprehensive unit tests to ensure functionality.


## Key Features
User Authentication: Secure login using credentials.
Task Management: Users can view, add, edit, and delete tasks.
Pagination: Efficiently fetches large numbers of tasks.
State Management: Uses Cubit for efficient state management.
Local Storage: Tasks are persisted locally using Hive.
Unit Tests: Comprehensive unit tests covering critical functionalities.


## Design Decisions
State Management: Chose Cubit for its simplicity and lightweight nature compared to Bloc.
Network Requests: Used Dio for HTTP requests due to its powerful features and ease of use.
Local Storage: Hive was selected for local storage for its high performance and compatibility with Flutter.
Error Handling: Implemented a robust error handling mechanism using custom failure classes.
UI/UX: Focused on creating a clean and user-friendly interface for better user experience.


## Challenges Faced
State Management: Ensuring state consistency and handling edge cases required careful planning.
Error Handling: Handling different types of Dio exceptions and providing meaningful error messages.
Local Storage: Syncing local storage with remote data while handling CRUD operations.
Pagination: Efficiently implementing pagination to fetch tasks without overloading the UI or the server.
Testing: Writing comprehensive unit tests to cover various scenarios including edge cases.

## Additional Features
Form Validation: Added form validation for task input fields to ensure data integrity.
Error Feedback: Provided user feedback for errors, such as login failures.
 
