import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          title: Text('Responsive Layout'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 500) {
                return GridData();
              } else {
                return ListData();
              }
            },
          ),
        ));
  }
}

class ListData extends StatelessWidget {
  const ListData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.person),
          trailing: Icon(Icons.waves),
          title: Text('Person ${index + 1}'),
        );
      },
    );
  }
}

class GridData extends StatelessWidget {
  const GridData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 5,
      children: List.generate(20, (index) {
        return ListTile(
          leading: Icon(Icons.person),
          trailing: Icon(Icons.waves),
          title: Text('Person ${index + 1}'),
        );
      }),
    );
  }
}
