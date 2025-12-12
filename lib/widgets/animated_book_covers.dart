import 'package:flutter/material.dart';

class AnimatedBookCovers extends StatefulWidget {
  const AnimatedBookCovers({super.key});

  @override
  State<AnimatedBookCovers> createState() => _AnimatedBookCoversState();
}

class _AnimatedBookCoversState extends State<AnimatedBookCovers>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/images/bear1.png',
      'assets/images/bear2.png',
      'assets/images/bear3.png',
    ];

    return SizedBox(
      height: 320,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            for (int index = 0; index < images.length; index++)
              _animatedBook(images[index], index),
          ],
        ),
      ),
    );
  }

  Widget _animatedBook(String imagePath, int index) {
    final offsetX = (index - 1) * 90.0;

    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 140,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}