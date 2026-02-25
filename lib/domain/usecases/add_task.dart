// Import entity
import '../entities/task.dart';

// Import repository interface
import '../repositories/task_repository.dart';

// This class represents the action of adding a task
class AddTask {
  // Repository dependency (injected)
  final TaskRepository repository;

  // Constructor receives repository implementation
  AddTask(this.repository);

  // Executes the business action
  Future<void> execute(String id, String title) async {
    // Business rule: title cannot be empty
    if (title.isEmpty) {
      throw Exception("Task title cannot be empty");
    }

    // Create a new Task entity
    final task = Task(id: id, title: title);

    // Save the task using repository
    await repository.addTask(task);
  }
}
