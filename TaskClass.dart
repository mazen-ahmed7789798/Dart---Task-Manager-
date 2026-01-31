enum taskStatus { notStarted, inProgress, completed, paused, resumed }

enum Importance {
  ImportantAndNeccesry,
  Import,
  Neccesry,
  NotImportantAndNotNeccery,
}

enum Recurrence { daily, weekly, monthly, notRecurrence }

class Task {
  /*
  1 - Paramaters (Attributes)
    TaskName, required ===
    AddData, ===
    Category, ===
    Importance required ===
    Deadline?, ===
    Status = notStarted ===
    CompleteDate?  ===
    StartDate? ===
    PauseDate? ===
    resumeDate? ===
    lastEditedDate = addDate ===
  */
  /*
  2 - Methods 
    Edit TaskName ===
    Edit Category ===
    Edit Deadline ===
    Edit Importance ===
    Edit Status ===
    Pause Task ===
    Start Task ===
    resume Task ===
    Complete Task ===
    toMap 

  */

  late String _taskName;
  DateTime _addDate = DateTime.now();
  String? _description;
  String? _category;
  late Importance _taskImportance;
  DateTime? _deadLine;
  taskStatus? _status;
  DateTime? _completeDate;
  DateTime? _startDate;
  DateTime? _pauseDate;
  DateTime? _lastEditedDate;
  List<String> _tags = [];
  int _progressPercentage = 0;
  Duration _estimatedTime = Duration.zero;
  Duration _timeSpent = Duration.zero;
  List<Task> _subTasks = [];
  List<DateTime>? _reminders = [];
  Recurrence? _recurrence;
  Map<DateTime, String>? _comments;
  String? _assignedTo;
  DateTime? _assignedDate;
  String? _assignedBy;
  Task({
    required String name,
    String category = "Unknown",
    taskStatus status = taskStatus.notStarted,
    required Importance taskImportance,
    required DateTime deadLine,
    List<String>? tags,
    String? relatedTopics,
    String? description,
    List<DateTime>? reminders,
    Recurrence? reccurrence,
    Map<DateTime, String>? comments,
  }) {
    this._deadLine = deadLine;
    this._taskName = name;
    this._category = category;
    this._taskImportance = taskImportance;
    this._addDate = DateTime.now();
    this._status = status;
    this._lastEditedDate = this._addDate;
    this._tags = tags ?? [];
    this._description = description;
    this._reminders = reminders;
    this._recurrence = reccurrence;
    this._comments = comments;
  }

  void editName(String newName) {
    this._taskName = newName;
    this._lastEditedDate = DateTime.now();
  }

  void editCategory(String newCategory) {
    this._category = newCategory;
    this._lastEditedDate = DateTime.now();
  }

  void editDeadLine(DateTime newDeadLine) {
    this._deadLine = newDeadLine;
    this._lastEditedDate = DateTime.now();
  }

  void editImportance(Importance newImportance) {
    this._taskImportance = newImportance;
    this._lastEditedDate = DateTime.now();
  }

  void editStatus(taskStatus newStatus) {
    this._status = newStatus;
    this._lastEditedDate = DateTime.now();
  }

  void pauseTask() {
    this._status = taskStatus.paused;
    this._pauseDate = DateTime.now();
    this._lastEditedDate = DateTime.now();
  }

  void startTask() {
    this._status = taskStatus.inProgress;
    this._startDate = DateTime.now();
    this._lastEditedDate = DateTime.now();
  }

  void resumeTask() {
    this._status = taskStatus.inProgress;
    this._startDate = DateTime.now();
    this._lastEditedDate = DateTime.now();
  }

  void markTaskAsComplete() {
    this._status = taskStatus.completed;
    this._completeDate = DateTime.now();
    this._progressPercentage = 100;
    this._lastEditedDate = DateTime.now();
  }

  void editDescription(String newDescription) {
    this._description = newDescription;
    this._lastEditedDate = DateTime.now();
  }

  void updateProgress(int precentage) {
    if (precentage >= 0 && precentage <= 100) {
      this._progressPercentage = precentage;
      if (precentage == 100) {
        this.markTaskAsComplete();
      }
      this._lastEditedDate = DateTime.now();
    }
  }

  void addTimeSpent(Duration duration) {
    this._timeSpent += duration;
    this._lastEditedDate = DateTime.now();
  }

  void updateTimeSpent(int hours, int minutes) {
    this._timeSpent = Duration(hours: hours, minutes: minutes);
    this._lastEditedDate = DateTime.now();
  }

  void addEstimation(Duration duration) {
    this._estimatedTime = duration;
    this._lastEditedDate = DateTime.now();
  }

  void addTag(String newTag) {
    this._tags.add(newTag);
    this._lastEditedDate = DateTime.now();
  }

  void clearTags() {
    this._tags.clear();
    this._lastEditedDate = DateTime.now();
  }

  void setTags(List newTags) {
    this._tags.clear();
    this._tags.addAll(newTags.cast<String>());
    this._lastEditedDate = DateTime.now();
  }

  void addSubTask(Task newTask) {
    this._subTasks.add(newTask);
    this._lastEditedDate = DateTime.now();
  }

  void clearSubTasks() {
    this._subTasks.clear();
    this._lastEditedDate = DateTime.now();
  }

  void setSubTasks(List<Task> subTasks) {
    this._subTasks.clear();
    this._subTasks.addAll(subTasks);
    this._lastEditedDate = DateTime.now();
  }

  void addReminder(DateTime newReminder) {
    this._reminders!.add(newReminder);
    this._lastEditedDate = DateTime.now();
  }

  void clearReminders() {
    this._reminders!.clear();
    this._lastEditedDate = DateTime.now();
  }

  void addReminders(List<DateTime> newReminders) {
    this._reminders!.addAll(newReminders);
    this._lastEditedDate = DateTime.now();
  }

  void setReminders(List<DateTime> newReminders) {
    this._reminders!.clear();
    this._reminders = newReminders;
    this._lastEditedDate = DateTime.now();
  }

  void addComment(String newComment) {
    this._comments![DateTime.now()] = newComment;
    this._lastEditedDate = DateTime.now();
  }

  void clearComments() {
    this._comments!.clear();
    this._lastEditedDate = DateTime.now();
  }

  void addComments(List<Map<DateTime, String>> newComments) {
    for (var x in newComments) {
      this._comments!.addAll(x);
    }
    this._lastEditedDate = DateTime.now();
  }

  void setComments(Map<DateTime, String> newComments) {
    this._comments = newComments;
    this._lastEditedDate = DateTime.now();
  }

  void assignTo(String personName, {String? assignedBy}) {
    this._assignedTo = personName;
    this._assignedDate = DateTime.now();
    this._assignedBy = assignedBy;
    this._lastEditedDate = DateTime.now();
  }

  void unassign() {
    this._assignedTo = null;
    this._assignedDate = null;
    this._assignedBy = null;
    this._lastEditedDate = DateTime.now();
  }

  String get taskName {
    return _taskName;
  }

  DateTime get addDate {
    return _addDate;
  }

  String? get category {
    return _category;
  }

  DateTime? get deadLine {
    return _deadLine;
  }

  taskStatus? get status {
    return _status;
  }

  DateTime? get completeDate {
    return _completeDate;
  }

  DateTime? get startDate {
    return _startDate;
  }

  DateTime? get pauseDate {
    return _pauseDate;
  }

  DateTime? get lastEditedDate {
    return _lastEditedDate;
  }

  List<String> get tags {
    return _tags;
  }

  String? get description {
    return _description;
  }

  int get progressPercentage {
    return _progressPercentage;
  }

  Duration get estimatedTime {
    return _estimatedTime;
  }

  Duration get timeSpent {
    return _timeSpent;
  }

  List<Task> get subTasks {
    return _subTasks;
  }

  List<DateTime>? get reminders {
    return this._reminders;
  }

  Recurrence? get recurrence {
    return this._recurrence;
  }

  String? get assignedTo {
    return this._assignedTo;
  }

  DateTime? get assignedDate {
    return this._assignedDate;
  }

  String? get assignedBy {
    return this._assignedBy;
  }

  Map<String, dynamic> toMap() {
    return {
      "taskName": this._taskName,
      "addDate": this._addDate,
      "category": this._category,
      "taskImportance": this._taskImportance,
      "deadLine": this._deadLine,
      "status": this._status,
      "completeDate": this._completeDate,
      "startDate": this._startDate,
      "pauseDate": this._pauseDate,
      "lastEditedDate": this._lastEditedDate,
      "description": this._description,
      "progressPercentage": this._progressPercentage,
      "estimatedTimeSeconds": this._estimatedTime.inSeconds,
      "timeSpentSeconds": this._timeSpent.inSeconds,
      "tags": this._tags,
      "assignedTo": this._assignedTo,
      "assignedDate": this._assignedDate,
      "assignedBy": this._assignedBy,
    };
  }
}

void main() {
  // Task Class Test
  Task task = Task(
    name: "صلاة المغرب",
    taskImportance: Importance.ImportantAndNeccesry,
    deadLine: DateTime(2029, 9, 9),
  );
  print(task.taskName);
}
