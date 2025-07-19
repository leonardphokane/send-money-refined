import '../models/transaction_model.dart';

class TransactionService {
  static final List<Transaction> _transactions = [];

  static void processTransaction(Transaction tx) {
    _transactions.add(tx);
    // Future: Send to API, log to device, track analytics
    print('Processed Transaction: ${tx.recipient} - ${tx.amount} ${tx.currency}');
  }

  static List<Transaction> getHistory() => List.unmodifiable(_transactions);
}
