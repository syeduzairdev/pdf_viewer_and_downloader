import 'package:flutter/material.dart';
import 'dart:io';

import 'package:pdf_viewer_and_downloader_example/screens/pdf_viewer/pdf_viewer_page.dart';
import 'package:pdf_viewer_and_downloader_example/splash_screen.dart';

import 'services/pdf_view_download_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Pdf Viewer & Downloader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}
