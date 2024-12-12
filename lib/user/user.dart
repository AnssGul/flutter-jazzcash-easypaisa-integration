class User {
  final String id;
  bool hasPaidInitialFee;
  double balance;
  DateTime lastWithdrawalDate;

  User({
    required this.id,
    this.hasPaidInitialFee = false,
    this.balance = 0.0,
    required this.lastWithdrawalDate,
  });
}
