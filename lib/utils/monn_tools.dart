class MonnTools {
  const MonnTools._();

  static String toKebabCase(String str) {
    return str.replaceAllMapped(
      RegExp('[A-Z]+(?![a-z])|[A-Z]'),
      (m) => (m.start > 0 ? '-' : '') + m.group(0)!.toLowerCase(),
    );
  }
}
