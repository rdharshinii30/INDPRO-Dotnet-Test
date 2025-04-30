Task Manager - README
How to Set Up and Run the Project
1. Clone the repository:
 git clone [https://github.com/your-username/task-manager.git](https://github.com/rdharshinii30/INDPRO-Dotnet-Test)
 cd task-manager
2. Update the Database Connection String in appsettings.json.
3. Apply Migrations and Create Database:
 dotnet ef database update
4. Run the Application:
 dotnet run
5. Access at: https://localhost:5001
Assumptions Made During Development
- Each task has basic fields: Title, Description, Category, and IsCompleted.
- Default task status is 'Pending'.
- No authentication initially enforced.
- Only pending tasks can be marked as completed.
  
Technologies and Libraries Used
- ASP.NET Core MVC (.NET 6/7)
- Entity Framework Core
- SQL Server (LocalDB)
- Bootstrap 5
- Swagger/OpenAPI
  
Challenges Faced and How They Were Addressed
Task Manager - README
- Database updates after model changes solved by EF Core Migrations.
- CSRF validation errors fixed with [ValidateAntiForgeryToken].
- "Mark as Completed" handled by dedicated POST method.
- Deletion flow corrected with DeleteConfirmed method and ActionName attribute.
- Used helper methods like TaskItemExists to avoid code duplication.
  
API Specification (Swagger/OpenAPI)
- Swashbuckle.AspNetCore package used.
- Added Swagger services and middleware.
- Access Swagger UI at: https://localhost:5001/swagger
  
Folder Structure Overview
TaskManager/
--- Controllers/
--- Models/
--- Data/
--- Views/
--- wwwroot/
--- appsettings.json
--- Program.cs

Future Enhancements
- Add authentication.
- Implement task priority and due dates.
- Improve UI design.
- Deploy to Azure or AWS.
