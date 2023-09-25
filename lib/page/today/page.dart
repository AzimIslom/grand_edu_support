part of 'imports.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodayVM>(
      create: (_) => TodayVM(),
      child: Consumer<TodayVM>(
        builder: (context, TodayVM vm, _) {
          return Scaffold(
            body: vm.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : vm.today.isEmpty
                    ? Center(
                        child: Lottie.asset(
                          "assets/icons/empty.json",
                          repeat: false,
                        ),
                      )
                    : SafeArea(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          itemCount: vm.today.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (_, int index) {
                            final al = vm.today[index];
                            return _Item(
                              al: al,
                              mask: vm.mask,
                            );
                          },
                        ),
                      ),
          );
        },
      ),
    );
  }
}
