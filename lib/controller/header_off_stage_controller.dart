import 'dart:developer';

import 'package:get/get.dart';

class HeaderOffStageController extends GetxController {
  var offstage = false.obs;
  void switchStage(bool stage) {
    offstage(stage);
  }
}
