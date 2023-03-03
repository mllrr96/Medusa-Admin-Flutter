import 'package:get/get.dart';
import '../controller/country_controller.dart';

class SelectCountryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectCountryController());
  }
}
