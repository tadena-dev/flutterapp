///Create [RootState] class. This object will be the model
///Create a [copy] function where can copy the newState
///of each counters
class RootState {
  final int counter1;
  final int counter2;
  final int counter3;
  final int counter4;

  ///Constructor
  const RootState({
    this.counter1 = 0,
    this.counter2 = 0,
    this.counter3 = 0,
    this.counter4 = 0,
  });

  //[copy] function
  RootState copy({
    int? counter1,
    int? counter2,
    int? counter3,
    int? counter4,
  }) {
    return RootState(
      counter1: counter1 ?? this.counter1,
      counter2: counter2 ?? this.counter2,
      counter3: counter3 ?? this.counter3,
      counter4: counter4 ?? this.counter4,
    );
  }
}
