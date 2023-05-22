// import 'package:flutter/material.dart';
// import 'package:flutter_tictactoe/screens/aiscreen.dart';
// import 'package:flutter_tictactoe/widgets/container_widget.dart';
// import 'package:flutter_tictactoe/constants.dart';
// import 'package:flutter_tictactoe/widgets/reusable_button.dart';
// import 'package:flutter_tictactoe/screens/game_screen.dart';
// import 'package:flutter_tictactoe/Models/UiLogic.dart';
// import 'package:flutter_tictactoe/widgets/wp_screen_text_widget.dart';

// class PickUp2Screen extends StatefulWidget {

//   @override
//   _PickUp2ScreenState createState() => _PickUp2ScreenState();
// }

// class _PickUp2ScreenState extends State<PickUp2Screen> {

//   @override
//   void initState() {
//     ui.colorsAndSide();
//     super.initState();
//   }

//   void updateColor(letter selectedLetter) =>  ui.updateColor(selectedLetter);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kGameScreenBackgroundColor,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Center(
//               child: Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: TextWidget(text: 'PICK YOUR SIDE',fontSize: 30.0,fontWeight: FontWeight.w500,)
//               ),
//             ),
//             Expanded(
//               child: GestureDetector(
//                 onTap: (){
//                   setState(() {
//                     updateColor(letter.cardX);
//                     UI.side = "X";
//                   });
//                 },
//                 child: ContainerWidget(
//                   color: UI.xCardColor, text: "X",
//                   textColor: UI.xTextColor,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: GestureDetector(
//                 onTap: (){
//                   setState(() {
//                     updateColor(letter.cardO);
//                     UI.side = "O";
//                   });
//                 },
//                 child: ContainerWidget(
//                   color: UI.oCardColor, text: "O",
//                   textColor: UI.oTextColor,
//                 ),
//               ),
//             ),
//             // Button Code
//             ReusableButton(
//               onTap: (){
//                 ui.remainingVars();
//                 ui.setWinningVariables();
//                 Navigator.push(context, MaterialPageRoute(
//                   builder: (context) => TicTacToeGame(chosenLetter: UI.side,),
//                 ));
//               },
//               text: 'START',
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }