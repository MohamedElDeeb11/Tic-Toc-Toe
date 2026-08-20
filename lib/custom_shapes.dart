import 'package:flutter/material.dart';

class CustomShapes {
  static Widget buildX({required double size, Color color = Colors.white}) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: 3.14159 / 4,
            child: Container(
              width: size * 0.20, 
              height: size * 0.95,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(size * 0.1),
              ),
            ),
          ),
          Transform.rotate(
            angle: -3.14159 / 4,
            child: Container(
              width: size * 0.20, 
              height: size * 0.95,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(size * 0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }


  static Widget buildO({required double size, Color color = Colors.white}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: size * 0.20, 
        ),
      ),
    );
  }
}