import 'base_tts.dart';
import 'offline_tts.dart';
import 'online_tts.dart';

class TTSManager {
  static late BaseTTS _tts;
  static bool isVietnameseAvailable = false;

  static Future<void> init() async {
    final offlineTTS = OfflineTTS();
    await offlineTTS.init();
    isVietnameseAvailable = offlineTTS.isVietnameseAvailable;
    if (offlineTTS.isVietnameseAvailable) {
      _tts = offlineTTS;
    } else {
      // debugPrint(
      //     'Offline TTS doesn\'t support Vietnamese - Fallback to GoogleOnlineTTS');
      final googleTTS = OnlineTTS();
      await googleTTS.init();
      _tts = googleTTS;
    }
  }

  static Future<void> speak(String text) async {
    await _tts.speak(text);
  }

  static Future<void> stop() async {
    await _tts.stop();
  }
}
