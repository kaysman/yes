import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppObserver extends StatefulWidget {
  const AppObserver({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  State<AppObserver> createState() => _AppObserverState();
}

class _AppObserverState extends State<AppObserver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [/* authlistener */],
        child: widget.child!,
      ),
    );
  }
}
