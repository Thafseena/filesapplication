import 'package:filesapplication/app/modules/home/controllers/welcome_controller.dart';
import 'package:filesapplication/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentView extends GetView<WelcomeController> {
  // const DocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>
         GridView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.toNamed(AppPages.NAVIGATE);
              },
              child: Card(
                child: ListTile(
                  title: Text(controller.items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                     // setState(() {
                     controller.additem();
                     // });
                    },
                  ),
                ),
              ),
            );
          }, gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
        ),
      ),
    );
  }
}
