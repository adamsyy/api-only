import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
}