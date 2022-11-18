import 'package:flutter/material.dart';

class InnerInheritedWidget extends InheritedWidget {
  final String name;
  final Color color;

  const InnerInheritedWidget({
    super.key,
    required this.name,
    required this.color,
    required super.child,
  });

  static InnerInheritedWidget of(BuildContext context) {
    final InnerInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<InnerInheritedWidget>();
    return result!;
  }

  @override
  bool updateShouldNotify(InnerInheritedWidget oldWidget) =>
      name != oldWidget.name && color != oldWidget.color;
}
