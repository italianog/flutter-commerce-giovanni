class Coupon {
  final String id;
  final double amount;
  final String amountType;

  const Coupon({
    required this.id,
    required this.amount,
    required this.amountType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'amountType': amountType,
    };
  }

  factory Coupon.fromMap(Map<String, dynamic> map) {
    return Coupon(
      id: map['id'],
      amount: map['amount'],
      amountType: map['amountType'],
    );
  }
}
