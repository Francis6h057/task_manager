// Import the Task entity because repository works with Task objects
import '../entities/task.dart';

// Defines the contract that any Task repository must follow
abstract class TaskRepository {
  // Adds a new task to storage
  Future<void> addTask(Task task);

  // Removes a task using its id
  Future<void> removeTask(String id);

  // Retrieves all stored tasks
  Future<List<Task>> getTasks();

  // Updates an existing task (used when marking complete)
  Future<void> updateTask(Task task);
}
