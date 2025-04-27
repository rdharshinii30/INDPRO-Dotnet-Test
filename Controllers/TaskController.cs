using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using TaskManager.Data;
using TaskManager.Models;
using Microsoft.EntityFrameworkCore;

namespace TaskManager.Controllers
{
    public class TaskController : Controller
    {
        private readonly ApplicationDbContext _context;

        public TaskController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Task/Index
        public async Task<IActionResult> Index()
        {
            var tasks = await _context.Tasks.ToListAsync(); // Assuming the DbSet is called "Tasks"
            return View(tasks);
        }

        // GET: Task/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Task/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(TaskItem taskItem)
        {
            if (ModelState.IsValid)
            {
                taskItem.IsCompleted = false; // Default to not completed
                _context.Add(taskItem);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(taskItem);
        }

        // GET: Task/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
                return NotFound();

            var taskItem = await _context.Tasks.FindAsync(id); // Use "Tasks" to match DbSet
            if (taskItem == null)
                return NotFound();

            return View(taskItem);
        }

        // POST: Task/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, TaskItem taskItem)
        {
            if (id != taskItem.Id)
                return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(taskItem);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TaskItemExists(taskItem.Id))
                        return NotFound();
                    else
                        throw;
                }
                return RedirectToAction(nameof(Index));
            }
            return View(taskItem);
        }

        private bool TaskItemExists(int id)
        {
            return _context.Tasks.Any(e => e.Id == id); // Ensure consistency with DbSet name
        }

        // POST: Task/ToggleStatus/5
        [HttpPost]
        public async Task<IActionResult> ToggleStatus(int id)
        {
            var task = await _context.Tasks.FindAsync(id); // Correct to "Tasks" instead of "TaskItems"
            if (task == null)
            {
                return NotFound();
            }

            task.IsCompleted = !task.IsCompleted; // Toggle completion status
            _context.Update(task);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        // GET: Task/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
                return NotFound();

            var taskItem = await _context.Tasks.FirstOrDefaultAsync(m => m.Id == id);
            if (taskItem == null)
                return NotFound();

            return View(taskItem); // Show a confirmation page
        }

        // POST: Task/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var taskItem = await _context.Tasks.FindAsync(id);
            if (taskItem != null)
            {
                _context.Tasks.Remove(taskItem);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }
        [HttpPost]
        public async Task<IActionResult> MarkAsCompleted(int id)
        {
            var task = await _context.Tasks.FindAsync(id);
            if (task == null)
            {
                return NotFound();
            }

            task.IsCompleted = true; // Mark it as completed
            _context.Update(task);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index)); // Redirect back to task list
        }


    }
}
