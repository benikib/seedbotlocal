import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestPage extends ConsumerStatefulWidget {
  const TestPage({super.key});

  @override
  ConsumerState createState() => _testpageState();
}

class _testpageState extends ConsumerState<TestPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Seedbot"),
      ),
    );
  }
}
