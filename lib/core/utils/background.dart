import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_home_app/core/theming.dart/app_colors.dart';

class Background extends StatelessWidget {
  const Background({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(decoration: BoxDecoration(color: AppColors.darkBackground)),
        Positioned(
          top: -275,
          left: -290,
          child: BlurCircle(
            size: 300,
            blurSigma: 70,
            colorOne: AppColors.tertiary,
            colorTwo: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}

class BlurCircle extends StatelessWidget {
  const BlurCircle({
    super.key,
    required this.size,
    required this.blurSigma,
    required this.colorOne,
    required this.colorTwo,
  });
  final double size;
  final double blurSigma;
  final Color colorOne;
  final Color colorTwo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorOne.withValues(alpha: 0.7),
              ),
            ),
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorTwo.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Container(
              width: size * 1.6 * 2,
              height: size * 1.6,
              decoration: BoxDecoration(color: AppColors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}
