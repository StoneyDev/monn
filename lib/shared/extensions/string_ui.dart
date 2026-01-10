String _transformCase(String text, String symbol) {
  return text.replaceAllMapped(
    RegExp('[A-Z]+(?![a-z])|[A-Z]'),
    (m) => (m.start > 0 ? symbol : '') + m.group(0)!.toLowerCase(),
  );
}

extension StringUI on String {
  /// Ex: flatTax ➡️ flat-tax
  String toKebabCase() => _transformCase(this, '-');

  /// Ex: flatTax ➡️ flat_tax
  String toSnakeCase() => _transformCase(this, '_');

  String toCapitalize() => this[0].toUpperCase() + substring(1);
}
