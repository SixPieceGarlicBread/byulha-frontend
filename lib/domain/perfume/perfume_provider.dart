import 'dart:async';

import 'package:taba/domain/perfume/perfume.dart';
import 'package:taba/domain/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final perfumeListProvider =
    AsyncNotifierProvider<PerfumeListNotifier, PerfumeList>(
        () => PerfumeListNotifier());

class PerfumeListNotifier extends AsyncNotifier<PerfumeList> {
  void getPerfumeList() async {
    state = await AsyncValue.guard(
        () => ref.read(repositoryProvider).getPerfumeList());
  }

  @override
  FutureOr<PerfumeList> build() async {
    // TODO: implement build
    getPerfumeList();
    print('error: ${state.error}');
    return state.value!;
  }
}
