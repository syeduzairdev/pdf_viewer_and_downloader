import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../pdf_viewer/pdf_viewer_page.dart';
import '../../services/pdf_view_download_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Pdf Viewer & Downloader'),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amber),
                    ),
                    onPressed: () async {
                      String url = '';
                      final file = await PdfViewAndDownload().pickFile();
                      if (file == null) return;
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PdfViewerPage(
                          file: file,
                          url: url,
                        ),
                      ));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Press to Pick File from Local',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amber),
                    ),
                    onPressed: () async {
                      const url =
                          "https://hblassetmanagement.s3.amazonaws.com/1674233322347_aliya+(1).pdf";
                      final file =
                          await PdfViewAndDownload().loadPdfFromNetwork(url);
                      if (file == null) return;

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PdfViewerPage(
                            file: file,
                            url: url,
                          ),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Press to Load File from Network',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //final file = File('example.pdf');
  //await file.writeAsBytes(await pdf.save());

}
