import 'package:two_id_c06verify/assets.dart';
import 'package:two_id_c06verify/generated/locales.g.dart';
import 'package:two_id_c06verify/shares/package/export_package.dart';
import 'package:get/get_utils/get_utils.dart';

class HomeCollection {
  // static List listData = [
  //   {
  //     "index": 1,
  //     "title": LocaleKeys.home_titleDocument.tr,
  //     "imageUrl": Assets.ASSETS_SVG_ICON_LIST_DOCUMENT_ITEM_HOME_SVG,
  //   },
  //   {
  //     "index": 2,
  //     "title": LocaleKeys.home_titleBuy.tr,
  //     "imageUrl": Assets.ASSETS_SVG_ICON_ITEM_BUY_HOME_SVG,
  //   },
  //   {
  //     "index": 3,
  //     "title": LocaleKeys.home_titleExtend.tr,
  //     "imageUrl": Assets.ASSETS_SVG_ICON_ITEM_EXTEND_HOME_HOME_SVG,
  //   },
  //   {
  //     "index": 4,
  //     "title": LocaleKeys.home_titleRecall.tr,
  //     "imageUrl": Assets.ASSETS_SVG_ICON_ITEM_RECALL_HOME_SVG,
  //   },
  //   {
  //     "index": 5,
  //     "title": LocaleKeys.home_titleMission.tr,
  //     "imageUrl": Assets.ASSETS_SVG_ICON_ITEM_MISSION_HOME_SVG,
  //   },
  //   {
  //     "index": 6,
  //     "title": LocaleKeys.home_titleInfo.tr,
  //     "imageUrl": Assets.ASSETS_SVG_ICON_ITEM_INFO_HOME_SVG,
  //   },
  //   {
  //     "index": 7,
  //     "title":
  //         LocaleKeys.certification_list_certificationListNotConfirmTitle.tr,
  //     "imageUrl": Assets.ASSETS_SVG_ICON_LIST_DOCUMENT_ITEM_HOME_SVG,
  //   },
  // ];

  /// Tạo chứng thư số

  static const int codeViewListCTS = 1;
  static const int codeViewListAuth = 2;
  static const int codeCreateCert = 4;

  static List<HomeItem> listActionItem = [
    HomeItem(
      code: codeViewListCTS,
      title: LocaleKeys.home_titleDocument.tr,
      imageUrl: Assets.ASSETS_SVG_ICON_LIST_DOCUMENT_ITEM_HOME_SVG,
    ),
    HomeItem(
      code: codeViewListAuth,
      title: LocaleKeys.certification_list_listAuthProfile.tr,
      imageUrl: Assets.ASSETS_SVG_ICON_LIST_CTS_SVG,
    ),
    // HomeItem(
    //   code: 3,
    //   title: LocaleKeys.home_titleExtend.tr,
    //   imageUrl: Assets.ASSETS_SVG_ICON_ITEM_EXTEND_HOME_HOME_SVG,
    // ),
    HomeItem(
      code: codeCreateCert,
      title: LocaleKeys.home_titleCreateCert.tr,
      imageUrl: Assets.ASSETS_SVG_ICON_CREATE_FOLDER_SVG,
    ),
    // HomeItem(
    //   code: 5,
    //   title: LocaleKeys.home_titleMission.tr,
    //   imageUrl: Assets.ASSETS_SVG_ICON_ITEM_MISSION_HOME_SVG,
    // ),
    // HomeItem(vâng
    //   code: 6,
    //   title: LocaleKeys.home_titleRecall.tr,
    //   imageUrl: Assets.ASSETS_SVG_ICON_ITEM_RECALL_HOME_SVG,
    // ),
    // HomeItem(
    //   code: 7,
    //   title: LocaleKeys.home_titleBuy.tr,
    //   imageUrl: Assets.ASSETS_SVG_ICON_ITEM_BUY_HOME_SVG,
    // ),
    // HomeItem(
    //   code: 8,
    //   title: LocaleKeys.certification_list_contract.tr,
    //   imageUrl: Assets.ASSETS_SVG_ICON_ITEM_INFO_HOME_SVG,
    // ),
    // HomeItem(
    //   code: 9,
    //   title: LocaleKeys.home_titleInfo.tr,
    //   imageUrl: Assets.ASSETS_SVG_ICON_CONTRACT_SVG,
    // ),
  ];
}

class HomeItem {
  HomeItem({
    this.code,
    required this.title,
    required this.imageUrl,
  });

  final int? code;
  final String title;
  final String imageUrl;

  HomeItem copyWith({
    int? code,
    String? title,
    String? imageUrl,
  }) {
    return HomeItem(
      code: code ?? this.code,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
