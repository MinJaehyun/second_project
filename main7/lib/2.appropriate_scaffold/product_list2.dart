import 'package:flutter/material.dart';
import 'package:main7/main.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: SafeArea(
        child: Scaffold(
          body: Builder(
            builder: (context) {
              return Card(
                child: ListTile(
                  leading: IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return MyPage();
                    },),);
                  }, icon: Icon(Icons.home_filled)),
                  title: Text('MackBook Pro'),
                  trailing: IconButton(onPressed: (){
                    final snackBar = SnackBar(
                      content: const Text('장바구니에 상품을 담았습니다'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // some code to undo
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, icon: Icon(Icons.add_shopping_cart)),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
