import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FadeTransitionWidget extends StatefulWidget {
  final Widget firstChild;
  final Widget secondChild;
  final Duration duration;
  final bool condition;

  const FadeTransitionWidget({super.key, 
    required this.firstChild,
    required this.secondChild,
    required this.condition,
    this.duration = const Duration(milliseconds: 500),
  });
  
  @override
  State<StatefulWidget> createState() => _FadeTransitionWidgetState();

 
}

class _FadeTransitionWidgetState extends State<FadeTransitionWidget>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        AnimatedOpacity(
          opacity: widget.condition ? 0 : 1,
          duration: widget.duration,
          child: widget.firstChild
        ),
        AnimatedOpacity(
          opacity: widget.condition ? 1 : 0,
          duration: widget.duration,
          child: widget.secondChild
        ),
      ],
    );
  }
}