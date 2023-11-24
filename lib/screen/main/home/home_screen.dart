import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../modules/orb/components/components.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return OrbScaffold(

    );
  }


}