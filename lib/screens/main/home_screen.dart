import 'package:flutter/material.dart';
import 'package:sidipo_apps/components/widget/scaffold_wigdet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWigdet(body: Center(child: Text('Home Screen')));
  }
}
