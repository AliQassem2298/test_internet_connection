// ignore_for_file: avoid_print
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription connectivitySubscription;
  late StreamSubscription internetSubscription;
  var hasInternetConnection = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen to connectivity changes
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    // Listen to actual internet connection status
    internetSubscription = InternetConnectionChecker()
        .onStatusChange
        .listen(_updateInternetStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    print('update Connection Status: ${result.toString()}');

    if (result == [ConnectivityResult.none] ||
        result == [ConnectivityResult.other]) {
      _showNoInternetSnackbar();
    }
  }

  void _updateInternetStatus(InternetConnectionStatus status) {
    print('update Internet Status: ${status.toString()}');

    if (status == InternetConnectionStatus.disconnected) {
      _showNoInternetSnackbar();
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }

  void _showNoInternetSnackbar() {
    Get.snackbar(
      'Sorry',
      'There is no internet connection..',
      isDismissible: false,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      duration: const Duration(days: 1),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    connectivitySubscription.cancel();
    internetSubscription.cancel();
    super.onClose();
  }
}
