import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'base_tts.dart';

class OfflineTTS implements BaseTTS {
  final tts = FlutterTts();

  bool _isVietnameseAvailable = false;

  bool get isVietnameseAvailable => _isVietnameseAvailable;

  Future<void> init() async {
    final languages = await tts.getLanguages;
    _isVietnameseAvailable = languages.contains('vi-VN');
    if (_isVietnameseAvailable) {
      await _setAwaitOptions();
      await tts.setLanguage('vi-VN');
      await tts.setVolume(1.0);
      await tts.setSpeechRate(0.5);

      if (isIOS) {
        await _initIOS();
      }
    }
  }

  Future<void> _setAwaitOptions() async {
    await tts.awaitSpeakCompletion(true);
  }

  bool get isIOS => !kIsWeb && Platform.isIOS;

  Future<void> _initIOS() async {
    // REF: https://stackoverflow.com/a/76955306/15424249
    await tts.setSharedInstance(true);
    await tts.setIosAudioCategory(
      IosTextToSpeechAudioCategory.ambient,
      [
        IosTextToSpeechAudioCategoryOptions.allowBluetooth,
        IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
        IosTextToSpeechAudioCategoryOptions.mixWithOthers,
        IosTextToSpeechAudioCategoryOptions.defaultToSpeaker
      ],
      IosTextToSpeechAudioMode.voicePrompt,
    );
  }

  @override
  Future<void> speak(String text) async {
    if (_isVietnameseAvailable) {
      await tts.speak(text);
    }
  }

  @override
  Future<void> stop() {
    return tts.stop();
  }
}
