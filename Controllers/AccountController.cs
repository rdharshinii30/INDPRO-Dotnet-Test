using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using TaskManager.Models;
using TaskManager.Data;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace TaskManager.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _context;

        public AccountController(ApplicationDbContext context)
        {
            _context = context;
        }

        // Register Action - Display the registration form
        public IActionResult Register()
        {
            return View();
        }

        // Register POST Action - Handle user registration
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Register(string Username, string Password, string ConfirmPassword, string Email)
        {
            if (Password != ConfirmPassword)
            {
                ModelState.AddModelError("", "Passwords do not match.");
                return View();
            }

            var existingUser = _context.Users.FirstOrDefault(u => u.Username == Username);
            if (existingUser != null)
            {
                ModelState.AddModelError("", "Username already taken.");
                return View();
            }

            var user = new User
            {
                Username = Username,
                PasswordHash = Password, // ⚡ later you can hash it
                CreatedAt = DateTime.Now
            };

            _context.Users.Add(user);
            _context.SaveChanges();

            return RedirectToAction("Login");
        }



        // Login Action - Display the login form
        public IActionResult Login()
        {
            return View();
        }

        // Login POST Action - Handle user login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Login(string username, string password)
        {
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ViewBag.Error = "Please enter both username and password.";
                return View();
            }

            var user = _context.Users.FirstOrDefault(u => u.Username == username && u.PasswordHash == password);

            if (user != null)
            {
                // Set session variable
                HttpContext.Session.SetInt32("UserId", user.Id);

                // Redirect to Task/Index after successful login
                return RedirectToAction("Index", "Task");
            }

            // If invalid credentials
            ViewBag.Error = "Invalid username or password.";
            return View();
        }

        // Logout Action - Handle user logout and session clearing
        public IActionResult Logout()
        {
            // Clear the session
            HttpContext.Session.Clear();

            // Redirect to login page
            return RedirectToAction("Login");
        }
    }
}
