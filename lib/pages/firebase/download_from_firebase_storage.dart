import 'dart:io';
// import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

class DownloadFilePage extends StatefulWidget {
  const DownloadFilePage({super.key});

  @override
  State<DownloadFilePage> createState() => _DownloadFilePageState();
}

class _DownloadFilePageState extends State<DownloadFilePage> {
  late Future<ListResult> futureFiles;

  Map<int, double> downloadProgress = {};



  @override
  void initState() {
    super.initState();
    futureFiles = FirebaseStorage.instance.ref("/renting").listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.go("/Home"),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: FutureBuilder<ListResult>(
          future: futureFiles,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              final files = snapshot.data!.items;
              return ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    final file = files[index];
                    double? progress = downloadProgress[index];
                    return ListTile(
                      title: Text(file.name),
                      trailing: IconButton(
                          onPressed: () => downLoadFile2(index, file),
                          icon: const Icon(Icons.download)),
                      subtitle: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.black,
                      ),
                    );
                  });
            }
            return const Center(
              child: Text("An error occured"),
            );
          }),
    );
  }

  Future downLoadFile(Reference ref) async {
    final dir = await getApplicationSupportDirectory();
    final file = File('${dir.path}/${ref.name}');

    await ref.writeToFile(file);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Downloaded ${ref.name}")));
  }

  Future downLoadFile2(index, Reference ref) async {
    final url = await ref.getDownloadURL();

    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/${ref.name}';

    await Dio().downloadUri(Uri.parse(url), path,
        onReceiveProgress: (recieved, total) {
      double progress = recieved / total;
      setState(() {
        downloadProgress[index] = progress;
      });
    });

    if (url.contains(('.mp4'))) {
      await GallerySaver.saveVideo(path, toDcim: true);
    } else {
      await GallerySaver.saveImage(path, toDcim: true);
    }
  }


}
