import 'package:flutter/material.dart';
import 'package:flutter_tictactoe/constants.dart' as constants;
import 'package:flutter_tictactoe/screens/constants1.dart' as constants1;
import 'package:flutter_tictactoe/screens/pickup_screen.dart';
import 'package:flutter_tictactoe/screens/result_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum GameOutcome { win, loss, draw }

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _totalWins = 0;
  int _totalLosses = 0;
  int _totalDraws = 0;

  Future<Map<String, String>> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    return {'name': name ?? '', 'email': email ?? ''};
  }

  Future<void> _getCounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _totalWins = prefs.getInt('totalWins') ?? 0;
      _totalDraws = prefs.getInt('totalDraws') ?? 0;
    });
  }

  void _updateStats(GameOutcome outcome) {
    setState(() {
      switch (outcome) {
        case GameOutcome.win:
          _totalWins++;
          break;
        case GameOutcome.loss:
          _totalLosses++;
          break;
        case GameOutcome.draw:
          _totalDraws++;
          break;
      }
    });
  }

  double getWinPercentage() {
    final totalGames = _totalWins + _totalLosses + _totalDraws;
    return totalGames > 0 ? (_totalWins / totalGames) * 100 : 0;
  }

  @override
  void initState() {
    super.initState();
    _getCounts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: getUserDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        final userDetails = snapshot.data;
        final userName = userDetails!['name'];
        final userEmail = userDetails['email'];

        return Scaffold(
          appBar: AppBar(
            backgroundColor: constants.kGameScreenBackgroundColor,
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.person,
                      size: 70.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    userName ?? '',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    userEmail!,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Wins',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '$_totalWins',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Draws',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '$_totalDraws',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Win Percentage: ${getWinPercentage().toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WinningScreen(onTap: _updateStats)),
                      );
                    },
                    child: Text(
                      'Play Game',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
