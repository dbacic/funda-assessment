import 'dart:math';

import 'package:flutter/material.dart';

import 'property_details/property_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // property ids to be ushed for frandomly showing the detail screen
  // can be moved to repository that will provide these random ids
  final _properties = [
    'ffff83cc-ffca-4780-8bbc-9635a0b400a3',
    'c97e6e45-d1fb-471d-89d4-9bc484ed876c',
    'a8e96312-88bb-407c-b76f-ec4975ce3b8f',
    '25ec963f-68d7-47cc-bef5-5da03a80db3d',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => _openRandomPropertyDetails(),
            child: Text("Open my dream property!"),
          ),
        ),
      ),
    );
  }

  void _openRandomPropertyDetails() {
    final randomNumber = Random().nextInt(_properties.length);
    final randomPropertyId = _properties[randomNumber];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PropertyDetailsScreen(randomPropertyId),
      ),
    );
  }
}
