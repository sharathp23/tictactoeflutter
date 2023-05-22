import 'package:delayed_display/delayed_display.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tictactoe/constants.dart';
import 'package:flutter_tictactoe/screens/game_screen.dart';
import 'package:flutter_tictactoe/widgets/profileContainerRow.dart';
import 'package:flutter_tictactoe/Models/UiLogic.dart';
import 'package:flutter_tictactoe/widgets/reusable_button.dart';

class WinningScreen extends StatelessWidget {
  final winningLetter;
  final onTap;
  static int totalWins = 0;
  static int totalDraws = 0;
  WinningScreen({this.winningLetter, this.onTap});

  void _saveCounts() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('totalWins', totalWins);
  await prefs.setInt('totalDraws', totalDraws);
}
  @override
  Widget build(BuildContext context) {
   if (UI.finalResult == "Win") {
      totalWins++;
    } else {
      totalDraws++;
    }
    _saveCounts();
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: EntireRowInGameScreen(),
            ),
            Expanded(
              child: DelayedDisplay(
                delay: Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kGameScreenContainerColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: constraints.maxHeight * 0.70,
                              image: AssetImage('images/${UI.finalResult}.png'),
                            ),
                            UI.finalResult == "Win"
                                ? Center(
                                    child: Text(
                                      "${UI.playerMap[winningLetter]} WINS",
                                      style: kResultText.copyWith(
                                          fontSize:
                                              constraints.maxHeight / 10.5),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      "DRAWN",
                                      style: kResultText.copyWith(
                                          fontSize:
                                              constraints.maxHeight / 10.5),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: 850),
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    ReusableButton(text: 'PLAY AGAIN', onTap: onTap),
                    ReusableButton(
                      text: 'HOME',
                      onTap: () {
                        ui.setAllVars();
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        UI.muteSound = true;
                      },
                    ),
                    Text('Total Wins: $totalWins'),
                    Text('Total Draws: $totalDraws'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
