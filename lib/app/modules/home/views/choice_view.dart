import 'package:flutter/material.dart';

class Choice {  
  const Choice({required this.title,required this.icon});  
  final String title;  
  final IconData icon;  
} 

const List<Choice> choices = const <Choice>[  
  const Choice(title: 'Adhaar', icon: Icons.folder),  
  const Choice(title: 'Pan', icon: Icons.folder),  
  const Choice(title: 'License', icon: Icons.folder),  
  // const Choice(title: 'Add Folder', icon: Icons.add),  
 
];

class SelectCard extends StatelessWidget {  
 const SelectCard({Key? key,required this.choice}) : super(key: key);  
  final Choice choice;  
  
  @override  
  Widget build(BuildContext context) {  
   // final TextStyle textStyle = Theme.of(context).textTheme.;  
    return Card(  
        color: Colors.orange,  
        child: Center(child: Column(  
            crossAxisAlignment: CrossAxisAlignment.center,  
            children: <Widget>[  
              Expanded(child: Icon(choice.icon, size:50.0, color:Colors.black)),  
              Text(choice.title, style: TextStyle(fontSize: 20)),  
            ]  
        ),  
        )  
    );  
  }  
}  