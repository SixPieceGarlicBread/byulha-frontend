import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taba/domain/perfume/perfume.dart';
import 'package:taba/domain/perfume/perfume_provider.dart';
import 'package:taba/screen/main/home/image_rec.dart';

final currentPageProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();
  final int _totalAds = 3; // 총 광고 페이지 수

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<PerfumeList> perfumeList = ref.watch(perfumeListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('로고'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200, // 광고 배너의 높이
            child: PageView.builder(
              controller: _pageController,
              itemCount: _totalAds,
              itemBuilder: (_, index) {
                return Container(
                  color: Colors.grey, // 광고 이미지를 넣을 수 있음
                  child: Center(
                    child: Text('배너 ${index + 1}'),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10), // 페이지 인디케이터와 광고 배너 사이의 간격
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _totalAds,
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: ref.watch(currentPageProvider) == index
                      ? Colors.blue
                      : Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // 버튼 위의 간격
          Center(
            child: ElevatedButton(
              onPressed: () {
                // image_rec.dart 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageRecScreen()),
                );
              },
              child: Text('이미지로 향수 추천받기'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 40),
              ),
            ),
          ),
          SizedBox(height: 20), // 버튼 아래의 간격
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Best Rated'),
            ),
          ),
          Expanded(
            child: perfumeList.when(
              data: (data) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: data.content.length,
                itemBuilder: (context, index) {
                  final perfume = data.content[index];
                  return Card(
                    color: Colors.white, // 카드의 배경색을 흰색으로 설정
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: perfume.thumbnailUrl != null
                              ? Image.network(
                            perfume.thumbnailUrl!,
                            fit: BoxFit.cover,
                          )
                              : const Placeholder(), // 썸네일이 없을 경우 대체 이미지
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(perfume.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text('Rating: ${perfume.rating}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e, stack) => Text('An error occurred: $e'),
            ),
          ),
         

        ],
      ),
    );
  }
}
