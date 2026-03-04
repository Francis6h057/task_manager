import '../entities/task.dart';
import '../repositories/task_repository.dart';

// Represents marking a task as completed
class CompleteTask {
  final TaskRepository repository;

  CompleteTask(this.repository);

  Future<void> execute(Task task) async {
    // Apply business rule inside entity
    final updatedTask = task.markComplete();

    // Persist the updated task
    await repository.updateTask(updatedTask);
  }
}
