import '../entities/task.dart';
import '../repositories/task_repository.dart';

// Represents the action of retrieving all tasks
class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  // Returns a list of tasks
  Future<List<Task>> execute() {
    return repository.getTasks();
  }
}
