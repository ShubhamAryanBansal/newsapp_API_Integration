import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Authentication/Login.dart';
import 'Utility/Network.dart';
import 'ViewController/View.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}
