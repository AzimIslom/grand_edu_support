part of 'imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeVM>(
      create: (_) => HomeVM(),
      child: Scaffold(
        backgroundColor: c.white,
        // appBar: AppBar(),
        body: Consumer<HomeVM>(
          builder: (context, HomeVM vm, _) {
            return [
              // const TaskPage(),
              const TodayPage(),
              const FeedbackPage(),
            ][vm.currentIndex];
          },
        ),
        bottomNavigationBar: const _BNB(),
      ),
    );
  }
}
