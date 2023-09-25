part of 'imports.dart';

class HomeVM extends ChangeNotifier {
  int currentIndex = 1;
  bool isLoading = false;

  HomeVM();

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
