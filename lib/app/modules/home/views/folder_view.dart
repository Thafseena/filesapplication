import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:filesapplication/app/modules/home/api/firebase_api.dart';
import 'package:filesapplication/app/modules/home/utils/dimensions.dart';
import 'package:filesapplication/app/modules/home/views/button_widget.dart';
import 'package:filesapplication/app/modules/home/views/documents_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class FolderView extends StatefulWidget {
  @override
  _FolderViewState createState() => _FolderViewState();
}

class _FolderViewState extends State<FolderView> {
  
  UploadTask? task;
  File? file;
  String ? fileid;
   
   
     CollectionReference productRef =
          FirebaseFirestore.instance.collection('files');
void uploadData() async {
    
   
  //log("im")
      fileid = const Uuid().v4();
log(fileid.toString());
log(file!.path.toString());
      await  
      // productRef
      //   .add({'id': "fileid", 'image': "file!.path"})
      //   .then((value) => print('User Added'))
      //   .catchError((error) => log('Failed to Add user: $error'));
      FirebaseFirestore.instance.collection('files').doc(fileid).set({
        'id': fileid.toString(),
        
        'image': file!.path.toString(),
        
      });
      // .whenComplete(() {
      //   setState(() {
      //     processing = false;
      //     imagesFileList = [];
      //     mainCategValue = 'select category';

      //     // subCategList = [];
      //     imagesUrlList = [];
      //   });
      //   _formKey.currentState!.reset();
      // });
    
  }

  void uploadProduct() async {
    await uploadFile().whenComplete(() => uploadData());
  }
  @override
  Widget build(BuildContext context) {
   final fileName = file != null ? File(file!.path) : 'No File Selected';

    return Scaffold(
     // bottomSheet: ,
      appBar: AppBar(
        // title: Text(MyApp.title),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(bottom:Dimensions.height30),
        padding: EdgeInsets.all(32),
        child: Center(
         child:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
         if (file != null)
            Container(
              child: Image.file(
                   File(file!.path),
                  //  File(file!.path==null?Container():file!.path),
                   height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                 ),
            ),
                SizedBox(height: 20),
         ButtonWidget(
           text: 'Select File',
           icon: Icons.attach_file,
           onClicked: selectFile,
         ),
                       SizedBox(height: 8),
         // if(file!.path!=null)
           
         SizedBox(height: 10),
         ButtonWidget(
           text: 'Upload File',
           icon: Icons.cloud_upload_outlined,
           onClicked: uploadProduct,
         ),
         SizedBox(height: 20),
         task != null ? buildUploadStatus(task!) : Container(),
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("View",style: TextStyle(fontSize: 15, color: Colors.white)),
        onPressed: () {
          Get.to(DocumentCreate());
      //   // log("filepath=="+file!.path);
      //     //  final fileName = file != null ? File(file!.path) : 'No File Selected';
      //     //  selectFile();
      //     //  log("filepath=="+fileName.toString());
      //   _show(context);
      //   // fileName);
         
     },),
    );
  }
// void _show(BuildContext ctx) {
//  final fileName = file != null ? basename(file!.path) : 'No File Selected';

  //  final filename=file!.path;
    // final filename = file != null ? basename(file!.path) : 'No File Selected';
// log("-----1111"+file.toString());
  //   showModalBottomSheet(
  //       elevation: 10,
  //       backgroundColor: Colors.amber,
  //       context: ctx,
  //       builder: (ctx) => 
        
  //       Container(
  //             width: 300,
  //             height: 250,
  //             color: Colors.white54,
  //             alignment: Alignment.center,
  //             child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [

  //             // Image.file(
  //             //         File(file!.path!),
  //             //          width: double.infinity,
  //             //          fit: BoxFit.cover,
  //             //       ),
  //             ButtonWidget(
  //               text: 'Select File',
  //               icon: Icons.attach_file,
  //               onClicked: selectFile,
  //             ),
  //                           SizedBox(height: 8),
  //             // if(file!.path!=null)
                
  //             SizedBox(height: 18),
  //             ButtonWidget(
  //               text: 'Upload File',
  //               icon: Icons.cloud_upload_outlined,
  //               onClicked: uploadProduct,
  //             ),
  //             SizedBox(height: 20),
  //             task != null ? buildUploadStatus(task!) : Container(),
  //           ],
  //         ),
  //           ));
  // }
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
    log("-----"+file.toString());
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
