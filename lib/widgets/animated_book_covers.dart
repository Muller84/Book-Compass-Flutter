import 'package:flutter/material.dart';

class AnimatedBookCovers extends StatelessWidget {
  const AnimatedBookCovers({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/images/bear1.png',
      'assets/images/bear2.png',
      'assets/images/bear3.png',
    ];

    return SizedBox(
      height: 250,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // spodní karta
            Positioned(
              left: 0,
              child: _cardImage(images[0], 0.85, -0.1),
            ),
            // prostřední karta
            Positioned(
              left: 60,
              child: _cardImage(images[1], 0.95, 0.0),
            ),
            // horní karta
            Positioned(
              left: 120,
              child: _cardImage(images[2], 1.0, 0.1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardImage(String path, double scale, double angle) {
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: angle,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            path,
            width: 150,
            height: 210,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}