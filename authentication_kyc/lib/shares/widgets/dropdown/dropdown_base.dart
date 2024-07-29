import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:two_id_c06verify/core/core.src.dart';
import 'package:two_id_c06verify/shares/shares.src.dart';
import 'package:flutter/material.dart';

class DropdownBase{
  static baseDropDow({
    required Map<dynamic, dynamic> mapData,
    required bool isUseKey,
    required Rx<dynamic> item,
    Function(dynamic)? onChanged,
    String? hint,
    double? underlinePadding,
    bool isEnable = false,
  }) {
    return DropdownButton2<dynamic>(
      hint: TextUtils(
        text: hint ?? "",
        availableStyle: StyleEnum.bodyRegular,
        color: AppColors.basicGrey2,
      ),
      underline: Container(
          padding: EdgeInsets.symmetric(
              vertical: underlinePadding ?? AppDimens.padding5),
          child: const Divider(
            color: AppColors.colorTransparent,
            height: 2,
          )),
      selectedItemBuilder: (BuildContext context) {
        return isUseKey
            ? mapData.keys.map<Widget>((val) {
          return Container(
            alignment: Alignment.centerLeft,
            child: TextUtils(
              text: val,
              availableStyle: StyleEnum.bodyRegular,
            ),
          );
        }).toList()
            : mapData.values.map<Widget>((val) {
          return Container(
            alignment: Alignment.centerLeft,
            child: TextUtils(
              text: val,
              availableStyle: StyleEnum.bodyRegular,
            ),
          );
        }).toList();
      },
      // dropdownColor: fillColor,
      dropdownStyleData: DropdownStyleData(
        maxHeight: Get.height / 2.5,
        offset: const Offset(-10, -10),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(8),
          thickness: MaterialStateProperty.all<double>(
            6,
          ),
          thumbVisibility: MaterialStateProperty.all<bool>(true),
        ),
        // decoration: decoration,
      ),
      isExpanded: true,
      style: const TextStyle(color: AppColors.basicBlack),
      buttonStyleData: ButtonStyleData(
        height: AppDimens.btnMedium,
        width: Get.width,
        // padding: padding ??
        //     const EdgeInsets.only(
        //       left: AppDimens.paddingTabBar,
        //     ),
        elevation: 2,
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.arrow_drop_down),
        // iconSize: AppDimens.sizeDialogNotiIcon,
        // iconEnabledColor: Colors.deepOrangeAccent,
        // iconDisabledColor: Colors.grey,
      ),
      // isDense: true,
      items: isUseKey
          ? mapData.keys
          .toList()
          .map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList()
          : mapData.values
          .toList()
          .map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: item.value == "" ? null : item.value,
      onChanged: isEnable ? null : onChanged,
      // dropdownSearchData: dropDownSearchData,
      // onMenuStateChange: onMenuStateChange,
    );
  }
}