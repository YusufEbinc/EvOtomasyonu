import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ev_gider_app/screens/HomeScreen.dart';
import 'package:flutter_ev_gider_app/screens/LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _oturumKontrolDegiskeni = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: FutureBuilder(
        future: oturumKontrol(),
        builder: (context, snapshot) {
          if (_oturumKontrolDegiskeni == false) {
            return LoginScreen();
          } else {
            return HomeScreen();
          }
        },
      ),
    );
  }

  Future<void> oturumKontrol() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        _oturumKontrolDegiskeni = true;
      }
    });
  }
}
