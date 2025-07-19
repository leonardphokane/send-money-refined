import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transaction_model.dart';

class TransactionStorage {
  static const _key = 'transactions';

  static Future<void> save(Transaction tx) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    list.add(jsonEncode(tx.toJson()));
    await prefs.setStringList(_key, list);
  }

  static Future<List<Transaction>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    return list.map((str) => Transaction.fromJson(jsonDecode(str))).toList();
  }
}
