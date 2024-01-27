extension AppUpdateExtension on String {
  bool higherThan(String other) {
    final latestVersion = int.tryParse(replaceAll(RegExp(r'[^0-9]'), ''));
    final currentVersion =
        int.tryParse(other.replaceAll(RegExp(r'[^0-9]'), ''));
    if (currentVersion != null && latestVersion != null) {
      return latestVersion > currentVersion;
    } else {
      return false;
    }
  }
}
