import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class GuidelinesPdf extends StatefulWidget {
  @override
  _GuidelinesPdfState createState() => _GuidelinesPdfState();
}

class _GuidelinesPdfState extends State<GuidelinesPdf> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    fromAsset('assets/pdf/Guidelines.pdf', 'Guidelines.pdf').then((f) {
      setState(() {
        localPath = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    final data = await rootBundle.load(asset);
    final bytes = data.buffer.asUint8List();
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GuideLines'),
      ),
      body: localPath != null
          ? PDFView(
              filePath: localPath,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
