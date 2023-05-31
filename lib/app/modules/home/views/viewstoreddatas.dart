import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Viewstoreddata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      home: AddData(),
    );
  }
}
  
class AddData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('files').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
  
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                child: Center(child: 
                Text(document['image']),
                // Image.network(document['image'])
                
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }



// Future<String?> getImageUrlFromFirestore(String documentId) async {
//   String? imageUrl;

//   try {
//     final documentSnapshot = await FirebaseFirestore.instance
//         .collection('your_collection')
//         .doc(documentId)
//         .get();

//     if (documentSnapshot.exists) {
//       final data = documentSnapshot.data() as Map<String, dynamic>;
//       imageUrl = data['image_url'];
//     }
//   } catch (e) {
//     print('Error retrieving image URL from Firestore: $e');
//   }

//   return imageUrl;
// }
// class ImageFromFirestore extends StatelessWidget {
//   final String documentId;

//   const ImageFromFirestore({required this.documentId});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String?>(
//       future: getImageUrlFromFirestore(documentId),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error retrieving image from Firestore');
//         } else if (snapshot.hasData && snapshot.data != null) {
//           final imageUrl = snapshot.data!;
//           return Image.network(imageUrl);
//         } else {
//           return Text('No image available');
//         }
//       },
//     );
//   }
}
