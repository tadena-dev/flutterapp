import 'package:flutter/material.dart';
import 'package:inheritedwidget/inner_widget.dart';
import 'package:inheritedwidget/outer_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inhirited Widget'),
        centerTitle: true,
      ),
      body: const OuterWidget(),
    );
  }
}

///Outer inherited widget
class OuterWidget extends StatelessWidget {
  const OuterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OuterInheritedWidget(
        name: 'Outer Inherited Widget',
        color: Colors.blueGrey,
        child: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Container(
                      width: 300,
                      height: 150,
                      color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(OuterInheritedWidget.of(context).name),
                          Container(
                            width: 200,
                            height: 20,
                            color: OuterInheritedWidget.of(context).color,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const InnerWidget(),
                ],
              ),
            );
          },
        ));
  }
}

///Inner inherited widget
class InnerWidget extends StatelessWidget {
  const InnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InnerInheritedWidget(
      name: 'Inner Inherited Widget',
      color: Colors.redAccent,
      child: Builder(
        builder: (context) {
          return SizedBox(
            child: Container(
              width: 300,
              height: 150,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(InnerInheritedWidget.of(context).name),
                  Container(
                    width: 200,
                    height: 20,
                    color: InnerInheritedWidget.of(context).color,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
