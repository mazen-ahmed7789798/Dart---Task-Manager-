import 'package:uuid/uuid.dart';
import 'dart:convert';

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
  String taskId = Uuid().v4();
  late String _taskName;
  DateTime _addDate = DateTime.now();
  String? _description;
  String? _category;
  Importance _taskImportance = Importance.ImportantAndNeccesry;
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
  Task(
    String name, {
    String? category,
    taskStatus status = taskStatus.notStarted,
    Importance taskImportance = Importance.ImportantAndNeccesry,
    DateTime? deadLine,
    List<String>? tags,
    String? relatedTopics,
    String? description,
    List<DateTime>? reminders,
    Recurrence? reccurrence,
    Map<DateTime, String>? comments,
    DateTime? completeDate,
    DateTime? startDate,
    DateTime? pauseDate,
    int? progressPercentage,
    Duration? estimatedTime,
    Duration? timeSpent,
    List<Task>? subTasks,
    String? assignedTo,
    String? assignedBy,
  }) {
    this._deadLine = deadLine ?? DateTime.now();
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
    this._completeDate = completeDate;
    this._startDate = startDate;
    this._pauseDate = pauseDate;
    this._progressPercentage = progressPercentage ?? 0;
    this._estimatedTime = estimatedTime ?? Duration.zero;
    this._timeSpent = timeSpent ?? Duration.zero;
    this._subTasks = subTasks ?? [];
    this._assignedTo = assignedTo;
    this._assignedBy = assignedBy;
  }

  // Setters
  set setTaskName(String name) {
    this._taskName = name;
  }

  set setAddDate(DateTime addDate) {
    this._addDate = addDate;
  }

  set setDescription(String? description) {
    this._description = description;
  }

  set setCategory(String? category) {
    this._category = category;
  }

  set setTaskImportance(Importance? importance) {
    this._taskImportance = importance ?? this.taskImportance;
  }

  set setDeadLine(DateTime deadLine) {
    this._deadLine = deadLine;
  }

  set setStatus(taskStatus? status) {
    this._status = status;
  }

  set setCompleteDate(DateTime? completeDate) {
    this._completeDate = completeDate;
  }

  set setStartDate(DateTime? startDate) {
    this._startDate = startDate;
  }

  set setPauseDate(DateTime? pauseDate) {
    this._pauseDate = pauseDate;
  }

  set setLastEditedDate(DateTime? lastEditedDate) {
    this._lastEditedDate = lastEditedDate;
  }

  set setTags(List<String> tags) {
    this._tags = tags;
  }

  set setProgressPercentage(int percentage) {
    this._progressPercentage = percentage;
  }

  set setEstimatedTime(Duration estimatedTime) {
    this._estimatedTime = estimatedTime;
  }

  set setTimeSpent(Duration timeSpent) {
    this._timeSpent = timeSpent;
  }

  set setSubTasks(List<Task> subTasks) {
    this._subTasks = subTasks;
  }

  set setReminders(List<DateTime>? reminders) {
    this._reminders = reminders;
  }

  set setRecurrence(Recurrence? recurrence) {
    this._recurrence = recurrence;
  }

  set setComments(Map<DateTime, String>? comments) {
    if (comments != null) {
      this._comments = _comments;
    }
  }

  set assignedTo(String? assignedTo) {
    this._assignedTo = assignedTo;
  }

  set assignedDate(DateTime? assignedDate) {
    this._assignedDate = assignedDate;
  }

  set assignedBy(String? assignedBy) {
    this._assignedBy = assignedBy;
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

  Importance? get taskImportance {
    return _taskImportance;
  }

  Map<String, dynamic> toMap() {
    return {
      'taskId': this.taskId,
      "taskName": this._taskName,
      "addDate": this._addDate,
      "category": this._category,
      "taskImportance": this._taskImportance,
      "deadLine": this._deadLine?.toIso8601String(),
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

  factory Task.fromJson(Map<String, dynamic> json) {
    try {
      return Task(
        json['taskName'],
        category: json['category'] ?? null,
        taskImportance: json['taskImportance'],
        deadLine: DateTime.parse(json['deadLine']),
        tags: List<String>.from(json['tags']),
        description: json['description'],
      );
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
