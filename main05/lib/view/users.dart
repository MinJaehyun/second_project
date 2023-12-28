import 'package:flutter/material.dart';
import 'package:main05/model/model.dart';
import 'package:main05/network/fetch_users.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  late Future<List<Model>> futureModel;
  late int userLength = 10;

  @override
  void initState() {
    super.initState();
    futureModel = getUsersData();
  }

  Future<List<Model>> getUsersData() async {
    var url = 'https://jsonplaceholder.typicode.com/users/';
    Network network = Network(url);
    var parsingData = await network.fetchUsers();
    userLength = parsingData.length;
    return parsingData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Flutter Tutorial')),
      body: SafeArea(
        child: FutureBuilder(
          future: futureModel,
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return ListView.builder(
              itemCount: userLength,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: Icon(Icons.account_circle_outlined),
                        title: Text('${snapshot.data![index].name}'),
                        subtitle: Text('${snapshot.data![index].username}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('${snapshot.data![index].email}'),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}