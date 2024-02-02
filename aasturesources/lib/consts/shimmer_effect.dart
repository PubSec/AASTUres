import 'package:flutter/material.dart';

class ShimmerEffectView extends StatelessWidget {
  const ShimmerEffectView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // hold the entire shimmer effect
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(
        top: 7.5,
        left: 20,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const Column(
        children: [
          // the main shimmer effect title
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skelton(
                theColor: Colors.grey,
                theWidth: 50,
                theHeight: 50,
              ),
              SizedBox(
                width: 18,
              ),
              Skelton(
                theColor: Colors.white30,
                theHeight: 20,
                theWidth: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget for the shimmer effect

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.theWidth,
    this.theHeight,
    this.theColor,
  });

  final double? theWidth;
  final double? theHeight;
  final Color? theColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: theHeight,
      width: theWidth,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
