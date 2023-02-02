import 'package:flutter/material.dart';
import 'package:mrworker/Screens/data/network_type.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: NetworkTypeAheadPage(),
    );
  }
}
