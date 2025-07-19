class Transaction {
  final String recipient;
  final double amount;
  final String currency;
  final DateTime timestamp;

  Transaction({
    required this.recipient,
    required this.amount,
    required this.currency,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'recipient': recipient,
        'amount': amount,
        'currency': currency,
        'timestamp': timestamp.toIso8601String(),
      };

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        recipient: json['recipient'],
        amount: json['amount'],
        currency: json['currency'],
        timestamp: DateTime.parse(json['timestamp']),
      );
}
