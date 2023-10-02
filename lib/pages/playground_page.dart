import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    String imageLink =
        "https://img.freepik.com/free-photo/white-horse-runs-beach_1340-34263.jpg";
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SizedBox(
        width: double.infinity,
        child: Container(
          child: Column(
            children: [
              Container(
                width: 300,
                height: 300,
                child: Stack(
                  children: [
                    Image.network(
                      imageLink,
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.red.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('Horse'), Text('Racing Horse')],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 40,
                        right: 40,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
