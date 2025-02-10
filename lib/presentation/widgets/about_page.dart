import 'package:flutter/material.dart';

class AboutPageWidget extends StatefulWidget {
  const AboutPageWidget({super.key});

  @override
  State<AboutPageWidget> createState() => _AboutPageWidgetState();
}

class _AboutPageWidgetState extends State<AboutPageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Text(
                  'A short description of the movie goes here. Enjoy the show!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Divider(
            height: 1000,
            thickness: 0.2,
            color: Colors.blue,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Text(
                  'A short description of the movie goes here. Enjoy the show!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
