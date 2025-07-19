import 'package:flutter/material.dart';
import '../utils/transaction_service.dart';
import '../widgets/styled_card.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = TransactionService.getHistory();

    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History')),
      body: transactions.isEmpty
          ? const Center(
              child: Text(
                'No transactions yet.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: transactions.length,
              itemBuilder: (_, index) {
                final tx = transactions[index];
                return StyledCard(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recipient: ${tx.recipient}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Amount: ${tx.amount} ${tx.currency}'),
                      Text(
                        'Date: ${tx.timestamp.toLocal().toString().split(".")[0]}',
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
