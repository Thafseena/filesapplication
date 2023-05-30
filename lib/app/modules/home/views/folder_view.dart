import 'package:filesapplication/app/modules/home/controllers/folder_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FolderView extends GetView<FolderController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: 400,
          width: 350,
        color: Colors.amberAccent,
      
           ),
      ));
  }
  
}