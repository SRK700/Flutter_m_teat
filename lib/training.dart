import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TrainingScreen extends StatefulWidget {
  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  List<dynamic> trainingData = [];
  TextEditingController courseController = TextEditingController();
  TextEditingController schoolController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch training data when the page is created
    fetchTrainingData();
  }

  Future<void> fetchTrainingData() async {
    final apiUrl = 'http://localhost:81/crru_API/training.php';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the data
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          trainingData = data;
        });
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load training data');
      }
    } catch (error) {
      // Handle errors during the HTTP request
      print('Error: $error');
    }
  }

  Future<void> submitTrainingData() async {
    final apiUrl = 'http://localhost:81/crru_API/training.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'course': courseController.text,
          'school': schoolController.text,
        },
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, fetch updated data
        await fetchTrainingData();
        // Clear text controllers after submission
        courseController.clear();
        schoolController.clear();
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to submit training data');
      }
    } catch (error) {
      // Handle errors during the HTTP request
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: courseController,
              decoration: InputDecoration(labelText: 'Course'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: schoolController,
              decoration: InputDecoration(labelText: 'School'),
            ),
          ),
          ElevatedButton(
            onPressed: submitTrainingData,
            child: Text('Submit Data'),
          ),
          SizedBox(height: 16.0),
          trainingData.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: trainingData.length,
                    itemBuilder: (context, index) {
                      final training = trainingData[index];
                      return ListTile(
                        title: Text(training['course']),
                        subtitle: Text(training['school']),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TrainingScreen(),
  ));
}
