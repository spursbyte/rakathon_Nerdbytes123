import 'package:flutter/cupertino.dart';

class HelpingWidgets with ChangeNotifier{
  Widget feedBody (BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}