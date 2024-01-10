import 'package:get/get.dart';

class Constants {
  static const mapApiKey = 'AIzaSyABz9brU-L22-hsZIJEWBj-cwYNSGGq8M0';
  static const version = '1.1.0';
  static const staticPermissions = <Map<String, bool>>[
    {
      "products": false,
      "create": false,
      "update": false,
      "delete": false,
      "option": false
    },
    {"orders": false, "approval": false, "reject": false},
    {"customer_service": false, "chats": false, "review": false},
    {"financial": false, "withdraw": false, "deposit": false, "control": false},
    {
      "marketing": false,
      "create": false,
      "update": false,
      "delete": false,
      "option": false
    }
  ];
  static final settingItemHeight = (Get.context?.height ?? 910) * 0.0463;
}
