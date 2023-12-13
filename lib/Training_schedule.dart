import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training_schedule'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio:
                    1.0, // Set the aspect ratio to 1.0 for a square shape
                child: Image.asset(
                  'images/map.png',
                  fit: BoxFit
                      .cover, // Ensure the image covers the entire container
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Training_schedule ',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
