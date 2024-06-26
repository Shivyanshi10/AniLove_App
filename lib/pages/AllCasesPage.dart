import 'package:flutter/material.dart';

class AllCasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Cases'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return buildCaseCard(
            index % 2 == 0
                ? 'assets/u1.jpg'
                : 'assets/u2.jpeg', // Alternate between dog and cat images
            index % 2 == 0
                ? 'Dog'
                : 'Cat', // Alternate between dog and cat descriptions
            'Location ${index + 1}',
            index % 2 == 0, // Alternate between processing and completed status
            index == 0
                ? '1 hour ago'
                : index == 1
                    ? '2 days ago'
                    : index == 2
                        ? '3 weeks ago'
                        : '1 month ago', // Random posting times
          );
        },
      ),
    );
  }

  Widget buildCaseCard(String imagePath, String animal, String location,
      bool isProcessing, String postedTime) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('$animal Case'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Location: $location'),
                  SizedBox(height: 5.0),
                  Text('Posted: $postedTime'),
                ],
              ),
              trailing:
                  isProcessing ? Icon(Icons.watch_later) : Icon(Icons.done),
            ),
          ),
        ],
      ),
    );
  }
}
