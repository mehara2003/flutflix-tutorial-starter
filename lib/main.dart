import 'package:MovieFlixer/firebase/firebase.dart';
import 'package:MovieFlixer/home_screen.dart';
import 'package:MovieFlixer/material_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const MyApp());
}


