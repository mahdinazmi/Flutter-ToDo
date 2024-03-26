# Demo
![](https://github.com/mahdinazmi/todo/blob/main/demo.gif)

# Overview
Clean architecture and repository design pattern are used in this project. And the principles of SOLID have been followed. The domain layer is completely independent and does not depend on the outside

# Entities
Task : We have only one entity called task in this project. This entity has the properties of title, description, creation date and task update date.

# UseCases 
In this project, we have three usecases for the task entity.
get created tasks: This usecase is for getting all available tasks from the local database.
task creation: This is the use case for creating a new task.
task updating: This usecase is available for task updating.

# Dependency Injection
For dependency injection, the get_it library is used, which is a very simple library for dependency injection. In the service locator file, the required classes and usecases are registered as singletons.

# Database
The floor library is used for the local database. Floor provides a neat SQLite abstraction for your Flutter applications.It comes with automatic mapping between in-memory objects and database rows while still offering full control of the database with the use of SQL.
