import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/core/theme/colors.dart';
import 'package:two_id_c06verify/core/values/dimens.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../shares/shares.src.dart';

class ItemServiceView {
  static Widget buildItemSelectService({
    required String title,
    int? price,
    int month = 0,
    bool isEnterprise = false,
    required Color colorBorder,
    required Color colorBackground,
    bool isIconSeeMore = true,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: colorBackground,
          border: Border.all(color: colorBorder),
          borderRadius: BorderRadius.circular(AppDimens.radius4),
        ),
        child: Row(
          children: [
            _buildIcon(),
            _buildTitleAndPrice(title, isEnterprise, price: price),
            _buildSeeMore(isIconSeeMore, month),
          ],
        ),
      ),
    );
  }

  static Widget _buildIcon() {
    return SizedBox(
      width: AppDimens.iconAccWidth,
      height: AppDimens.iconAccHeight,
      child: SvgPicture.asset(Assets.ASSETS_SVG_ICON_ACC_EKYC_SVG),
    ).paddingSymmetric(
      horizontal: AppDimens.padding16,
      vertical: AppDimens.padding16,
    );
  }

  static Widget _buildTitleAndPrice(String title, bool isEnterprise,
      {int? price}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
            text: title,
            availableStyle: StyleEnum.bodyBold,
            color: AppColors.primaryNavy,
          ).paddingOnly(top: AppDimens.padding8, bottom: AppDimens.padding4),
          if (price != null) _buildPriceRow(price),
        ],
      ),
    );
  }

  // Tài khoản khách hàng thì mới hiển thị ra
  static Widget _buildPriceRow(int price) {
    return Row(
      children: [
        SvgPicture.asset(Assets.ASSETS_SVG_ICON_TAG_SVG),
        TextUtils(
          text: "${CurrencyUtils.formatCurrencyForeign(
            convertDoubleToStringSmart(price.toDouble()),
          )} đ",
          availableStyle: StyleEnum.detailRegular,
          color: AppColors.primaryCam1,
        ).paddingOnly(left: AppDimens.padding4),
      ],
    );
  }

  static Widget _buildSeeMore(bool isIconSeeMore, int month) {
    return Row(
      children: [
        Visibility(
          visible: isIconSeeMore,
          child: SvgPicture.asset(
            Assets.ASSETS_SVG_ICON_DIRECTION_SVG,
            colorFilter:
                const ColorFilter.mode(AppColors.primaryCam1, BlendMode.srcIn),
          ).paddingOnly(right: AppDimens.padding16),
        ),
        Visibility(
          visible: !isIconSeeMore,
          child: TextUtils(
            text: "$month ${LocaleKeys.registerCa_month.tr}",
            availableStyle: StyleEnum.bodyRegular,
          ).paddingOnly(right: AppDimens.padding5),
        ),
      ],
    );
  }
}
