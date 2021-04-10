import 'package:adhyapak/Helpers/HelpingWidgets.dart';
import 'package:adhyapak/Home/homeScreen.dart';
import 'package:adhyapak/Services/FirebaseOperation.dart';
import 'package:adhyapak/Utils/UploadPost.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AuthScreens/loginScreen.dart';
import 'AuthScreens/signUpScreen.dart';
import 'Services/AuthServices.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: <String,WidgetBuilder> {
          "Login" : (BuildContext context) => LoginScreen(),
          "SignUp" : (BuildContext context) => SignUpScreen(),
        },
      ),
      providers: [
        ChangeNotifierProvider(create: (_) => Authentication()),
        ChangeNotifierProvider(create: (_) => FirebaseOperation()),
        ChangeNotifierProvider(create: (_) => UploadPost()),
        ChangeNotifierProvider(create: (_) => HelpingWidgets()),
      ],
    );
  }
}

