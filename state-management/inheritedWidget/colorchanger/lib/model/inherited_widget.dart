import 'package:colorchanger/model/model.dart';
import 'package:flutter/material.dart';

///Since the [InheritedWidget] is an Immutable.
///We can create a stateful widget [StateInheritedWidget]
///therefore inside the stateful widget
///we can perform some operation where we can change the state
///inside [StateInheritedWidget] before
///introducing to [InheritedState] that will extends [InheritedWidget].
class StateInheritedWidget extends StatefulWidget {
  ///Initialize [child] as widget and mark as final
  ///modify the constructor that accepts the [key] and [child]
  final Widget child;
  const StateInheritedWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<StateInheritedWidget> createState() => _StateInheritedWidgetState();
}

class _StateInheritedWidgetState extends State<StateInheritedWidget> {
  ///Initialize a [state] object as RootState
  ///Initialize a [colorGage] object
  RootState state = const RootState();
  int colorGage = 5;

  ///Create a function that will allow to increment the counter
  ///and set the new incremented value/counter

  ///Counter1
  void addCounter1() {
    final counter1 = state.counter1 + colorGage;
    final newCounterState = state.copy(counter1: counter1);
    setState(() {
      state = newCounterState;
    });
  }

  ///Counter2
  void addCounter2() {
    final counter2 = state.counter2 + colorGage;
    final newCounterState = state.copy(counter2: counter2);
    setState(() {
      state = newCounterState;
    });
  }

  ///Counter3
  void addCounter3() {
    final counter3 = state.counter3 + colorGage;
    final newCounterState = state.copy(counter3: counter3);
    setState(() {
      state = newCounterState;
    });
  }

  ///Counter4
  void addCounter4() {
    final counter4 = state.counter4 + colorGage;
    final newCounterState = state.copy(counter4: counter4);
    setState(() {
      state = newCounterState;
    });
  }

  ///Create a function that will allow to decrement the counter
  ///and set the new decremented value/counter

  ///Counter1
  void subtractCounter1() {
    final counter1 = state.counter1 - colorGage;
    if (counter1 >= 0) {
      final newCounterState = state.copy(counter1: counter1);
      setState(() {
        state = newCounterState;
      });
    }
  }

  ///Counter2
  void subtractCounter2() {
    final counter2 = state.counter2 - colorGage;
    if (counter2 >= 0) {
      final newCounterState = state.copy(counter2: counter2);
      setState(() {
        state = newCounterState;
      });
    }
  }

  ///Counter3
  void subtractCounter3() {
    final counter3 = state.counter3 - colorGage;
    if (counter3 >= 0) {
      final newCounterState = state.copy(counter3: counter3);
      setState(() {
        state = newCounterState;
      });
    }
  }

  ///Counter4
  void subtractCounter4() {
    final counter4 = state.counter4 - colorGage;
    if (counter4 >= 0) {
      final newCounterState = state.copy(counter4: counter4);
      setState(() {
        state = newCounterState;
      });
    }
  }

  ///In this buildwidget use the [InheritedState]
  ///this widget will be assign to the top level of
  ///widget tree o that the data or state will
  ///be available to the child widget tree
  @override
  Widget build(BuildContext context) {
    return InheritedState(
      state: state,
      stateWidget: this,
      child: widget.child,
    );
  }
}

///We will create the InheritedState()
///[InheritedState] an object that will extends [InheritedWidget]
///this will act like a provider in a way and
///hold immutable state
class InheritedState extends InheritedWidget {
  final RootState state;
  final _StateInheritedWidgetState stateWidget;

  const InheritedState({
    Key? key,
    required Widget child,
    required this.state,
    required this.stateWidget,
  }) : super(
          key: key,
          child: child,
        );

  ///Create [of] of(BuildContext context)
  ///this function will give the access to the state pass down to the context
  static _StateInheritedWidgetState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedState>()!
        .stateWidget;
  }

  ///@override updateShouldNotify function
  ///this function notify if the state change or not
  @override
  bool updateShouldNotify(covariant InheritedState oldWidget) {
    return state != oldWidget.state;
  }
}
