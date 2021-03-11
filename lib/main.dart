import 'package:flutter/material.dart';
import 'package:flutter_provider_test/CounterModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        builder: (context) => CounterModel(),
        child: MyHomePage(title: 'Flutter Provider Test'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You have pushed the button this many times:"),
              SizedBox(height: 5,),
              Consumer<CounterModel>(
                builder: (context, counterObj, child) {
                  return Text(
                      "${counterObj.counter}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Provider.of<CounterModel>(context).increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(width: 10,),
            FloatingActionButton(
              onPressed: () {
                Provider.of<CounterModel>(context).decrement();
              },
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        ));
  }
}
