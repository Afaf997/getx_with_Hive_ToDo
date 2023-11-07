import 'package:flutter/material.dart';

void addTodoItem(todoListViewModel, BuildContext context) {
  final titlecontroller = TextEditingController();
  final subtitlecontroller = TextEditingController();
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(13),
                child: TextFormField(
                  controller: titlecontroller,
                  decoration: const InputDecoration(
                      hintText: "Title", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: TextFormField(
                  controller: subtitlecontroller,
                  decoration: const InputDecoration(
                      hintText: "Description", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 230, top: 30),
                child: Container(
                  height: 60,
                  width: 110,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 9, 30, 48), // Text color
                        elevation: 3),
                    onPressed: () {
                      todoListViewModel.addTodoList(
                        titlecontroller.text,
                        subtitlecontroller.text,
                      );
                      Navigator.pop(context);
                    },
                    child: const  Text("Save",style: TextStyle(fontSize: 16),),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}