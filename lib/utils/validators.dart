String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a recipient name';
  }
  return null;
}

String? validateAmount(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an amount';
  }
  final amount = double.tryParse(value);
  if (amount == null || amount <= 0) {
    return 'Enter a valid positive number';
  }
  return null;
}
