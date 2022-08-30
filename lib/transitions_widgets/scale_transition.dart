import 'package:flutter/material.dart';

import '../utils/helper_widgets.dart';

class MyScaleTransition extends StatefulWidget {
  const MyScaleTransition({Key? key}) : super(key: key);

  @override
  State<MyScaleTransition> createState() => _MyScaleTransitionState();
}

class _MyScaleTransitionState extends State<MyScaleTransition>
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
    //! Both down lines do same things
    // _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
    // _animation = _controller.drive<double>(Tween<double>(begin: 1.0, end: 1.2));

    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _animation,
            alignment: Alignment.center,
            child: _buildChild(),
          ),
          addVerticalSpace(30),
          buildButton('Scale', () {
            // _controller.forward();
          }),
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
