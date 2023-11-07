import 'package:flutter/material.dart';

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
            icon: const Icon(Icons.arrow_back, color: Colors.white), 
          ),
        backgroundColor:Colors.black,
        title: const Text('Note Detail', style:TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            height: 2,
            
          ),
        ),
      ),
    );
  }
}