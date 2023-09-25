part of 'imports.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskVM>(
      create: (_) => TaskVM(),
      child: Consumer<TaskVM>(
        builder: (context, TaskVM vm, _) {
          return Consumer<TaskVM>(
            builder: (context, TaskVM vm, _) {
              return Scaffold(
                body: SafeArea(
                  child: ListView.builder(
                    itemCount: vm.tasks.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    itemBuilder: (_, int index) {
                      final task = vm.tasks[index];
                      return _Item(task: task);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
