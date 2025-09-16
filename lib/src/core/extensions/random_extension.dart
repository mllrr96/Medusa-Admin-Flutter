import 'dart:math';

extension RandomOfDigits on Random {
  /// Generates a non-negative random integer with a specified number of digits.
  ///
  /// Supports [digitCount] values between 1 and 9 inclusive.
  int nextIntOfDigits(int digitCount) {
    assert(1 <= digitCount && digitCount <= 9);
    int min = digitCount == 1 ? 0 : pow(10, digitCount - 1).round();
    int max = pow(10, digitCount).round();
    return min + nextInt(max - min);
  }

  String getRandomString(int length) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(nextInt(chars.length))));
  }
}
