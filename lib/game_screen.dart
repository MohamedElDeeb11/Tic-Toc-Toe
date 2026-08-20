import 'package:flutter/material.dart';
import 'dart:async';
import 'custom_shapes.dart';

class GameScreen extends StatefulWidget {
  final String firstPlayer;

  const GameScreen({super.key, required this.firstPlayer});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late String currentPlayer;
  List<String> board = List.filled(9, '');
  String winner = '';
  
  int secondsElapsed = 5; 
  Timer? timer;

  @override
  void initState() {
    super.initState();
    currentPlayer = widget.firstPlayer;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        secondsElapsed++;
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  String formatTime(int seconds) {
    String minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    String secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  String getPlayerName(String playerSymbol) {
    return playerSymbol == widget.firstPlayer ? "Player 1" : "Player 2";
  }

  void handleTap(int index) {
    if (board[index] == '' && winner == '') {
      setState(() {
        board[index] = currentPlayer;
        checkWinner();
        if (winner == '') {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    } else if (winner != '') {
      Navigator.pop(context); 
    }
  }

  void checkWinner() {
    List<List<int>> winningLines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ];

    for (var line in winningLines) {
      if (board[line[0]] != '' &&
          board[line[0]] == board[line[1]] &&
          board[line[0]] == board[line[2]]) {
        setState(() {
          winner = board[line[0]];
        });
        stopTimer();
        return;
      }
    }

    if (!board.contains('')) {
      setState(() {
        winner = 'Draw';
      });
      stopTimer();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEBC13F), Color(0xFFE54D2B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50), 
                  ),
                  child: Center(
                    child: Text(
                      formatTime(secondsElapsed),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900, 
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                Text(
                  winner == '' 
                      ? "${getPlayerName(currentPlayer)}'s Turn" 
                      : winner == 'Draw' 
                          ? "It's a Draw!" 
                          : "${getPlayerName(winner)} Wins!",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                
                const SizedBox(height: 30),
                
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40), 
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 45),
                    child: Column(
                      children: [
                        Expanded(child: _buildRow(0, 1, 2)),
                        Expanded(child: _buildRow(3, 4, 5)),
                        Expanded(child: _buildRow(6, 7, 8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(int i1, int i2, int i3) {
    return Row(
      children: [
        Expanded(child: _buildCell(i1)),
        Expanded(child: _buildCell(i2)),
        Expanded(child: _buildCell(i3)),
      ],
    );
  }


  Widget _buildCell(int index) {
    bool isRightBorder = (index % 3 != 2);
    bool isBottomBorder = (index < 6);

    return GestureDetector(
      onTap: () => handleTap(index),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            right: isRightBorder ? const BorderSide(color: Colors.black87, width: 1.0) : BorderSide.none,
            bottom: isBottomBorder ? const BorderSide(color: Colors.black87, width: 1.0) : BorderSide.none,
          ),
        ),
        child: Center(
          child: board[index] == 'X'
              ? CustomShapes.buildX(size: 70, color: const Color(0xFFFF4B4B))
              : board[index] == 'O'
                  ? CustomShapes.buildO(size: 70, color: const Color(0xFF65AF53))
                  : null,
        ),
      ),
    );
  }
}