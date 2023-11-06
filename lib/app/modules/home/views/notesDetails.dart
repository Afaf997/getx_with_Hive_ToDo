import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteDetailPage extends StatelessWidget {
  final String title;

  NoteDetailPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white), // Set the color here
          ),
        backgroundColor:Colors.black,
        title: Text('Note Detail', style:TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            
          ),
        ),
      ),
    );
  }
}