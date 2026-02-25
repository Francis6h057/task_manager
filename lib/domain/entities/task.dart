// Defines the core business object of our application
class Task {
  // Unique identifier of the task
  final String id;

  // Title or description of the task
  final String title;

  // Indicates whether the task has been completed
  final bool isCompleted;

  // Constructor used to create a new Task object
  Task({
    required this.id, // id must always be provided
    required this.title, // title must always be provided
    this.isCompleted = false, // defaults to false if not specified
  });

  // Business rule method that returns a NEW completed task
  Task markComplete() {
    return Task(
      id: id, // keep the same id
      title: title, // keep the same title
      isCompleted: true, // mark it as completed
    );
  }
}
