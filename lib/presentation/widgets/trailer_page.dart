import 'package:flutter/material.dart';

class TrailerPageWidget extends StatefulWidget {
  const TrailerPageWidget({super.key});

  @override
  State<TrailerPageWidget> createState() => _TrailerPageWidgetState();
}

class _TrailerPageWidgetState extends State<TrailerPageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ClipRRect(),
    );
  }
}
