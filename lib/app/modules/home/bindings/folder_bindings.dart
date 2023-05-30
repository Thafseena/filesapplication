import 'package:filesapplication/app/modules/home/controllers/folder_controller.dart';
import 'package:get/get.dart';

class FolderBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<FolderController>(FolderController());
  }

}