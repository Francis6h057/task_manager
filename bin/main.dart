// Import repository implementation
import 'package:task_manager/data/repositories(impl)/in_memory_task_repository.dart';

// Import use cases
import 'package:task_manager/domain/usecases/add_task.dart';
import 'package:task_manager/domain/usecases/get_task.dart';
import 'package:task_manager/domain/usecases/remove_task.dart';
import 'package:task_manager/domain/usecases/complete_task.dart';

// Import presentation layer
import 'package:task_manager/presentation/console/task_console.dart';

// Entry point of application
void main() async {
  // Create repository implementation
  final repository = InMemoryTaskRepository();

  // Inject repository into use cases
  final console = TaskConsole(
    addTask: AddTask(repository),
    getTasks: GetTasks(repository),
    removeTask: RemoveTask(repository),
    completeTask: CompleteTask(repository),
  );

  // Start console application
  await console.start();
}
