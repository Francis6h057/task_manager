// Import Task entity
import '../../domain/entities/task.dart';

// Import repository interface
import '../../domain/repositories/task_repository.dart';

// Concrete implementation of TaskRepository
class InMemoryTaskRepository implements TaskRepository {
  // Private list to store tasks in memory
  final List<Task> _tasks = [];

  // Adds task to the list
  @override
  Future<void> addTask(Task task) async {
    _tasks.add(task);
  }

  // Removes a task by matching id
  @override
  Future<void> removeTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
  }

  // Returns all tasks
  @override
  Future<List<Task>> getTasks() async {
    return _tasks;
  }

  // Updates an existing task
  @override
  Future<void> updateTask(Task task) async {
    // Find index of task with same id
    final index = _tasks.indexWhere((t) => t.id == task.id);

    // If found, replace old task
    if (index != -1) {
      _tasks[index] = task;
    }
  }
}
