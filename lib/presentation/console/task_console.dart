// Import dart:io for console input/output
import 'dart:io';

// Import use cases
import '../../domain/usecases/add_task.dart';
import '../../domain/usecases/get_task.dart';
import '../../domain/usecases/remove_task.dart';
import '../../domain/usecases/complete_task.dart';

// Handles console interaction
class TaskConsole {
  final AddTask addTask;
  final GetTasks getTasks;
  final RemoveTask removeTask;
  final CompleteTask completeTask;

  TaskConsole({
    required this.addTask,
    required this.getTasks,
    required this.removeTask,
    required this.completeTask,
  });

  // Starts the console loop
  Future<void> start() async {
    while (true) {
      print("\n1. Add Task");
      print("2. List Tasks");
      print("3. Complete Task");
      print("4. Remove Task");
      print("5. Exit");

      final input = stdin.readLineSync();

      switch (input) {
        case '1':
          print("Enter task title:");
          final title = stdin.readLineSync() ?? '';
          await addTask.execute(DateTime.now().toString(), title);
          break;

        case '2':
          final tasks = await getTasks.execute();
          for (final task in tasks) {
            print(
              "${task.id} - ${task.title} - ${task.isCompleted ? 'Done' : 'Pending'}",
            );
          }
          break;

        case '3':
          print("Enter task id:");
          final id = stdin.readLineSync() ?? '';
          final tasks = await getTasks.execute();
          final task = tasks.firstWhere((t) => t.id == id);
          await completeTask.execute(task);
          break;

        case '4':
          print("Enter task id:");
          final removeId = stdin.readLineSync() ?? '';
          await removeTask.execute(removeId);
          break;

        case '5':
          return;
      }
    }
  }
}
