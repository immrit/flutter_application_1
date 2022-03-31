import 'package:flutter/material.dart';
import 'package:flutter_application_1/getData/Post.dart';
import 'package:flutter_application_1/getData/Remote_Service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Post> posts;
  late List<Datum> datum;

  @override
  void initState() {
    super.initState();
    posts = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder<Post>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 55,
              itemBuilder: ((context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text(snapshot.data!.data.elementAt(index).artist),
                      // Text(snapshot.data!.data.elementAt(index).title),
                    ],
                  ),
                );
              }),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    ));
  }
}
