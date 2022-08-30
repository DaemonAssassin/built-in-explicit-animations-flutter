import 'package:flutter/material.dart';

import '../utils/helper_widgets.dart';

class MyDecoratedBoxTransition extends StatefulWidget {
  const MyDecoratedBoxTransition({Key? key}) : super(key: key);

  @override
  State<MyDecoratedBoxTransition> createState() =>
      _MyDecoratedBoxTransitionState();
}

class _MyDecoratedBoxTransitionState extends State<MyDecoratedBoxTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Decoration> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = _getTween().animate(_controller);
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
          DecoratedBoxTransition(
            decoration: _animation,
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
        color: Colors.white,
      );

  Tween<Decoration> _getTween() {
    return DecorationTween(
      begin: BoxDecoration(
        border: Border.all(),
      ),
      end: const BoxDecoration(
        borderRadius: BorderRadius.zero,
        boxShadow: [BoxShadow(color: Colors.black, offset: Offset(3, 3))],
      ),
    );
  }
}
