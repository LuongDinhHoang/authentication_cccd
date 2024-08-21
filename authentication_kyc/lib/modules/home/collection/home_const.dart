enum TabItem { homePage, listUser, listPackage, other }

class HomeConst {

  ///vị trí  của tài liệu đến trong  danh sách tài liệu
  static const int typeDocsArrive = 0;
  static Map<TabItem, String> tabName = {
    TabItem.homePage: 'home_page',
    TabItem.listUser: 'listUser',
    TabItem.listPackage: 'listPackage',
    TabItem.other: 'other'
  };
}
