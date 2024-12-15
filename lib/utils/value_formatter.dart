String formatValue(String? value) {
  if (value == null) return 'N/A';
  try {
    final doubleValue = double.parse(value);
    return doubleValue.toStringAsFixed(2).replaceAll('.', ',');
  } catch (e) {
    return 'N/A';
  }
}

String convertToBRL(String? bidUSD, String? bidBRL) {
  if (bidUSD == null || bidBRL == null) return 'N/A';
  try {
    final valueUSD = double.parse(bidUSD);
    final exchangeRate = double.parse(bidBRL);
    final convertedValue = valueUSD * exchangeRate;
    return convertedValue.toStringAsFixed(2).replaceAll('.', ',');
  } catch (e) {
    return 'N/A';
  }
}
