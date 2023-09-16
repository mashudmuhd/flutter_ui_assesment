import 'package:get/get.dart';

class DashBordScreenController extends GetxController{

  var selectedIndex = 0.obs;


  void updateSelectedIndex (int index ){
  selectedIndex.value = index;
  }


}