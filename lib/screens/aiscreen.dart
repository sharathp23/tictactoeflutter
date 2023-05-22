// import 'package:flutter/material.dart';
// import 'dart:math';

// class TicTacToeGame extends StatefulWidget {
//   @override
//   _TicTacToeGameState createState() => _TicTacToeGameState();
// }

// class _TicTacToeGameState extends State<TicTacToeGame> {
//   List<String> _gameBoard = List.filled(9, "");
//   String _currentPlayer = "X";
//   Random _random = Random();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Tic Tac Toe"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Board(
//               gameBoard: _gameBoard,
//               onTileClicked: _onTileClicked,
//             ),
//           ),
//           SizedBox(height: 20),
//           Profile(
//             currentPlayer: _currentPlayer,
//           ),
//           SizedBox(height: 20),
//           Result(
//             gameBoard: _gameBoard,
//             currentPlayer: _currentPlayer,
//             onReset: _resetGame,
//           ),
//         ],
//       ),
//     );
//   }

//   void _onTileClicked(int index) {
//     if (_gameBoard[index] == "") {
//       setState(() {
//         _gameBoard[index] = _currentPlayer;
//         _currentPlayer = _currentPlayer == "X" ? "O" : "X";
//       });
//       _checkForWinner();
//       _aiTurn();
//     }
//   }

//   void _checkForWinner() {
//     List<List<int>> winningConditions = [
//       [0, 1, 2],
//       [3, 4, 5],
//       [6, 7, 8],
//       [0, 3, 6],
//       [1, 4, 7],
//       [2, 5, 8],
//       [0, 4, 8],
//       [2, 4, 6]
//     ];

//     for (var condition in winningConditions) {
//       if (_gameBoard[condition[0]] != "" &&
//           _gameBoard[condition[0]] == _gameBoard[condition[1]] &&
//           _gameBoard[condition[1]] == _gameBoard[condition[2]]) {
//         _showGameOverDialog("$_currentPlayer Wins!");
//         break;
//       }
//     }
//   }

//   void _aiTurn() {
//     // Random AI player - chooses an empty cell randomly
//     int emptyCellCount = _gameBoard.where((cell) => cell == "").length;
//     if (emptyCellCount > 0 && _currentPlayer == "O") {
//       int randomIndex = _random.nextInt(emptyCellCount);
//       int cellIndex = _gameBoard.indexWhere((cell) => cell == "", randomIndex);
//       _onTileClicked(cellIndex);
//     }
//   }

//   void _showGameOverDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Game Over"),
//           content: Text(message),
//           actions: [
//             TextButton(
//               child: Text("Play Again"),
//               onPressed: () {
//                 _resetGame();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _resetGame() {
//     setState(() {
//       _gameBoard = List.filled(9, "");
//       _currentPlayer = "X";
//     });
//   }
// }

// class Letter extends StatelessWidget {
//   final String value;

//   Letter({required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         value,
//         style: TextStyle(
//           fontSize: 50,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// class Board extends StatelessWidget {
//   final List<String> gameBoard;
//   final Function(int) onTileClicked;

//   Board({required this.gameBoard, required this.onTileClicked});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: gameBoard.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//       ),
//       itemBuilder: (BuildContext context, int index) {
//         return GestureDetector(
//           onTap: () => onTileClicked(index),
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.grey[300]!,
//                 width: 1.0,
//               ),
//             ),
//             child: Center(
//               child: Letter(value: gameBoard[index]),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class Profile extends StatelessWidget {
//   final String currentPlayer;

//   Profile({required this.currentPlayer});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Current Player: ",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           currentPlayer,
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: currentPlayer == "X" ? Colors.blue : Colors.red,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class Result extends StatelessWidget {
//   final List<String> gameBoard;
//   final String currentPlayer;
//   final Function() onReset;

//   Result(
//       {required this.gameBoard,
//       required this.currentPlayer,
//       required this.onReset});

//   @override
//   Widget build(BuildContext context) {
//     bool isBoardFull = !gameBoard.contains("");
//     bool isWinner = _checkForWinner(gameBoard, currentPlayer);
//     return isBoardFull || isWinner
//         ? Column(
//             children: [
//               Text(
//                 isBoardFull ? "Game Drawn!" : "$currentPlayer Wins!",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: onReset,
//                 child: Text("Play Again"),
//               ),
//             ],
//           )
//         : Container();
//   }

//   bool _checkForWinner(List<String> board, String player) {
//     List<List<int>> winningConditions = [
//       [0, 1, 2],
//       [3, 4, 5],
//       [6, 7, 8],
//       [0, 3, 6],
//       [1, 4, 7],
//       [2, 5, 8],
//       [0, 4, 8],
//       [2, 4, 6]
//     ];
//     for (var condition in winningConditions) {
//       if (board[condition[0]] == player &&
//           board[condition[1]] == player &&
//           board[condition[2]] == player) {
//         return true;
//       }
//     }
//     return false;
//   }
// }
