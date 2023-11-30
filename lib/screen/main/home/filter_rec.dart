import 'package:flutter/material.dart';
import  'package:flutter_riverpod/flutter_riverpod.dart';


class FilterRecScreen extends StatelessWidget {
  const FilterRecScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: perfumeList.when(data: (perfumeList) {
        return ListView.builder(
          itemCount: perfumeList.size,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(perfumeList.content[index].name),
            );
          },
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }, error: (error, stackTrace) {
        return const Center(
          child: Text('Error'),
        );
      }),
    );
  }
}
