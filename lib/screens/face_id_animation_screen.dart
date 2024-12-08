import 'package:flutter/material.dart';

import 'face_id_animation_controller.dart';
import 'face_id_painter.dart';

class FaceIdAnimationScreen extends StatefulWidget {
  const FaceIdAnimationScreen({super.key});

  @override
  State<FaceIdAnimationScreen> createState() => _FaceIdAnimationScreen();
}

class _FaceIdAnimationScreen extends State<FaceIdAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final FaceIdAnimationController _faceIdAnimationController;

  @override
  void initState() {
    _faceIdAnimationController = FaceIdAnimationController(
      animationController: AnimationController(
        duration: const Duration(seconds: 4),
        vsync: this,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _faceIdAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _faceIdAnimationController
        ..reset()
        ..fordward(),
      child: Scaffold(
        body: Center(
          child: CustomPaint(
            size: const Size(200, 200),
            painter: FaceIdPainter(
              controller: _faceIdAnimationController,
            ),
          ),
        ),
      ),
    );
  }
}
