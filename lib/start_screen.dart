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
            // الأشكال الخلفية الشفافة (Watermarks)
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

            // المحتوى 
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const Spacer(flex: 2), // مسافة فوق العنوان
                    const Text(
                      "Tix-Tac-Toe",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 0,
                      ),
                    ),
                    
                    const Spacer(flex: 5), // المسافة اللي بتزق الزراير لتحت
                    
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
                    
                    // جروب الزراير 
                    SizedBox(
                      width: 343,
                      height: 164,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // زرار الـ X
                          GestureDetector(
                            onTap: () => _navigateToGame(context, 'X'),
                            child: Container(
                              width: 164, // مقاس البوكس الأبيض
                              height: 164, // مقاس البوكس الأبيض
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: CustomShapes.buildX(
                                  size: 86, // مقاس الـ X بالظبط زي الفيجما
                                  color: const Color(0xFFFF4B4B)
                                ), 
                              ),
                            ),
                          ),
                          
                          // زرار الـ O
                          GestureDetector(
                            onTap: () => _navigateToGame(context, 'O'),
                            child: Container(
                              width: 164, // مقاس البوكس الأبيض
                              height: 164, // مقاس البوكس الأبيض
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: CustomShapes.buildO(
                                  size: 86, // مقاس الـ O بالظبط زي الفيجما
                                  color: const Color(0xFF65AF53)
                                ), 
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 60), // مسافة ثابتة من تحت
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