import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

import 'base_tts.dart';

class OnlineTTS implements BaseTTS {
  final _audioPlayer = AudioPlayer();

  final uri = Uri.parse(
      'https://translate.google.com/_/TranslateWebserverUi/data/batchexecute');

  final headers = {
    'Host': 'translate.google.com',
    'user-agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Safari/537.36 Edg/89.0.774.68',
    'content-type': 'application/x-www-form-urlencoded; charset=utf-8'
  };

  Future<void> init() async {
    // Max volume
    await _audioPlayer.setVolume(1.0);
    // Tăng tốc độ phát vì giọng đọc của Google translate chậm hơn so với khi dùng flutter tts
    await _audioPlayer.setSpeed(1.2);
    // await _audioPlayer.setPlayerMode(PlayerMode.lowLatency); // ByteSource not supported in lowLatency mode
  }

  Future<String?> _getBase64Audio(String text) async {
    try {
      final rawData =
          '[[["jQ1olc","[\\"$text\\",\\"vi\\",null,\\"null\\"]",null,"generic"]]]';
      final encodedData = "f.req=${Uri.encodeComponent(rawData)}";

      final response = await http.post(
        uri,
        headers: headers,
        body: encodedData,
      ).timeout(const Duration(seconds: 5));

      if (response.statusCode != 200) {
        return null;
      }

      final pattern = RegExp(r'jQ1olc","\[\\"(.*)\\"]');
      final lines = response.body.split('\n');
      for (final line in lines) {
        final match = pattern.firstMatch(line);
        if (match != null) {
          final data = match.group(1);
          return data;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> speak(String text) async {
    // NOTE: Hiện tại không phát được text dài
    final audio = await _getBase64Audio(text);
    if (audio != null) {
      // https://pub.dev/packages/just_audio#platform-specific-configuration
      await _audioPlayer.setAudioSource(
        MyCustomSource(base64.decode(audio)),
      );
      await _audioPlayer.play();
    } else {
      debugPrint('Failed to get audio');
    }
  }

  @override
  Future<void> stop() {
    return _audioPlayer.stop();
  }
}

class MyCustomSource extends StreamAudioSource {
  final Uint8List bytes;
  MyCustomSource(this.bytes);

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    start ??= 0;
    end ??= bytes.length;
    return StreamAudioResponse(
      sourceLength: bytes.length,
      contentLength: end - start,
      offset: start,
      stream: Stream.value(bytes.sublist(start, end)),
      contentType: 'audio/wav',
    );
  }
}
