import 'dart:io';

import 'package:easy_ca/base_app/base_app.src.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScanNfcController extends BaseGetxController {
  late YoutubePlayerController videoPlayerController;

  @override
  void onInit() {
    String videoId = '';

    if (Platform.isAndroid) {
      videoId = 'QrWFx-uWrRE';
    } else {
      videoId = 'RxS_smXZsVI';
    }

    videoPlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        // mute: false,
        controlsVisibleAtStart: false, // Ẩn điều khiển khi bắt đầu
        disableDragSeek: true, // Vô hiệu hóa kéo để tua
      ),
    );
    super.onInit();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
