import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class CreateTest extends StatefulWidget {
  const CreateTest({super.key});

  @override
  State<CreateTest> createState() => _CreateTestState();
}

class _CreateTestState extends State<CreateTest> {
String image="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          image.isEmpty?Container():Image.file(File(image),
          height: 50,
          width: 50,),
          //pick
          ElevatedButton(
            onPressed: ()async{
               // permission adding
              var status=await Permission.storage.request();
             var image=await ImagePicker().pickImage(source:ImageSource.gallery);
             if(image!=null){
              setState(() {
                this.image=image.path;
              });
             }
          }, child: Text("Select Image")),
          ElevatedButton(onPressed: () async{
            var status=await Permission.storage.request();
            if(status==PermissionStatus.granted){
              //read file
            var read=await File(image).readAsBytes();
            // create folder working code for folder creation
//             final folderName="aaaaaa";
//            final path= Directory("/storage/emulated/0/$folderName");
          
//             if ((await path.exists())){
//   // TODO:
//   print("exist");
// }else{
//   // TODO:
//   print("not exist");
//   path.create();
// }
   //create file
          //   var newfile=await File("/storage/emulated/0/").create(recursive: true);
          //   // write file
          //  await newfile.writeAsBytes(read);
            }
           /*  //read file
            var read=await File(image).readAsBytes();
            //create file
            var newfile=await File("/storage/emulated/filename.png").create(recursive: true);
            // write file
           await newfile.writeAsBytes(read); */
          }, child: Text("create file"))
        ],
      ),
    );
  }
}



// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';


// class CreateTest extends StatefulWidget {
//   const CreateTest({super.key});

//   @override
//   State<CreateTest> createState() => _CreateTestState();
// }

// class _CreateTestState extends State<CreateTest> {
// String image="";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 50),
//           image.isEmpty?Container():Image.file(File(image),
//           height: 50,
//           width: 50,),
//           //pick
//           ElevatedButton(
//             onPressed: ()async{
//                // permission adding
//               var status=await Permission.storage.request();
//              var image=await ImagePicker().pickImage(source:ImageSource.gallery);
//              if(image!=null){
//               setState(() {
//                 this.image=image.path;
//               });
//              }
//           }, child: Text("Select Image")),
//           ElevatedButton(onPressed: () async{
//             var status=await Permission.storage.request();
//             if(status==PermissionStatus.granted){
//               //read file
//             var read=await File(image).readAsBytes();
//             //create file
            
//             var newfile=await File("/storage/emulated/0/").create(recursive: true);
//             // write file
//            await newfile.writeAsBytes(read);
//             }
//            /*  //read file
//             var read=await File(image).readAsBytes();
//             //create file
//             var newfile=await File("/storage/emulated/filename.png").create(recursive: true);
//             // write file
//            await newfile.writeAsBytes(read); */
//           }, child: Text("create file"))
//         ],
//       ),
//     );
//   }
// }