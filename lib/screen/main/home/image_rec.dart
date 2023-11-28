import 'package:flutter/material.dart';

class ImageRecScreen extends StatelessWidget {
  const ImageRecScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이미지로 향수 추천'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Text('이미지로 향수를 추천하는 페이지입니다.'),
      ),
    );
  }
}
