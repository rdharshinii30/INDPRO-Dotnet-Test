namespace TaskManager.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public DateTime CreatedAt { get; set; }

        public ICollection<TaskItem> Tasks { get; set; }  // If you want to show tasks for each user
    }
}
