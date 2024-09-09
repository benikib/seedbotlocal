import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoCmdPage extends ConsumerStatefulWidget {
  const AutoCmdPage({super.key});

  @override
  ConsumerState createState() => _AutoCmdPageState();
}

class _AutoCmdPageState extends ConsumerState<AutoCmdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Seedbot"),

    ),
      body: SingleChildScrollView(

        child: Container(),
      ),
    );
  }
}
