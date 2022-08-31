import 'package:flutter/material.dart';
import '../utils/helper_widgets.dart';

class MyAlignTransition extends StatefulWidget {
  const MyAlignTransition({Key? key}) : super(key: key);

  @override
  State<MyAlignTransition> createState() => _MyAlignTransitionState();
}

class _MyAlignTransitionState extends State<MyAlignTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<AlignmentGeometry>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.slowMiddle,
      ),
    );
    // _animation = Tween<AlignmentGeometry>(
    //   begin: Alignment.topLeft,
    //   end: Alignment.bottomRight,
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
          AlignTransition(
            alignment: _animation,
            heightFactor: 2.0,
            widthFactor: 2.0,
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
