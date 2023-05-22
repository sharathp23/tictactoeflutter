import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tictactoe/screens/aiscreen.dart';
import 'package:flutter_tictactoe/screens/game_screen.dart';
import 'package:flutter_tictactoe/screens/profile.dart';
import 'package:flutter_tictactoe/widgets/setting_controllers.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:flutter_tictactoe/constants.dart';
import 'package:flutter_tictactoe/widgets/showcasewidget.dart';
import 'package:flutter_tictactoe/screens/pickup_screen.dart';
import 'package:flutter_tictactoe/widgets/reusable_button.dart';
import 'package:flutter_tictactoe/widgets/wp_screen_text_widget.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final keyOne = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)!.startShowCase([keyOne]),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kGameScreenBackgroundColor,
        leading: showCaseWidget(keyOne: keyOne),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              // TODO: Show user profile page
            },
          ),
        ],
        title: SizedBox(
          width: double.infinity,
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "TIC ",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Paytone',
                    ),
                  ),
                  TextSpan(
                    text: "TAC ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Paytone',
                    ),
                  ),
                  TextSpan(
                    text: "TOE",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Paytone',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: OrientationBuilder(
            builder: (context, orientation) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: orientation == Orientation.portrait
                        ? const EdgeInsets.all(30)
                        : const EdgeInsets.symmetric(horizontal: 150),
                    child: Center(
                      child: GetBuilder<SettingsController>(
                          init: SettingsController(),
                          builder: (settingsController) {
                            return Image.asset(
                              'assets/themes/${settingsController.theme.toLowerCase()}/homeStyle.png',
                              width: Get.width / 0.8,
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: ReusableButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PickUpScreen()),
                        );
                      },
                      text: "GET STARTED",
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
