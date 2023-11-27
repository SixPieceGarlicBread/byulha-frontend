/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png'), // 로고 이미지
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // 즐겨찾기 페이지로 이동
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // 상단 영역 (로고 및 즐겨찾기)
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/logo.png'), // 로고 이미지
            ),
          ),
          // 중단 영역 (이미지 슬라이더)
          Expanded(
            flex: 2,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                _buildPageItem('lib/screen/main/home/turtle.jpeg'),
                _buildPageItem('lib/screen/main/home/꼬부기선글라스.jpeg'),
                _buildPageItem('lib/screen/main/home/꼬부기웃음.jpeg'),
                // 추가 이미지 페이지
              ],
            ),
          ),
          // 하단 영역 (버튼)
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              children: <Widget>[
                _buildButton('이미지로 향수찾기', Icons.image),
                _buildButton('분류별로 향수찾기', Icons.category),
                _buildButton('버튼 3', Icons.star),
                _buildButton('버튼 4', Icons.star_border),
              ],
            ),
          ),
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

  Widget _buildPageItem(String imagePath) {
    return GestureDetector(
      onTap: () {
        // 각 이미지를 클릭하면 다른 페이지로 이동
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          primary: Colors.,
          padding:
              EdgeInsets.symmetric(vertical: 24), // Provide vertical padding
        ),
        child: Text(title, style: TextStyle(fontSize: 20)),
        onPressed: () {
          // 추천 로직 수행
        },
      ),
    );
  }
}
