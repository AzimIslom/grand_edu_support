class TaskModel {
  late String to;
  late String by;
  late DateTime time;
  late DateTime deadline;
  late String task;
  late String cat;
  late int priority;
  late String id;

  TaskModel({
    required this.by,
    required this.id,
    required this.to,
    required this.time,
    required this.cat,
    required this.deadline,
    required this.priority,
    required this.task,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    id = json['id'];
    to = json['to'];
    time = DateTime.parse(json['time']);
    cat = json['cat'];
    deadline = DateTime.parse(json['deadline']);
    priority = json['priority'];
    task = json['task'];
  }

  Map<String, dynamic> toJson() => {
        'by': by,
        'id': id,
        'to': to,
        'time': time.toIso8601String(),
        'cat': cat,
        'deadline': deadline.toIso8601String(),
        'priority': priority,
        'task': task,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
