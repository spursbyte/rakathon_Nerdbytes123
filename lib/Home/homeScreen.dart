import 'package:adhyapak/Services/AuthServices.dart';
import 'package:adhyapak/Utils/UploadPost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, "Login");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Home Page",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<UploadPost>(context, listen: false).selectPostImage(context);
        },
      ),
      body: Center (
        child: Container(
          child: Column(
            children: [
              Text("This is the Home Page"),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                Provider.of<Authentication>(context, listen:false)
                    .logOutViaEmail()
                    .whenComplete(() => Navigator.pushReplacementNamed(context, "Login"));
                 },
                child: Text('Sign Out',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
