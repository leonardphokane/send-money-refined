import 'package:flutter/material.dart';
import '../widgets/send_button.dart';
import '../widgets/styled_card.dart';
import '../utils/validators.dart';
import '../utils/transaction_service.dart';
import '../models/transaction_model.dart';
// import '../animations/success_animation.dart'; // Optional

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final _formKey = GlobalKey<FormState>();
  String _recipient = '';
  double _amount = 0;
  String _selectedCurrency = 'ZAR';

  void _handleTransaction() {
    final newTransaction = Transaction(
      recipient: _recipient,
      amount: _amount,
      currency: _selectedCurrency,
      timestamp: DateTime.now(),
    );

    TransactionService.processTransaction(newTransaction);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Colors.transparent,
        child: StyledCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recipient: $_recipient',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Amount: $_amount $_selectedCurrency',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              const Text(
                'Transaction Successful!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Money')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Recipient Name',
                  border: OutlineInputBorder(),
                ),
                validator: validateName,
                onSaved: (value) => _recipient = value ?? '',
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: validateAmount,
                onSaved: (value) => _amount = double.tryParse(value!) ?? 0,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCurrency,
                decoration: const InputDecoration(
                  labelText: 'Currency',
                  border: OutlineInputBorder(),
                ),
                items: ['ZAR', 'USD', 'EUR', 'GBP', 'KES'].map((currency) {
                  return DropdownMenuItem(
                    value: currency,
                    child: Text(currency),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCurrency = value!;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a currency' : null,
              ),
              const SizedBox(height: 24),
              SendButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _handleTransaction();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
