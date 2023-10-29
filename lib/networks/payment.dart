import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/payment.dart';


class PaymentDB extends ChangeNotifier {

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<Payment>>? paymentModelStream;

  Stream<List<Payment>> getPaymentModelStream() {
    return db.collection("payment").snapshots().map(_paymentModelFromSnapshots);
  }

  List<Payment> _paymentModelFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((docs) {
      final data = docs.data() as Map<String, dynamic>;

      final payment = Payment.fromMap(data);


      return payment;
    }).toList();
  }

  void updatePaymentModelStream() {
    paymentModelStream = getPaymentModelStream();
    notifyListeners();
  }

  Stream<ApplicationInfo>? studentStream;

  Stream<ApplicationInfo> getStudentStream(String id) {
    return db.collection("student").doc(id).snapshots().map(_studentFromSnapshot);
  }

  ApplicationInfo _studentFromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return ApplicationInfo.fromJson(data);
  }

  void updateStudentStream({
    required String id,
  }) {
    studentStream = getStudentStream(id);
    notifyListeners();
  }

  String? statusPayment;

  Future<void> updatePaymentStatus(BuildContext context, {
    required String status,
    required String id,
  }) async {
    await db.collection("payment").doc(id).set({
      "status": status,
    }, SetOptions(merge: true)).then((value) {
      context.popRoute();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Success!"),
      ));
    });

    notifyListeners();
  }

  static TextEditingController referenceText = TextEditingController();
  static GlobalKey<FormFieldState> referenceKey = GlobalKey();


  static TextEditingController amountText = TextEditingController();
  static GlobalKey<FormFieldState> amountKey = GlobalKey();

  Future<void> updateStudentPayment(BuildContext context, String id) async {

    final PaymentDescription paymentInfo = PaymentDescription(
      refNumber: referenceText.text,
      status: "pending",
      amount: amountText.text,
      dateTime: Timestamp.fromDate(DateTime.now()),
    );

    final Payment payment = Payment(
      id: id,
      paymentDescription: [paymentInfo],
    );

    await db.collection("payment").doc(id).set(payment.toMap()).then((value) {
      context.popRoute();
      clearPaymentText();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Success!"),
      ));
    });
  }

  void clearPaymentText() {

    referenceText.clear();
    amountText.clear();
  }

  Stream<List<PaymentDescription>>? studentPaymentStream;

  Stream<List<PaymentDescription>> getStudentPaymentStream(String id) {

    return db.collection("payment").doc(id).snapshots().map(_studentPaymentFromSnapshots);
  }

  List<PaymentDescription> _studentPaymentFromSnapshots(DocumentSnapshot doc) {

    try {
      final data = doc.data() as Map<String, dynamic>;

      return (data["paymentModel"] as List).map((e) => PaymentDescription.fromJson(e)).toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }


  }

  void updateStudentPaymentStream({
    required String id,
  }) {
    studentPaymentStream = getStudentPaymentStream(id);
    notifyListeners();
  }
}