import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  bool isData = false;
  int _counter = 0;
  String nameG = "";
  int? ageG;
  bool? marriedG;
  double? priceG;
  List<String> tagsG = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shared Preference"),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        SharedPreferences shaPre =
                            await SharedPreferences.getInstance();
                        shaPre.setString("name", "Mahdi Islam Pranto");
                        shaPre.setInt("age", 25);
                        shaPre.setBool("married", false);
                        shaPre.setDouble("price", 240.50);
                        shaPre
                            .setStringList("tags", ["Flutter", "Dart", "App"]);
                        print(shaPre.getString(
                            'name')); //to check if data is geting or not
                      },
                      child: Text("Save Data")),
                  SizedBox(height: 40),
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

                        setState(() {
                          nameG = name;
                          ageG = age;
                          marriedG = married;
                          priceG = price;
                          tagsG = tags;
                          isData = true;
                        });
                      },
                      child: Text("Get Data")),
                  SizedBox(height: 40),
                  Visibility(
                    visible: isData,
                    child: Column(
                      children: [
                        // show all datas as string
                        Text("All Datas"),
                        Text('Name: ${nameG}'),
                        Text('Age: ${ageG}'),
                        Text('Married: ${marriedG}'),
                        Text('Price: ${priceG}'),

                        // show list
                        // ListView.builder(
                        //   itemCount: tagsG.length,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return ListTile(
                        //       title: Text(tagsG[index]),
                        //     );
                        //   },
                        // )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
