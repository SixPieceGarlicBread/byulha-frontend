import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png'), // 로고 이미지
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          // 상단 영역 (로고)
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/logo.png'), // 로고 이미지
            ),
          ),
          // 중단 영역 (버튼)
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              children: <Widget>[
                _buildButton('이미지로 향수찾기', Icons.image),
                _buildButton('분류별로 향수찾기', Icons.category),
                _buildButton('버튼 3', Icons.star), // 예시 버튼
                _buildButton('버튼 4', Icons.star_border), // 예시 버튼
              ],
            ),
          ),
          // 하단 영역 (네비게이션 바) 제거됨
        ],
      ),
    );
  }

  Widget _buildButton(String title, IconData icon) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 50),
          Text(title),
        ],
      ),
    );
  }
}
