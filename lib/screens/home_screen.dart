import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int qty = 0;
  void increase() {
    qty++;
    setState(() {});
    print(qty);
  }

  void decrease() {
    qty--;
    setState(() {});
    print(qty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Text(
              qty.toString(),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: decrease, icon: Icon(Icons.remove)),
              IconButton(onPressed: increase, icon: Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}
