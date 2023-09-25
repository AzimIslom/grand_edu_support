part of 'imports.dart';

class FeedbackVM extends ChangeNotifier {
  List<AfterModel> feedbacks = [];
  List<AfterModel> saved = [];
  final mask = MaskTextInputFormatter(
    mask: '## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
    initialText: "",
  );
  bool isLoading = false;

  FeedbackVM() {
    init();
  }

  Future<void> onTap(bool val, AfterModel feedback) async {
    _();
    await fb.deleteFeedback(feedback);
    feedbacks.removeWhere((element) => element.id == feedback.id);
    if (val) {
      await fb.saveWorking(feedback);
      saved.add(feedback);
    }
    _();
  }

  Future<void> deleteSaved(bool __, AfterModel after) async {
    _();
    await fb.deleteSave(after);
    saved.removeWhere((element) => element.id == after.id);
    _();
  }

  void init() async {
    _();
    feedbacks = await fb.feedbacks();
    // feedbacks.add(feedbacks.first);
    saved = await fb.working();
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
