import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLattie extends StatelessWidget {
  const LoadingLattie({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Lottie.asset('assets/lattie/Animation-1735027258837.json'),
    );
  }
}
