import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'custom_shapes.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  void _navigateToGame(BuildContext context, String player) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(firstPlayer: player),
      ),
    );
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
        child: Stack(
          alignment: Alignment.center,
          children: [

            Positioned(
              top: 145,
              left: -75,
              child: Opacity(
                opacity: 0.1,
                child: CustomShapes.buildX(size: 311),
              ),
            ),
            Positioned(
              top: 61,
              left: 146,
              child: Opacity(
                opacity: 0.1,
                child: CustomShapes.buildO(size: 311),
              ),
            ),


            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const Spacer(flex: 2), 
                    const Text(
                      "Tic-Tac-Toe",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 0,
                      ),
                    ),
                    
                    const Spacer(flex: 5), 
                    
                    const Text(
                      "Pick who goes first?",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 30),
                    

                    SizedBox(
                      width: 343,
                      height: 164,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          GestureDetector(
                            onTap: () => _navigateToGame(context, 'X'),
                            child: Container(
                              width: 164, 
                              height: 164, 
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: CustomShapes.buildX(
                                  size: 86,
                                  color: const Color(0xFFFF4B4B)
                                ), 
                              ),
                            ),
                          ),
                          

                          GestureDetector(
                            onTap: () => _navigateToGame(context, 'O'),
                            child: Container(
                              width: 164, 
                              height: 164, 
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: CustomShapes.buildO(
                                  size: 86, 
                                  color: const Color(0xFF65AF53)
                                ), 
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 60), 
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