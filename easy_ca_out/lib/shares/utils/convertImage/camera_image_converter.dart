import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;

class CameraImageConverter {
  ///Reference
  ///NV21: https://www.google.com/search?sca_esv=557670131&sxsrf=AB5stBgf8izdWNU1RnVBX3PINfGqS2c_dA:1692242732078&q=understand+nv21+format&tbm=isch&source=lnms&sa=X&ved=2ahUKEwiIz6y33-KAAxVStVYBHQ-rDSgQ0pQJegQIDBAB&biw=1536&bih=746&dpr=1.25#imgrc=ejea9n7yMhetJM
  ///RGB: https://www.google.com/search?sca_esv=557670131&sxsrf=AB5stBgIB8zQlnFToi52k1_zaA3Wt2nx5w:1692244195628&q=understand+RGB+format&tbm=isch&source=lnms&sa=X&ved=2ahUKEwj89pzx5OKAAxXOMHAKHe6-BzIQ0pQJegQIDBAB&biw=1536&bih=746&dpr=1.25#imgrc=47JfTSaXqyEwSM
  ///Convert fomula: https://www.computerlanguage.com/results.php?definition=YUV%2FRGB+conversion+formulas
  ///with the matrix [Y1, Y2][Y3, Y4] + [V1, U1]
  // static Uint8List convertNV21toRGBA(CameraImage image) {
  //   final int width = image.width;
  //   final int height = image.height;
  //   final Uint8List nv21Data = image.planes[0].bytes;
  //
  //   final img.Image convertedImage = img.Image(width: width, height: height);
  //   int firstVIndex = (nv21Data.length ~/ 3) * 2 - 1;
  //   int lengthUV = nv21Data.length - (firstVIndex + 1);
  //
  //   for (int i = 0; i < lengthUV / 2; i++) {
  //     final int vIndex = firstVIndex + i * 2;
  //     final int uIndex = vIndex + 1;
  //     final int vValue = nv21Data[vIndex];
  //     final int uValue = nv21Data[uIndex];
  //
  //     final int iRow = ((i * 2) ~/ width) * 2;
  //     final int iCol = (i * 2) % width;
  //
  //     final List<int> yIndexs = [
  //       iRow * width + iCol,
  //       iRow * width + iCol + 1,
  //       iRow * width + iCol + width,
  //       iRow * width + iCol + 1 + width
  //     ];
  //     final List<int> yValues = [
  //       nv21Data[yIndexs[0]],
  //       nv21Data[yIndexs[1]],
  //       nv21Data[yIndexs[2]],
  //       nv21Data[yIndexs[3]]
  //     ];
  //     int redColor(int yValue) {
  //       //can be adjust
  //       return ((yValue) + 1.052 * (uValue - 128)).round().clamp(0, 255);
  //     }
  //
  //     int greenColor(int yValue) {
  //       //can be adjust
  //       return ((yValue - 16) - 0.395 * (vValue - 128) - 0.851 * (uValue - 128))
  //           .round()
  //           .clamp(0, 255);
  //     }
  //
  //     int blueColor(int yValue) {
  //       //can be adjust
  //       return ((yValue - 16) + 1.736 * (vValue - 128)).round().clamp(0, 255);
  //     }
  //
  //     //Set color for y0, y1
  //     for (int j = 0; j < 2; j++) {
  //       final r = redColor(yValues[j]);
  //       final g = greenColor(yValues[j]);
  //       final b = blueColor(yValues[j]);
  //       convertedImage.setPixel(iCol + j, iRow, img.ColorRgba8(r, g, b, 255));
  //     }
  //     //Set color for y2, y3
  //     for (int j = 0; j < 2; j++) {
  //       final r = redColor(yValues[j + 2]);
  //       final g = greenColor(yValues[j + 2]);
  //       final b = blueColor(yValues[j + 2]);
  //       convertedImage.setPixel(iCol + j, iRow + 1, img.ColorRgba8(r, g, b, 255));
  //     }
  //   }
  //   return Uint8List.fromList(convertedImage.getBytes());
  // }

  //function from google_mlkit_face_detection
  //Prepare InputImage for detection
  static InputImage? inputImageFromCameraImage(CameraImage image,
      CameraDescription camera, CameraController cameraController) {
    final orientationMap = {
      DeviceOrientation.portraitUp: 0,
      DeviceOrientation.landscapeLeft: 90,
      DeviceOrientation.portraitDown: 180,
      DeviceOrientation.landscapeRight: 270,
    };
    // get image rotation
    // it is used in android to convert the InputImage from Dart to Java: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/android/src/main/java/com/google_mlkit_commons/InputImageConverter.java
    // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/ios/Classes/MLKVisionImage%2BFlutterPlugin.m
    // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/example/lib/vision_detector_views/painters/coordinates_translator.dart
    final sensorOrientation = camera.sensorOrientation;
    // print(
    //     'lensDirection: ${camera.lensDirection}, sensorOrientation: $sensorOrientation, ${_controller?.value.deviceOrientation} ${_controller?.value.lockedCaptureOrientation} ${_controller?.value.isCaptureOrientationLocked}');
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
      orientationMap[cameraController.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    }
    if (rotation == null) return null;

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }

  ///Convert from InputImage format to Image with ARGB format
  static img.Image decodeYUV420SP(InputImage image) {
    final width = image.metadata!.size.width.toInt();
    final height = image.metadata!.size.height.toInt();

    Uint8List yuv420sp = image.bytes!;
    //int total = width * height;
    //Uint8List rgb = Uint8List(total);
    final outImg =
    img.Image(width: width, height: height); // default numChannels is 3

    final int frameSize = width * height;

    for (int j = 0, yp = 0; j < height; j++) {
      int uvp = frameSize + (j >> 1) * width, u = 0, v = 0;
      for (int i = 0; i < width; i++, yp++) {
        int y = (0xff & yuv420sp[yp]) - 16;
        if (y < 0) y = 0;
        if ((i & 1) == 0) {
          v = (0xff & yuv420sp[uvp++]) - 128;
          u = (0xff & yuv420sp[uvp++]) - 128;
        }
        int y1192 = 1192 * y;
        int r = (y1192 + 1634 * v);
        int g = (y1192 - 833 * v - 400 * u);
        int b = (y1192 + 2066 * u);

        if (r < 0) {
          r = 0;
        } else if (r > 262143) {
          r = 262143;
        }
        if (g < 0) {
          g = 0;
        } else if (g > 262143) {
          g = 262143;
        }
        if (b < 0) {
          b = 0;
        } else if (b > 262143) {
          b = 262143;
        }

        // I don't know how these r, g, b values are defined, I'm just copying what you had bellow and
        // getting their 8-bit values.
        outImg.setPixelRgb(i, j, ((r << 6) & 0xff0000) >> 16,
            ((g >> 2) & 0xff00) >> 8, (b >> 10) & 0xff);

        /*rgb[yp] = 0xff000000 |
            ((r << 6) & 0xff0000) |
            ((g >> 2) & 0xff00) |
            ((b >> 10) & 0xff);*/
      }
    }
    return outImg;
  }

  ///convert InputImage
  static Uint8List isolateProcessImage(InputImage item) {
    img.Image convertedImage = Platform.isAndroid
        ? decodeYUV420SP(item)
        : img.Image.fromBytes(
      width: item.metadata!.size.width.toInt(),
      height: item.metadata!.size.height.toInt(),
      bytes: item.bytes!.buffer, // For iOS
      order: img.ChannelOrder.bgra,
    );

    // Xử lý hướng xoay ảnh và giảm size
    if (item.metadata!.size.width.toInt() >
        item.metadata!.size.height.toInt()) {
      convertedImage = img.copyRotate(convertedImage, angle: -90);
      convertedImage = img.copyResize(convertedImage, width: 480, height: 640);
    }

    //Giảm chất lượng ảnh
    final compressedBytes = img.encodeJpg(convertedImage, quality: 50);

    return Uint8List.fromList(compressedBytes);
  }
}