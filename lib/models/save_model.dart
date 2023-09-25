class SaveFormulaModel {
  late DateTime time;
  late String id;

  SaveFormulaModel({
    required this.time,
    required this.id,
  });

  SaveFormulaModel.fromJson(Map<String, dynamic> json) {
    time = DateTime.parse(json['time']);
    id = json['id'];
  }

  Map<String, dynamic> toJson() => {
        'time': time.toIso8601String(),
        'id': id,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
