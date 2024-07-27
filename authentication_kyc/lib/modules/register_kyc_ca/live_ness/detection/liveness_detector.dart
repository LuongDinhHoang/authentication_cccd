import 'package:authentication_kyc/generated/locales.g.dart';
import 'package:authentication_kyc/modules/register_kyc_ca/live_ness/live_ness_kyc.src.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class LiveNessDetector {
  LiveNessDetector(
    this.faces,
    this.eyeOpenRightOld,
    this.eyeOpenLeftOld,
    // this.rotation,
  );

  //#region Khởi tạo giá trị
  // var onlyone = 1;
  // var _isReadyLivenessDetection = false;
  var _action = "";
  double eyeOpenRightOld;
  double eyeOpenLeftOld;

  // var counter_center_frames = 0;
  // var limit_center_franes = 10;
  // var isFaceDetected = false;
  // var isFaceTracking = false;
  final List<Face> faces;

  // final InputImageRotation rotation;
  // Trả về hành động của khuôn mặt người dùng
  LiveNessDetectionData getUserAction(String type) {
    Face face = faces[0];
    if (face.headEulerAngleX == null || face.headEulerAngleY == null) {
      return LiveNessDetectionData(question: '', percentSmile: 0.0);
    }
    // var roll_angle = face
    //     .headEulerAngleZ!; //(180.0 * (face.headEulerAngleZ! / 3.14));// Y Axis
    var pitchAngle = face
        .headEulerAngleX!; //(180.0 * (face.headEulerAngleX! / 3.14));// X Axis
    var yawAngle = face
        .headEulerAngleY!; //(180.0 * (face.headEulerAngleY! / 3.14));// Z Axis
    // print("$roll_angle  $pitch_angle  $yaw_angle");
    // if (pitch_angle < 0)
    //   pitch_angle += 180;
    // else
    //   pitch_angle += -180;
    double percentSmile = face.smilingProbability ?? 0;
    double eyeOpenRightNow = face.rightEyeOpenProbability ?? 0;
    double eyeOpenLeftNow = face.leftEyeOpenProbability ?? 0;
    // print("type---${type}");
    // print("pitchAngleTrenDuoi---$pitchAngle");
    // print("yawAngleTraiPhai---$yawAngle");

    // print("hhhh--$z");


    if (type == LocaleKeys.live_ness_faceSmile.tr) {
      if (percentSmile > 0.7) {
        _action = LocaleKeys.live_ness_actionFaceSmile.tr;
      }
    } else if (type == LocaleKeys.live_ness_faceOpen.tr) {
      if ((eyeOpenRightNow - eyeOpenRightOld > 0.9) ||
          (eyeOpenLeftNow - eyeOpenLeftOld > 0.9)) {
        _action = LocaleKeys.live_ness_actionFaceBlink.tr;
      }
    } else if (-10 < yawAngle &&
        yawAngle < 10 &&
        -10 < pitchAngle &&
        pitchAngle < 10) {
      _action = LocaleKeys.live_ness_actionFaceBetween
          .tr; // -0.8164559006690979----4.945835113525391-----1.0284703969955444
    } else if (type == LocaleKeys.live_ness_faceYaw.tr) {
      if (GetPlatform.isAndroid) {
        if (35 <= yawAngle) {
          _action = LocaleKeys.live_ness_actionFaceLeft
              .tr; // -0.18795348703861237----10.272408485412598---- 48.454349517822266 -2.0299479961395264----4.841399192810059---- 46.177982330322266
        } else if (-35 >= yawAngle) {
          _action = LocaleKeys.live_ness_actionFaceRight
              .tr; //-3.094949245452881----7.744707107543945---- -46.089717864990234
        }
      } else if (GetPlatform.isIOS) {
        if (35 <= yawAngle) {
          _action = LocaleKeys.live_ness_actionFaceRight
              .tr; // -0.18795348703861237----10.272408485412598---- 48.454349517822266 -2.0299479961395264----4.841399192810059---- 46.177982330322266
        } else if (-35 >= yawAngle) {
          _action = LocaleKeys.live_ness_actionFaceLeft
              .tr; //-3.094949245452881----7.744707107543945---- -46.089717864990234
        }
      } else {
        _action = LocaleKeys.live_ness_actionUndefined.tr;
      }
    } else if (type == LocaleKeys.live_ness_facePith.tr) {
      if (8 <= pitchAngle &&
          pitchAngle <= 15 && /*pitchAngle <= 0*/
          yawAngle <= 3) {
        _action = LocaleKeys.live_ness_actionFaceDown
            .tr; // -2.5408544540405273  -13.326554298400879  2.30796217918396 -0.14789383113384247  -28.385841369628906  -1.4073477983474731
      } else if (pitchAngle >= 20) {
        _action = LocaleKeys.live_ness_actionFaceUp
            .tr; // -1.2412775754928589  29.423805236816406  0.777174174785614 -1.400559663772583  28.6320858001709  1.1715636253356934
      } else {
        _action = LocaleKeys.live_ness_actionUndefined.tr;
      }
    }
    return LiveNessDetectionData(question: _action, percentSmile: percentSmile);

    // return _action;
  }

  LiveNessDetectionData liveNess(String type) {
    return getUserAction(type);
    // var padding = 15;
    // middle_point = {"x_min": size.width/2 -padding,
    //   "x_max": size.width/2 +padding,
    //   "y_min": size.height/2 -padding,
    //   "y_max": size.height/2 +padding};
    // if (faces.isNotEmpty){
    //   Face face = faces[0];
    //
    //   // Kiểm tra liveness
    //   if (_isReadyLivenessDetection){
    //     counter_try+=1;
    //     var the_current_question = current_question;
    //     // End question
    //     if (_action == question) {
    //       counter_ok_consecutives += 1;
    //       if (counter_ok_consecutives == limit_consecutives){ // Reach at least consecutives
    //         // reset_loop_value();
    //         counter_ok_questions += 1;
    //         // show_result(the_current_question, true);
    //         _isReadyLivenessDetection = false;
    //         if(current_question != limit_questions)
    //         {}
    //         // delay_per_question(current_question,question);
    //       }
    //     }
    //     else if(counter_try == limit_try) { // Reach limit try times
    //       // reset_loop_value();
    //       // show_result(the_current_question, false);
    //       _isReadyLivenessDetection = false;
    //       if(current_question != limit_questions){}
    //       // delay_per_question(current_question,question);
    //     }
    //     // Check counter question
    //     if(current_question == limit_questions) {
    //       // show_question('');
    //       result_liveness = (counter_ok_questions >= at_least_ok_qestions);
    //       // show_final_result();
    //     }
    //   }
    //   if (isFaceTracking){
    //     if (isFaceDetected){
    //       // Check center point, If both face and noise is center, take picture
    //       nose_point['x'] = translateX(
    //         face.landmarks['noseBase']!.position.x.toDouble(),
    //         size,
    //         imageSize,
    //         rotation,
    //         cameraLensDirection,
    //       );
    //       nose_point['y'] = translateY(
    //         face.landmarks['noseBase']!.position.y.toDouble(),
    //         size,
    //         imageSize,
    //         rotation,
    //         cameraLensDirection,
    //       );
    //
    //       if (_action == "Ở giữa" && middle_point['x_min']! <= nose_point['x']! &&
    //           nose_point['x']! <= middle_point['x_max']! &&
    //           middle_point['y_min']! <= nose_point['y']! &&
    //           nose_point['y']! <= middle_point['y_max']!) {
    //         counter_center_frames += 1;
    //         // console.log(counter_center_frames);
    //       }
    //       else {
    //         counter_center_frames = 0;
    //       }
    //       // Nếu đạt đủ số frame ở giữa thì chụp ảnh
    //       if(counter_center_frames == limit_center_franes){
    //         // Chụp ảnh tự động
    //         // console.log(_action, nose_point, counter_center_frames)
    //         // auto_capture();
    //         isFaceTracking = false;
    //       }
    //     }
    //     else {
    //       // console.log("Lost Face");
    //       isFaceTracking = false;
    //       counter_center_frames = 0;
    //       // liveness_reset();
    //     }
    //   }
    //   // canvasCtx.restore();
    // }
    // else {
    //   isFaceDetected = false;
    // }
  }
// Future<String> checkLiveNess( String type) async {
//   await Future.delayed(const Duration(milliseconds: 100)); /// 10fps
//   // getUserAction(type);
//   return getUserAction(type);
// }

/*
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.red;
    final Paint paint2 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0
      ..color = Colors.green;

    for (final Face face in faces) {
      final left = translateX(
        face.boundingBox.left,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final top = translateY(
        face.boundingBox.top,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final right = translateX(
        face.boundingBox.right,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final bottom = translateY(
        face.boundingBox.bottom,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      // canvas.drawRect(
      //   Rect.fromLTRB(left, top, right, bottom),
      //   paint1,
      // );

      // void paintContour(FaceContourType type) {
      //   final contour = face.contours[type];
      //   if (contour?.points != null) {
      //     for (final Point point in contour!.points) {
      //       canvas.drawCircle(
      //           Offset(
      //             translateX(
      //               point.x.toDouble(),
      //               size,
      //               imageSize,
      //               rotation,
      //               cameraLensDirection,
      //             ),
      //             translateY(
      //               point.y.toDouble(),
      //               size,
      //               imageSize,
      //               rotation,
      //               cameraLensDirection,
      //             ),
      //           ),
      //           1,
      //           paint1);
      //     }
      //   }
      // }

      void paintLandmark(FaceLandmarkType type) {
        final landmark = face.landmarks[type];
        if (landmark?.position != null) {
          canvas.drawCircle(
              Offset(
                translateX(
                  landmark!.position.x.toDouble(),
                  size,
                  imageSize,
                  rotation,
                  cameraLensDirection,
                ),
                translateY(
                  landmark.position.y.toDouble(),
                  size,
                  imageSize,
                  rotation,
                  cameraLensDirection,
                ),
              ),
              2,
              paint2);
        }
      }

      // for (final type in FaceContourType.values) {
      //   paintContour(type);
      // }

      for (final type in FaceLandmarkType.values) {
        paintLandmark(type);
      }
    }
  }*/
}
