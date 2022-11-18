import 'package:flutter/material.dart';

class OuterInheritedWidget extends InheritedWidget {
  final String name;
  final Color color;

  const OuterInheritedWidget({
    super.key,
    required this.name,
    required this.color,
    required super.child,
  });

  static OuterInheritedWidget of(BuildContext context) {
    final OuterInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<OuterInheritedWidget>();
    return result!;
  }

  @override
  bool updateShouldNotify(OuterInheritedWidget oldWidget) =>
      name != oldWidget.name && color != oldWidget.color;
}
