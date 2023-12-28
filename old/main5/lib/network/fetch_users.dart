import 'package:main5/model/model.dart';
import 'package:http/http.dart' as http;

class Network {
  final url;

  Network(this.url);

  Future<List<Model>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<Model> users = modelFromJson(response.body);
      return users;
      // note: return Model.fromJson(jsonDecode(response.body)); // 단일 유저 가져오는 경우('...users/1')
    } else {
      throw Exception('Failed to load Model');
    }
  }
}
