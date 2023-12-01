//image_rec.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageRecScreen extends StatefulWidget {
  const ImageRecScreen({Key? key}) : super(key: key);

  @override
  _ImageRecScreenState createState() => _ImageRecScreenState();
}

class _ImageRecScreenState extends State<ImageRecScreen> {
  final PageController _pageController = PageController();
  final int _totalSlides = 3; // 총 튜토리얼 페이지 수
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    // 이미지 픽커로 이미지를 가져옵니다.
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    // 선택된 이미지를 다루는 로직을 여기에 추가하세요.
  }

  @override
  Widget build(BuildContext context) {
    // 디바이스 화면 높이의 2/3 계산
    double tutorialHeight = MediaQuery.of(context).size.height * 2 / 3;

    return Scaffold(
      appBar: AppBar(
        title: Text('이미지로 향수 추천'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: tutorialHeight, // 튜토리얼 화면의 높이 설정
            child: PageView.builder(
              controller: _pageController,
              itemCount: _totalSlides,
              itemBuilder: (_, index) {
                return Container(
                  color: Colors.grey,
                  child: Center(
                    child: Text('튜토리얼 ${index + 1}'),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('추천 시작하기'),
          ),
        ],
      ),
    );
  }
}
