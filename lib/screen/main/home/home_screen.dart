import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'filter_rec.dart';
import 'image_rec.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<String> notes = [
    'amber',
    'citrus',
    'floral',
    'leather',
    'woody',
    'chypre',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TABA'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Select Category',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return _buildNoteCircle(notes[index]);
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0), // Reduce vertical padding
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            _buildRecommendationButton('이미지로 향수추천'),
            _buildRecommendationButton('분류별로 향수추천'),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteCircle(String note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 40,
        child: Text(note),
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildRecommendationButton(String title) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          padding: EdgeInsets.symmetric(vertical: 24),
        ),
        child: Text(title, style: TextStyle(fontSize: 20)),
        onPressed: () {
          if (title == '이미지로 향수추천') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ImageRecScreen()),
            );
          } else if (title == '분류별로 향수추천') {
            Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => const FillterRecScreen()),

            );
          }
        },
      ),
    );
  }
}
