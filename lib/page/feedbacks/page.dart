part of 'imports.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FeedbackVM>(
      create: (_) => FeedbackVM(),
      child: Consumer<FeedbackVM>(
        builder: (context, FeedbackVM vm, _) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: vm.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      )
                    : Column(
                        children: [
                          _Top(
                            controller: tabController,
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: TabBarView(
                              physics: const BouncingScrollPhysics(),
                              controller: tabController,
                              children: [
                                vm.feedbacks.isEmpty
                                    ? Center(
                                        child: Lottie.asset(
                                          "assets/icons/empty.json",
                                          repeat: false,
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount: vm.feedbacks.length,
                                        itemBuilder: (_, int index) {
                                          final af = vm.feedbacks[index];
                                          return _Item(
                                            af: af,
                                            mask: vm.mask,
                                            onTap: (val) {
                                              vm.onTap(val, af).then((value) {
                                                Navigator.pop(context);
                                              });
                                            },
                                          );
                                        },
                                      ),
                                vm.saved.isEmpty
                                    ? Center(
                                        child: Lottie.asset(
                                          "assets/icons/empty.json",
                                          repeat: false,
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount: vm.saved.length,
                                        itemBuilder: (_, int index) {
                                          final af = vm.saved[index];
                                          return _Saved(
                                            af: af,
                                            mask: vm.mask,
                                            onTap: (val) {
                                              vm.deleteSaved(val, af).then((value) {
                                                Navigator.pop(context);
                                              });
                                            },
                                          );
                                        },
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
