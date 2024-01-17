extension ListEquals on List<String> {
  bool listEquals(List<String> b) {
    if (length != b.length) {
      return false;
    }
    final a = toSet().toList();
    final bSorted = b.toSet().toList();
    for (int index = 0; index < a.length; index += 1) {
      if (a[index] != bSorted[index]) {
        return false;
      }
    }
    return true;
  }
}
