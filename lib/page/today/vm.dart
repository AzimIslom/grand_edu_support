part of 'imports.dart';

class TodayVM extends ChangeNotifier {
  List<ALModel> today = [];
  bool isLoading = false;
  final mask = MaskTextInputFormatter(
      mask: '## ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: "");

  TodayVM() {
    init();
  }

  void init() async {
    _();
    today = await fb.todayAl();
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
