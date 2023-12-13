import 'package:flutter/material.dart';

class courseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('course Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/1.png', // Adjust the path accordingly
              width: 200.0, // Adjust the width as needed
              height: 200.0, // Adjust the height as needed
            ),
            SizedBox(height: 16.0),
            Text(
              'course',
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
