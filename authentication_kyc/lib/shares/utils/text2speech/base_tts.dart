abstract class BaseTTS {
  Future<void> speak(String text);
  Future<void> stop();
}
