import 'package:flutter/material.dart';
import '../utils/helper_widgets.dart';

class MySlideTransition extends StatefulWidget {
  const MySlideTransition({Key? key}) : super(key: key);

  @override
  State<MySlideTransition> createState() => _MySlideTransitionState();
}

class _MySlideTransitionState extends State<MySlideTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<Offset>(
      begin: const Offset(-2.0, 2.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.slowMiddle,
      ),
    );
    // _animation = Tween<Offset>(
    //   begin: const Offset(-2.0, 0.0),
    //   end: const Offset(0.0, 0.0),
    // ).animate(_controller);
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
          SlideTransition(
            position: _animation,
            child: _buildChild(),
          ),
          addVerticalSpace(30),
          buildButton(
            'Change Size',
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
