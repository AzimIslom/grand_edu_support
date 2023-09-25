part of 'imports.dart';

class TaskVM extends ChangeNotifier {
  List<TaskModel> tasks = [];

  TaskVM() {
    init();
  }

  void init() async {
    tasks = List.generate(
      10,
      (index) => TaskModel(
        by: '990330919',
        id: 'id',
        to: 'to',
        time: faker.date.dateTime(),
        cat: faker.lorem.words(3).join(' '),
        deadline: faker.date.dateTime(),
        priority: 2,
        task: faker.lorem.sentences(2).join(' '),
      ),
    );
    notifyListeners();
  }
}
