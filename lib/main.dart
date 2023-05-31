// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<String> items = ['Item 1', 'Item 2', 'Item 3'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Grid in Folder Icon'),
//       ),
//       body: GridView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               title: Text(items[index]),
//               trailing: IconButton(
//                 icon: Icon(Icons.add),
//                 onPressed: () {
//                   setState(() {
//                     items.add('New Item');
//                   });
//                 },
//               ),
//             ),
//           );
//         }, gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 childAspectRatio: 3 / 2,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20),
//       ),
//     );
//   }
// }



import 'package:filesapplication/app/modules/home/bindings/home_binding.dart';
import 'package:filesapplication/app/modules/home/views/te.dart';

import 'package:filesapplication/app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main(){
    runApp(MyApp());
}
class MyApp extends StatelessWidget {
  static final String title = 'Firebase Upload';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: CreateTest(),
      );
}

// /* void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   await Firebase.initializeApp();
//   HomeBinding().dependencies();
//   runApp(
//     GetMaterialApp(
//       title: "Application",
//        initialRoute: AppPages.INITIAL,
//     //  home: CreateTest(),
//       getPages: AppPages.routes,
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.dark,
//       darkTheme: ThemeData.dark().copyWith(
//         hintColor: Colors.yellow,
//         primaryColor: Color(0xff141A31),
//         primaryColorDark: Color(0xff081029),
//         scaffoldBackgroundColor: Color(0xff141A31),
//         textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.yellow),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ButtonStyle(
//               shape: MaterialStateProperty.all(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
//               padding: MaterialStateProperty.all(EdgeInsets.all(14))),
//         ),
//       ),
//     ),
//   );
// }*/