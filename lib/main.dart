import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:test_internet_connection/controller/connectivity_controller.dart';
import 'package:test_internet_connection/view/pages/page_one.dart';
import 'package:test_internet_connection/view/pages/page_two.dart';
 

void main() {
  runApp(const TestInternetApp());
  Get.put<ConnectivityController>(ConnectivityController(), permanent: true);
}

class TestInternetApp extends StatelessWidget {
  const TestInternetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: PageOne.id, page: () => const PageOne()),
        GetPage(name: PageTwo.id, page: () => const PageTwo()),
      ],
      initialRoute: PageOne.id,
    );
  }
}
