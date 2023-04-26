import 'package:flutter/material.dart';
import 'dart:async';

class Home extends StatefulWidget {
  final Widget child;
  final int dalay;
  const Home({super.key, required this.child,required this.dalay});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Offset> animationOffest;
  @override

  void initState(){
    super.initState();
    animationController= AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500)
    );

    final curve= CurvedAnimation(parent: animationController, curve: Curves.decelerate);

    animationOffest = Tween<Offset>(
      begin: const Offset(0.0,0.5),
      end: Offset.zero,
    ).animate(curve);

    Timer(Duration(milliseconds: widget.dalay),(){
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SlideTransition(
        position: animationOffest,
        child: widget.child
        ),
      );
  }
}