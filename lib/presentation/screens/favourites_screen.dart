import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left)),
        title: const Text(
          'Favourites',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
