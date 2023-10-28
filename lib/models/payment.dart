import 'package:cloud_firestore/cloud_firestore.dart';

class Payment {
  final String id;
  final List<PaymentDescription> paymentDescription;

  Payment({
    required this.id,
    required this.paymentDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'paymentModel': List<dynamic>.from(paymentDescription.map((e) => e.toJson()).toList()),
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id'] as String,
      paymentDescription: List<PaymentDescription>.from(map["grades"].map((x) => PaymentDescription.fromJson(map))),
    );
  }
}

class PaymentDescription {

  final String refNumber;
  final String status;
  final String amount;
  final Timestamp dateTime;

  PaymentDescription({
    required this.refNumber,
    required this.status,
    required this.amount,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'refNumber': refNumber,
      'status': status,
      'amount': amount,
      'dateTime': dateTime,
    };
  }

  factory PaymentDescription.fromJson(Map<String, dynamic> map) {
    return PaymentDescription(
      refNumber: map['refNumber'] as String,
      status: map['status'] as String,
      amount: map["amount"] as String,
      dateTime: Timestamp.fromMillisecondsSinceEpoch(map['dateTime']),
    );
  }
}