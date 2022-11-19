import 'package:colorchanger/model/inherited_widget.dart';
import 'package:flutter/material.dart';

///To access the state in [InheritedState]
///.of(...) is like a pathway  where you can
///specify what way you want to access
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ///It should Initialize the [counter] inside the
    ///build widget cause the context is pass along the
    ///[build(BuildContext context)]
    final counter = InheritedState.of(context);

    ///Initialize each [counters]
    final int counter1 = counter.state.counter1;
    final int counter2 = counter.state.counter2;
    final int counter3 = counter.state.counter3;
    final int counter4 = counter.state.counter4;

    ///to test this we change the background color
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Changer'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(
        counter1,
        counter2,
        counter3,
        counter4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Controller1
            colorController(
              childAddCount: FloatingActionButton(
                onPressed: () {
                  counter.addCounter1();
                },
                child: const Icon(Icons.add),
              ),
              text: 'Alpha',
              childSubCount: FloatingActionButton(
                onPressed: () {
                  counter.subtractCounter1();
                },
                child: const Icon(Icons.remove),
              ),
            ),

            ///Controller2
            colorController(
              childAddCount: FloatingActionButton(
                onPressed: () {
                  counter.addCounter2();
                },
                child: const Icon(Icons.add),
              ),
              text: 'Red',
              childSubCount: FloatingActionButton(
                onPressed: () {
                  counter.subtractCounter2();
                },
                child: const Icon(Icons.remove),
              ),
            ),

            ///Controller3
            colorController(
              childAddCount: FloatingActionButton(
                onPressed: () {
                  counter.addCounter3();
                },
                child: const Icon(Icons.add),
              ),
              text: 'Green',
              childSubCount: FloatingActionButton(
                onPressed: () {
                  counter.subtractCounter3();
                },
                child: const Icon(Icons.remove),
              ),
            ),

            ///Controller4
            colorController(
              childAddCount: FloatingActionButton(
                onPressed: () {
                  counter.addCounter4();
                },
                child: const Icon(Icons.add),
              ),
              text: 'Blue',
              childSubCount: FloatingActionButton(
                onPressed: () {
                  counter.subtractCounter4();
                },
                child: const Icon(Icons.remove),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Create a custom widget for the controller
  Widget colorController({
    required final childAddCount,
    required final text,
    required final childSubCount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ///for Incrementation
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: childAddCount,
        ),
        //text
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),

        ///for Decrementation
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: childSubCount,
        ),
      ],
    );
  }
}
