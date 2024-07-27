import 'package:authentication_kyc/base_app/views_base/base_widget.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/nfc_kyc/controllers/video_scan_nfc_controller.dart';
import 'package:authentication_kyc/shares/package/export_package.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScanNfcPage extends BaseGetWidget {
  const VideoScanNfcPage({Key? key}) : super(key: key);

  @override
  VideoScanNfcController get controller => Get.put(VideoScanNfcController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 230,
          child: Center(
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                width: 300,
                onEnded: (metaData) {
                  controller.videoPlayerController.seekTo(Duration.zero);
                  controller.videoPlayerController.pause();
                },
                controller: controller.videoPlayerController,
                showVideoProgressIndicator: true,
              ),
              builder: (context, player) {
                return SizedBox();
              },
            ),
          ),
        ),
      ],
    );
  }
}
