import 'dart:math';

String generateRandomString(int length) {
  const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => charset.codeUnitAt(random.nextInt(charset.length))));
}