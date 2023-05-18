import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:automotiveapp/pages/firebase/image_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilesFromFirebasePage extends StatefulWidget {
  const FilesFromFirebasePage({super.key});

  @override
  State<FilesFromFirebasePage> createState() => _FilesFromFirebasePageState();
}

class _FilesFromFirebasePageState extends State<FilesFromFirebasePage> {
  late Future<List<FirebaseFile>> futureFiles;
  @override
  void initState() {
    super.initState();
    futureFiles = FirebaseApi.listAll("renting/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: ()=>context.go("/UploadFile"), icon:const Icon(Icons.arrow_back_ios)),
          title: const Text("Files from storage rent bucket"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<FirebaseFile>>(
            future: futureFiles,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              if (snapshot.hasData) {
                final files = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(files.length),
                    const SizedBox(height: 12,),
                    Expanded(child: ListView.builder(
                      itemCount: files.length,
                      itemBuilder: (context, index){
                        final file=files[index];

                        return buildFile(context, file);
                      },))
                  
                  ],
                );
              }

              return const Center(child: Text("Something went wrong"),);
            }));
  }

  Widget buildHeader(int index) {
    return ListTile(
      tileColor: blue,
      title:  Container(
        width: 52,
        height: 52,
        child: Row(
          children: [
            Text("$index", style:const  TextStyle(color: white, fontSize: 18),),
            const SizedBox(width: 10,),
            const Icon(Icons.file_copy),
          ],
        ),
      ),
    );
  }

  Widget buildFile(BuildContext context, FirebaseFile file){
    return GestureDetector(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagePage(file:file))),
      child: ListTile(
        leading: ClipOval(child: Image.network(file.url, width: 52, height: 52, fit: BoxFit.cover,)),
          title: Text(
            file.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: blue,
              decoration: TextDecoration.underline
            ),
          ),
          trailing: IconButton(onPressed: (){
            setState(() {
              FirebaseApi.delete("renting/${file.name}");
            });
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Deleted successfully")));
          }, icon: const Icon(Icons.delete, color: pink, size: 40,)),
      ),
    );
  }
}
