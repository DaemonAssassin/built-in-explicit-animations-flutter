import 'package:flutter/material.dart';

import '../utils/helper_widgets.dart';

class MyRotationTransition extends StatefulWidget {
  const MyRotationTransition({Key? key}) : super(key: key);

  @override
  State<MyRotationTransition> createState() => _MyRotationTransitionState();
}

class _MyRotationTransitionState extends State<MyRotationTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    // _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotationTransition(
            turns: _animation,
            alignment: Alignment.center,
            child: _buildChild(),
          ),
          addVerticalSpace(30),
          buildButton(
            'Fade',
            () {
              _controller.forward();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChild() => Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
      );
}
