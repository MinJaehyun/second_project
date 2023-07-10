import 'package:http/http.dart' as http;
import 'package:second_project/main5/model/posts_model.dart';

class Service {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';
  // note: static 처리해야 posts_page.dart 에서 Service.getPosts() 가져올 수 있다
  static Future<List<Posts>> getPosts() async {
    try{
      final response = await http.get((Uri.parse(url)));
      if(response.statusCode == 200) {
        final List<Posts> posts = postsFromJson(response.body);
        return posts;
      }
      return <Posts>[];
    }
    catch(e){
      print(e);
      return <Posts>[];
    }
  }
}
