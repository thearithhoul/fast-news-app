import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Core/Constants/color_constants.dart';

class CircleButton extends StatefulWidget {
  final String svgIcon;
  final VoidCallback onPressed;
  const CircleButton({
    super.key,
    required this.svgIcon,
    required this.onPressed,
  });

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _ontap() async {
    _controller.forward();
    Future.delayed(
      Durations.medium1,
      () => _controller.reverse(),
    );
    widget.onPressed();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _ontap,
        onTapUp: _onTapUp,
        onTapDown: _onTapDown,
        onTapCancel: _onTapCancel,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: const [
                    Colors.black12,
                    ColorConstants.buttonColor,
                  ], stops: [
                    _animation.value,
                    0
                  ]),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0,
                      blurRadius: 5,
                      blurStyle: BlurStyle.inner,
                    )
                  ]),
              child: SvgPicture.asset(
                widget.svgIcon,
                color: Colors.black,
              ),
            );
          },
        ));
  }
}
