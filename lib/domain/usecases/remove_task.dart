import '../repositories/task_repository.dart';

// Represents the action of deleting a task
class RemoveTask {
  final TaskRepository repository;

  RemoveTask(this.repository);

  Future<void> execute(String id) {
    return repository.removeTask(id);
  }
}
