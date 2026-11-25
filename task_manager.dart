import "TaskClass.dart";

class TaskManager {
  List<Task> _tasks = [];
  DateTime? _lastEditDate;
  late String? userId;
  TaskManager({this.userId});
  List<Task> get tasks {
    return _tasks;
  }

  // Add method
  void addTask(
    String taskName, {
    String? taskDescription,
    Importance importance = Importance.ImportantAndNeccesry,
    String? category,
    DateTime? deadLine,
    taskStatus? status,
    DateTime? completeDate,
    DateTime? startDate,
    DateTime? pauseDate,
    DateTime? lastEditedDate,
    List<String>? tags,
    int? progressPercentage,
    Duration? estimatedTime,
    Duration? timeSpent,
    List<Task>? subTasks,
    List<DateTime>? reminders,
    Map<DateTime, String>? comments,
    String? assignedTo,
    DateTime? taskAssignedDate,
    String? taskAssignedBy,
  }) {
    Task newTask = Task(
      taskName,
      description: taskDescription,
      taskImportance: importance,
      category: category ?? null,
      deadLine: deadLine,
      status: status ?? taskStatus.notStarted,
      completeDate: completeDate,
      startDate: startDate,
      pauseDate: pauseDate,
      tags: tags,
      progressPercentage: progressPercentage,
      estimatedTime: estimatedTime,
      timeSpent: timeSpent,
      subTasks: subTasks,
      reminders: reminders,
      comments: comments,
      assignedTo: assignedTo,
      assignedBy: taskAssignedBy,
    );
    _tasks.add(newTask);
    _lastEditDate = DateTime.now();
  }

  // remove method
  void removeTask(String id) {
    for (Task x in tasks) {
      if (x.taskId == id) {
        tasks.remove(x);
      }
    }
  }

  // update method
  Task? updateTask(
    String id, {
    String? name,
    String? category,
    Importance? taskImportance,
    DateTime? deadLine,
    taskStatus? status,
    DateTime? completeDate,
    DateTime? startDate,
    DateTime? pauseDate,
    String? description,
    int? progressPercentage,
    Duration? estimatedTimeSeconds,
    Duration? timeSpentSeconds,
    List<String>? tags,
    String? assignedTo,
    DateTime? assignedDate,
    String? assignedBy,
  }) {
    var task = searchById(id);
    if (task.runtimeType != Task) {
      return null;
    }
    Task newTask = task;
    newTask.setTaskName = name ?? newTask.taskName;
    newTask.setCategory = category ?? newTask.category;
    newTask.setTaskImportance = taskImportance ?? newTask.taskImportance;
  }

  // search method
  List<Task> search(String word) {
    List<Task> resutls = [];
    List<Map<String, dynamic>> tasksForSearch = [];

    // Convert all Tasks into Maps
    for (Task x in tasks) {
      tasksForSearch.add(x.toMap());
    }
    // Find the word in values of these maps
    for (Map<String, dynamic> x in tasksForSearch) {
      for (dynamic v in x.values) {
        if (v.toString().contains(word)) {
          resutls.add(Task.fromJson(x));
        }
      }
    }

    return resutls;
  }

  dynamic searchById(String id) {
    for (Task x in tasks) {
      if (x.taskId == id) {
        return x;
      }
    }
  }

  int get taskCount {
    return this.tasks.length;
  }

  DateTime? get lastEditDate {
    return _lastEditDate;
  }
}

void main() {
  TaskManager taskManager = TaskManager();
  taskManager.addTask("صلاة الظهر");
  print(taskManager.search("صلاة الظهر"));
}
