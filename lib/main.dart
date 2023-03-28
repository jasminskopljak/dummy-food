import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DummyFood Menu',
      home: DummyFoodHome(),
    );
  }
}

class DummyFoodHome extends StatelessWidget {
  const DummyFoodHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("DummyFood Menu"),
            backgroundColor: Colors.deepOrangeAccent),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return _buildWiderContainers();
            } else {
              return _buildMobileContainers(context);
            }
          },
        ));
  }

  Widget _buildWiderContainers() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red,
          ),
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileContainers(context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductRoute()),
        );
      },
      child: Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: const <Widget>[
          ListTile(
            leading: Icon(Icons.fastfood, color: Colors.deepOrangeAccent),
            title: Text(
              'Burgers',
              style: TextStyle(fontSize: 22.0),
            ),
            subtitle: Text('Try the best burgers in the world',
                style: TextStyle(fontSize: 17)),
          ),
        ]),
      ),
    );
  }
}

class ProductRoute extends StatelessWidget {
  const ProductRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pruduct page'),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back'),
        )));
  }
}
