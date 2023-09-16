import 'package:get/get.dart';

class ScheduleScreenController extends GetxController{
  RxInt selectedTabIndex = 0.obs;

  void setSelectedTab(int index) {
    selectedTabIndex.value = index;
  }

}