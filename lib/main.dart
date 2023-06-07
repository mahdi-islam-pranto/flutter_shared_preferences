import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shared Preference"),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      SharedPreferences pre =
                          await SharedPreferences.getInstance();
                      pre.setString("name", "Mahdi Islam Pranto");
                      pre.setInt("age", 25);
                      pre.setBool("married", false);
                      pre.setDouble("price", 240.50);
                      pre.setStringList("tags", ["Flutter", "Dart", "App"]);
                    },
                    child: Text("Save Data")),
                SizedBox(width: 40),
                ElevatedButton(
                    onPressed: () async {
                      SharedPreferences pre =
                          await SharedPreferences.getInstance();
                      String name = pre.getString("name") ?? "";
                      //here "??" is a fallback operator,
                      //if the return is null, it will be the assigned value;

                      int age = pre.getInt("age") ?? 0;
                      bool married = pre.getBool("married") ?? false;
                      double price = pre.getDouble("price") ?? 0.00;
                      List<String> tags = pre.getStringList("tags") ?? [];
                    },
                    child: Text("Get Data"))
              ],
            )));
  }
}
