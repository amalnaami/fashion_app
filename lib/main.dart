import 'package:fashion_app/backend/fashion_provider.dart';
import 'package:fashion_app/ui/screens/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
      localeDefault: LocalizationDefaultType.device,
      languagesList: <String>['ar', 'en'],
      assetsDirectory: 'assets/lang/' // NOT YET TESTED
      );
  runApp(ChangeNotifierProvider<FashionProvider>(
    create: (context) {
      return FashionProvider();
    },
    child: LocalizedApp(
      child: GetMaterialApp(
          home: MaterialApp(
        home: MyApp(),
            debugShowCheckedModeBanner: false,

          )),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.redAccent,
            body: Center(
              child: Icon(
                Icons.error,
                size: 150,
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            home: FirstScreen(),
            localizationsDelegates: translator.delegates,
            locale: translator.locale,
            supportedLocales: translator.locals(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          backgroundColor: Colors.redAccent,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );


  }
}
