import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductDetailAnimation extends StatefulWidget {
  String image;
  ProductDetailAnimation(
    this.image, {
    super.key,
  });

  @override
  State<ProductDetailAnimation> createState() => _ProductDetailAnimationState();
}

class _ProductDetailAnimationState extends State<ProductDetailAnimation>
    with SingleTickerProviderStateMixin {
  bool up = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) controller.reverse();
        if (status == AnimationStatus.dismissed) controller.forward();
      });

    controller.forward();
  }

  @override
  void dispose() {
    // Dispose of the AnimationController
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: SizedBox(
        height: 115, // Control the height of the container
        width: double.infinity, // Control the width of the container
        child: SlideTransition(
          position: Tween<Offset>(
                  begin: const Offset(0, -0.4), end: const Offset(0, 0.2))
              .animate(controller),
          child: Center(
            // Optional: Ensures that the image stays centered
            child: Image.asset(
              widget.image, width: 210,
              fit: BoxFit
                  .cover, // Optional: Controls the image's fit (scale mode)
            ),
          ),
        ),
      ),
    );
  }
}
