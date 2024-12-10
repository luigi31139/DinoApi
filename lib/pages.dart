import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dinosaurs/RegDino.dart';
import 'package:dinosaurs/list.dart';
import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {

  final navigationkey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screens = [
    const DinoList(),
    const RegDino()
  ];

  @override
  Widget build(BuildContext context) {

    final items = [
      const Icon(Icons.list, size: 40),
      const Icon(Icons.add, size: 40)
    ];

    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) => setState(() => index = value),
        key: navigationkey,
        color: Colors.green,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInToLinear,
        animationDuration: const Duration(milliseconds: 300),
        height: 50,
        items: items
      ),
    );
  }
}