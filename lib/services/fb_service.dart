import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grand_edu_support/models/after_model.dart';
import 'package:grand_edu_support/models/feedback_model.dart';
import 'package:grand_edu_support/models/support_model.dart';
import 'package:grand_edu_support/models/task_model.dart';
import 'package:grand_edu_support/services/auth_service.dart';
import '../models/additional_lesson_model.dart';
import '../models/reception_model.dart';
import '../models/student_model.dart';
import '../models/teacher_model.dart';
import '../utils/api.dart';

final fb = FBService();
final _fb = FirebaseFirestore.instance;

class FBService {
  //*********************************************
  //*********************************************
  //*********************************************
  //*********************************************
  //*********************************************
  ///add

  //*********************************************
  //*********************************************
  //*********************************************
  //*********************************************
  //*********************************************
  ///special
  Future<SupportModel> speSupport(String id) async {
    try {
      final json = await _fb.collection(api.apiSupports).doc(id).get();
      final reception = SupportModel.fromJson(json.data()!);
      return reception;
    } catch (e) {
      return SupportModel(
        name: 'fake',
        branch: '',
        password: '',
        tel: '',
        surname: '',
      );
    }
  }

  Future<List<ALModel>> todayAl() async {
    try {
      final t = DateTime.now();
      final time = "${t.year}.${t.month}.${t.day}";
      final data =
          await _fb.collection(api.al).doc(auth.tel).collection(time).get();
      return data.docs.map((e) => ALModel.fromJson(e.data())).toList();
    } catch (e) {
      print("todaysAl: $e");
      return [];
    }
  }

  Future<List<TaskModel>> tasks() async {
    try {
      final d = await _fb
          .collection(api.task)
          .doc(api.apiReceptions)
          .collection(auth.tel)
          .get();
      return d.docs.map((e) => TaskModel.fromJson(e.data())).toList();
    } catch (e) {
      print("tasks: $e");
      return [];
    }
  }

  Future<void> doneFeedback(AfterModel after) async {
    try {
      await _fb
          .collection(api.al)
          .doc(api.feedback)
          .collection(auth.tel)
          .doc(after.id)
          .delete();
    } catch (e) {
      print('done: $e');
    }
  }

  Future<void> toWorking(AfterModel after) async {
    try {
      await _fb
          .collection(api.al)
          .doc(api.working)
          .collection(auth.tel)
          .add(after.toJson())
          .then(
        (value) async {
          after.id = value.id;
          await _fb
              .collection(api.al)
              .doc(api.working)
              .collection(auth.tel)
              .doc(after.id)
              .update(after.toJson());
        },
      );
    } catch (e) {
      print('to working');
    }
  }

  Future<List<AfterModel>> feedbacks() async {
    try {
      final res = await _fb
          .collection(api.feedback)
          .doc(auth.tel)
          .collection(auth.tel)
          .get();
      return res.docs.map((e) => AfterModel.fromJson(e.data())).toList();
    } catch (e) {
      print('feedbacks: $e');
      return [];
    }
  }

  Future<List<AfterModel>> working() async {
    try {
      final res = await _fb
          .collection(api.working)
          .doc(auth.tel)
          .collection(auth.tel)
          .get();
      return res.docs.map((e) => AfterModel.fromJson(e.data())).toList();
    } catch (e) {
      print('working: $e');
      return [];
    }
  }

  Future<void> deleteFeedback(AfterModel feedback) async {
    try {
      await _fb
          .collection(api.feedback)
          .doc(auth.tel)
          .collection(auth.tel)
          .doc(feedback.id)
          .delete();
    } catch (e) {
      print("deleteFeedback: $e");
    }
  }

  Future<void> saveWorking(AfterModel after) async {
    try {
      await _fb
          .collection(api.working)
          .doc(auth.tel)
          .collection(auth.tel)
          .doc(after.id)
          .set(after.toJson());
    } catch (e) {
      print("saveWorking: $e");
    }
  }

  Future<void> deleteSave(AfterModel after) async {
    try {
      await _fb
          .collection(api.working)
          .doc(auth.tel)
          .collection(auth.tel)
          .doc(after.id).delete();
    } catch(e) {
      print("deleteSave: $e");
    }
  }

  Future<void> doneWorking(AfterModel after) async {
    try {
      await _fb
          .collection(api.al)
          .doc(api.working)
          .collection(auth.tel)
          .doc(after.id)
          .delete();
    } catch (e) {
      print('done working');
    }
  }

//*********************************************
//*********************************************
//*********************************************
//*********************************************
//*********************************************
  ///save
  Future<void> saveSupport(SupportModel support) async {
    await _fb
        .collection(api.apiSupports)
        .doc(support.tel)
        .update(support.toJson());
  }
}
