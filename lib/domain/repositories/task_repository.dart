import '../entities/task.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<void> removeTask(String id);
  Future<List<Task>> getTask();
  Future<void> updateTask(Task task);
}
