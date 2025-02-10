import 'package:flutter/material.dart';

class MoreMoviesWidget extends StatefulWidget {
  const MoreMoviesWidget({super.key});

  @override
  State<MoreMoviesWidget> createState() => _MoreMoviesWidgetState();
}

class _MoreMoviesWidgetState extends State<MoreMoviesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Stack(
                children: [
                  Container(
                    width: 250,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment(-0.9, -0.9),
                      child: Chip(
                        elevation: 20,
                        avatar: Icon(Icons.hd),
                        label: Text(''),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Text(
                      'Movie $index',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
