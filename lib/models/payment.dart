class PaymentModel {
  final String id;
  final String refNumber;
  final String status;
  final double amount;

  PaymentModel({
    required this.id,
    required this.refNumber,
    required this.status,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'refNumber': refNumber,
      'status': status,
      'amount': double.parse(amount.toString()),
    };
  }

  factory PaymentModel.fromJson(Map<String, dynamic> map) {
    return PaymentModel(
      id: map['id'] as String,
      refNumber: map['refNumber'] as String,
      status: map['status'] as String,
      amount: double.parse(map["amount"].toString()),
    );
  }
}