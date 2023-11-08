import 'package:flutter/material.dart';

class NoteDetailPage extends StatelessWidget {
  final String title;

 NoteDetailPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: Text("Note Detail",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.black),),
        centerTitle: true,
         leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black), 
          ),
        backgroundColor:Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
          
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              height: 2,
              
            ),
          ),
          ]
        ),
      ),
    );
  }
}