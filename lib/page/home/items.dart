part of 'imports.dart';

class _BNB extends StatelessWidget {
  const _BNB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
      builder: (context, HomeVM vm, _) {
        return FlashyTabBar(
          selectedIndex: vm.currentIndex,
          height: 55,
          backgroundColor: kPrimaryLightColor,
          showElevation: true,
          onItemSelected: vm.changeIndex,
          iconSize: 20,
          items: [
            // FlashyTabBarItem(
            //   icon: Image.asset(
            //     "assets/icons/feedback.png",
            //     height: 35,
            //   ),
            //   title: Text(lan(t.task)),
            // ),
            FlashyTabBarItem(
              icon: Image.asset(
                "assets/icons/date.png",
                height: 35,
              ),
              title: Text(lan(t.table)),
            ),
            FlashyTabBarItem(
              icon: Image.asset(
                "assets/icons/feedback.png",
                height: 35,
              ),
              title: Text(lan(t.feedback)),
            ),
          ],
        );
      },
    );
  }
}
