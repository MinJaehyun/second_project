import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(5),
        // color: Colors.redAccent,
        child: Column(
          children: [
            Container(
              // color: Colors.green,
              width: double.infinity,
              child: Form(
                child: TextFormField(
                  // onChanged: ,
                  // validator: ,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  )),
                ),
              ),
            ),
            SizedBox(height: 11),
            Row(
              children: [
                Flexible(
                  child: Container(
                    // padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                    child: Center(
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          // buildRow(['', 'Number', ''],isHeader: true),
                          buildRow(['7', '8', '9']),
                          buildRow(['4', '5', '6']),
                          buildRow(['1', '2', '3']),
                          buildRow(['', '0', '']),
                        ],
                      ),
                    ),
                  ),
                  flex: 7,
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    height: 500,
                    color: Colors.blue,
                    child: Text('222'),
                  ),
                  flex: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
        children: cells.map((cell) {
          // style 설정
          final style = TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          );
          return Padding(
            padding: EdgeInsets.all(52),
            child: Center(
                child: Text(
              cell,
              style: style,
            )),
          );
        }).toList(),
      );
}
