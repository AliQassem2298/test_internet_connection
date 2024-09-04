import 'package:flutter/material.dart';
 import 'package:test_internet_connection/view/pages/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});
  static String id = '/PageOne';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, PageTwo.id);
          },
          child: const Text('Go to page two'),
        ),
      ),
    );
  }
}
