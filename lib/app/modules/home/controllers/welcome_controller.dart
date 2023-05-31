import 'package:filesapplication/app/modules/home/controllers/home_controller.dart';
import 'package:filesapplication/app/modules/home/views/choice_view.dart';
import 'package:filesapplication/app/modules/home/views/documents_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  List<String> items = [''].obs;
  late User user;
   var choicelist=<Choice>[].obs;
  @override
  void onInit() async {
    super.onInit();
    user = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void logout() async {
    await homeController.googleSign.disconnect();
    await homeController.firebaseAuth.signOut();
  }

  void additem(){
     items.add('New Folder');
  }
  void createItem(){

    Get.to(DocumentView());
    // choicelist.add(item);
  }
}
