import 'dart:io';

import 'package:filesapplication/app/modules/home/controllers/home_controller.dart';
import 'package:filesapplication/app/modules/home/views/choice_view.dart';
import 'package:filesapplication/app/modules/home/views/documents_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class WelcomeController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  List<String> items = [''].obs;
  late User user;
   var choicelist=<Choice>[].obs;
   String image="";
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

    Get.to(DocumentCreate());
    // choicelist.add(item);
  }
    filereadandwrite()async{
      var status=await Permission.storage.request();
            if(status==PermissionStatus.granted){
              //read file
            var read=await File(image).readAsBytes();
                       }
            //read file
            var read=await File(image).readAsBytes();
            //create file
            var newfile=await File("/storage/emulated/0/ikkaka.png").create(recursive: true);
            // write file
           await newfile.writeAsBytes(read);

  }
}
