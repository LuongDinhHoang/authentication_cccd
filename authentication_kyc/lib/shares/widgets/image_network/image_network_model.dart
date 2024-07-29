import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:flutter/material.dart';

class SDSImageNetworkModel {
  final String? imgUrl;
  final double width;
  final double height;
  final String imageDefault;
  final Widget? errorWidget;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final bool isAddBaseUrl;

  SDSImageNetworkModel(
    this.imgUrl, {
    this.height = AppDimens.sizeImageBig,
    this.width = AppDimens.sizeImage,
    this.imageDefault = Assets.ASSETS_JPG_IMAGE_DEFAULT_JPG,
    this.errorWidget,
    this.borderRadius,
    this.fit = BoxFit.fill,
    this.isAddBaseUrl = true,
  });
}
