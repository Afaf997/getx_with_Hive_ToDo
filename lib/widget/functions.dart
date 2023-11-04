import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlidablePage {
  final Widget page;
  final IconData icon;

  SlidablePage({required this.page, required this.icon});
  
  String get text {
    return icon == CupertinoIcons.calendar ? "todo" : "list";
  }
}
