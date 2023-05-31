import 'dart:io';
import 'dart:developer';

import 'package:filesapplication/app/modules/home/controllers/welcome_controller.dart';
import 'package:filesapplication/app/modules/home/utils/colors.dart';
import 'package:filesapplication/app/modules/home/utils/dimensions.dart';
import 'package:filesapplication/app/modules/home/views/choice_view.dart';
import 'package:filesapplication/app/modules/home/views/document_create.dart';
import 'package:filesapplication/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // const SizedBox(
            //   height: 5,
            // ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: TextField(
                  // onChanged: (value) => controller.filterPlayer(value),
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
            CircleAvatar(
              radius: Dimensions.radius20,
              backgroundImage: NetworkImage(controller.user.photoURL!),
            ),
         ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                width: 350,
                child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3/ 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: choices.length,
            itemBuilder: (BuildContext ctx, index) {
              // log("inside grid=="+controller.choicelist.length.toString());
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(Dimensions.radius15)),
                child: Column(
                  children: [
                    IconButton(icon:Icon(choices[index].icon),
                    onPressed: () {
                      Get.toNamed(AppPages.NAVIGATE);
                    },),
                    Text(choices[index].title)
                  ],
                ),
              );
            }
       ))),
       FloatingActionButton(
        backgroundColor: AppColors.buttonBackgroundColor,
        child: Icon(Icons.add),
        onPressed: (){
           controller.createItem();
          // log("list:"+controller.choicelist.length.toString());
                //  setState(() {
                //  Choice(title: "New Folder", icon:Icons.folder );  
                //   });
       
        // Get.to(DocumentCreate());
        // _createFolder();
       })
    
       ] ),
      ),
        bottomNavigationBar:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 100),
                child: ElevatedButton(
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  onPressed: () {
                    controller.logout();
                  },
                ),
              ),
        ),
    );
  }
   Future<String> createFolder(String cow) async {
 final dir = Directory((Platform.isAndroid
            ? await getExternalStorageDirectory() //FOR ANDROID
            : await getApplicationSupportDirectory() //FOR IOS
        )!
        .path + '/$cow');
    var status = 200;
    if (status==200) {
    //  await Permission.storage.request();
    }
    if ((await dir.exists())) {
      return dir.path;
    } else {
      dir.create();
      return dir.path;
    }
  }
   _createFolder()async{
final folderName="Documents";
final path= Directory("/storage/emulated/0/$folderName");
if ((await path.exists())){
  // TODO:
  print("exist");
}else{
  // TODO:
  print("not exist");
  path.create();
}
}
}