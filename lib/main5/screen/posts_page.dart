import 'package:flutter/material.dart';
import 'package:second_project/main5/model/posts_model.dart';
import 'package:second_project/main5/helper/service.dart';

class PostsPage extends StatefulWidget {
  PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Posts> posts = <Posts>[];
  bool isLoading = false;

  Future<List<Posts>> fetchPosts() async {
    Service.getPosts().then((value) {
      setState(() {
        posts = value;
        isLoading = true;
      });
    });
    return <Posts>[];
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
      body: FutureBuilder(
        // note: FutureBuilder 미사용 시, initState 로 즉시 호출하기
        future: fetchPosts(),
        builder: (context, snapshot) {
          // note: ConnectionState.waiting 처리하면 화면 깜빡이는 이유는 ? setState 로 화면 계속 갱신하기 때문이다
          // setState 를 하지 않을 수 없으므로, 데이터가 있은 경우에만 처리하도록 한다
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
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
                        IconButton(iconSize: 60.0, icon: new Icon(Icons.account_circle), onPressed: null, color: Colors.grey),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('userID: ${postsIndex.userId}', style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text('ID: ${postsIndex.id}', style: TextStyle(color: Colors.grey)),
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
        },
      ),
    );
  }
}
