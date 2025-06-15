// ignore_for_file: avoid_print, prefer_const_constructors

// async // await

Future<Map<String, dynamic>> fetchUserData(String name) async {
  await Future.delayed(Duration(seconds: 3));

  throw Exception("FAILED!");

  return {'name': name, 'age': 25};
}

// then/catchError & async/await
void main() async {
  try {
    print("Starting request to backend...");
    final johnData = await fetchUserData("John");
    print("result-1: ${johnData['name']}");

    final davidData = await fetchUserData("David");
    print("result-2: ${davidData['name']}");

    final justinData = await fetchUserData("Justin");
    print("result-2: ${justinData['name']}");
  } catch (err) {
    print("ERROR: $err");
  }
}



/* 
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print("MyApp Rebuilt!");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("State Management")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StaticWidget(),
              SizedBox(height: 10),
              Text(
                "Counter: $counter",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Text("Increment"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StaticWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("StaticWidget Rebuilt!");
    return Text("I am Static Widget");
  }
}




void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Counter(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("MyApp Rebuilt!");
    final counter = Provider.of<Counter>(context, listen: false);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("State Management")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StaticWidget(),
              SizedBox(height: 10),
              Consumer<Counter>(builder: (ctx, countModel, _) {
                print("Counter Text Rebuilt!");
                return Text(
                  "Counter: ${countModel.count}",
                  style: TextStyle(fontSize: 20),
                );
              }),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  counter.increment();
                },
                child: Text("Increment"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StaticWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("StaticWidget Rebuilt!");
    return Text("I am Static Widget");
  }
}




import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}





*/