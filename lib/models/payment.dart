import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_school/models/option.dart';

class Payment {
  final String id;
  final List<PaymentDescription> paymentDescription;

  Payment({
    required this.id,
    required this.paymentDescription,
  });

  factory Payment.fromJson(Map<String, dynamic> map) {
    return Payment(
      id: map['id'] as String,
      paymentDescription: List<PaymentDescription>.from(map["paymentModel"].map((x) => PaymentDescription.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'paymentModel': List<dynamic>.from(paymentDescription.map((e) => e.toJson()).toList()),
    };
  }


}

class PaymentDescription {

  final String refNumber;
  final String status;
  final String amount;
  final Timestamp dateTime;
  final PaymentCategory category;

  PaymentDescription({
    required this.refNumber,
    required this.status,
    required this.amount,
    required this.dateTime,
    required this.category,
  });

  factory PaymentDescription.fromJson(Map<String, dynamic> map) {
    return PaymentDescription(
      refNumber: map['refNumber'] as String,
      status: map['status'] as String,
      amount: map["amount"] as String,
      dateTime: map['dateTime'],
      category: PaymentCategory.fromJson(map["category"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refNumber': refNumber,
      'status': status,
      'amount': amount,
      'dateTime': dateTime,
      'category': category.toJson(),
    };
  }
}

class PaymentCategory {
  final int id;
  final String category;
  final String amount;

  PaymentCategory({
    required this.id,
    required this.category,
    required this.amount,
  });

  factory PaymentCategory.fromJson(Map<String, dynamic> json) {
    return PaymentCategory(
      id: json["id"],
      category: json["category"],
      amount: json["amount"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "amount": amount,
  };
}