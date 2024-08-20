enum TabItem { homePage, documentManagement, notify, profile }

class HomeConst {
  static const int timeDelay = 100;

  ///vị trí của tab tài liệu trên navigator
  static const int typeDocs = 1;

  ///vị trí  của tài liệu đến trong  danh sách tài liệu
  static const int typeDocsArrive = 0;
  static Map<TabItem, String> tabName = {
    TabItem.homePage: 'home_page',
    TabItem.documentManagement: 'documentManagement',
    TabItem.notify: 'notification',
    TabItem.profile: 'profile'
  };
}
