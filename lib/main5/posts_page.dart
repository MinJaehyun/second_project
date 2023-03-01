import 'package:flutter/material.dart';
import 'package:second_project/main5/posts_model.dart';
import 'package:second_project/main5/service.dart';

class PostsPage extends StatefulWidget {
  PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Posts> posts = <Posts>[];
  bool isLoading = false;

  Future<String> _fetch1() async {
    // await Future.delayed(Duration(seconds: 3));
    await Service.getPosts().then((value) {
      setState(() {
        posts = value;
        isLoading = true;
      });
    });
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text('Flutter Tutorial', style: TextStyle(color: Colors.black)),
      ),
      // FutureBuilder,
      body: FutureBuilder(
          future: _fetch1(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return Center(
                child: CircularProgressIndicator(),
              );
            };
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Posts postsIndex = posts[index];
                return Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            iconSize: 60.0,
                            icon: new Icon(Icons.account_circle),
                            onPressed: () {},
                            color: Colors.grey,
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('userID: ${postsIndex.userId}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text(
                                'ID: ${postsIndex.id}',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('${postsIndex.body}'),
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 1),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
