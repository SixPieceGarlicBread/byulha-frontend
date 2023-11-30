import 'package:flutter/material.dart';

class FillterRecScreen extends StatelessWidget {
  const FillterRecScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('분류별로 향수추천'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Text('분류로 향수를 추천하는 페이지입니다.'),
      ),
    );
  }
}
