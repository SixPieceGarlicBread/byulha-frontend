import 'package:taba/domain/perfume/perfume.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider<Repository>((ref) => Repository());

class Repository {
  final Dio _dio = Dio();

  Future<PerfumeList> getPerfumeList() async {
    final response = await _dio.get(
      'https://byulha.life/api/perfume?page=0&size=20',
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );
    await Future.delayed(Duration(seconds: 2));
    return PerfumeList.fromJson(response.data);
  }
}
