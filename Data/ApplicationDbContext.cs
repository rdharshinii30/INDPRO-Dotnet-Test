using Microsoft.EntityFrameworkCore;
using TaskManager.Models;

namespace TaskManager.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        // Define the tables
        public DbSet<User> Users { get; set; }
        public DbSet<TaskItem> Tasks { get; set; } // Use only one DbSet for TaskItem
    }
}
