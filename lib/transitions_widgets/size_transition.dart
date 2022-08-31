import 'package:flutter/material.dart';

import '../utils/helper_widgets.dart';

class MySizeTransition extends StatefulWidget {
  const MySizeTransition({Key? key}) : super(key: key);

  @override
  State<MySizeTransition> createState() => _MySizeTransitionState();
}

class _MySizeTransitionState extends State<MySizeTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    // _animation = Tween<double>(begin: 1.0, end: 2.0).animate(_controller);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
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
          SizeTransition(
            sizeFactor: _animation,
            axis: Axis.horizontal,
            child: _buildChild(),
          ),
          addVerticalSpace(30),
          buildButton('Change Size', () {
            _controller.forward();
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
