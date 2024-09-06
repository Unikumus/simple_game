import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  static const routeName = 'empty_screen';
  static const routePath = 'empty_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(child: Text('EmptyScreen')),
          Spacer(),
        ],
      ),
    );
  }
}
