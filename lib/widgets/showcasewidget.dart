import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_tictactoe/widgets/parent_column.dart';
import 'package:flutter_tictactoe/constants.dart';
import 'package:showcaseview/showcaseview.dart';

class showCaseWidget extends StatelessWidget {
  const showCaseWidget({
    Key? key,
    required this.keyOne,
  }) : super(key: key);

  final GlobalKey<State<StatefulWidget>> keyOne;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: keyOne,
      description: 'SET UP YOUR PROFILE',
      showcaseBackgroundColor: kProfileContainerColor,
      contentPadding: EdgeInsets.all(8),
      overlayOpacity: 0.75,
      showArrow: true,
      shapeBorder: CircleBorder(),
      descTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
      child: IconButton(
        onPressed: (){
          Alert(
              style: AlertStyle(
                backgroundColor: Color(0xFF9b70e5),
                alertPadding: EdgeInsets.symmetric(horizontal: 25.0),
              ),
              context: context,
              content: COLUMNWIDGET(),
              buttons: [
                DialogButton(
                  onPressed: (){Navigator.pop(context);},
                  child: Text(
                    "DONE",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ]).show();
        },
        icon : Icon(
          Icons.view_headline,
          size: 30.0,
        ),
      ),
    );
  }
}

