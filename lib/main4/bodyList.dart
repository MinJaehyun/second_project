import 'package:flutter/material.dart';
import 'data.dart';

class BodyList extends StatelessWidget {
  const BodyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            // text style
            var textStyleGrey = TextStyle(color: Colors.grey[500]);

            return Card(
              elevation: 0,
              color: index % 2 == 1 ? Colors.grey[200] : Colors.white,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        data[index]["imageUrl"],
                        width: 105,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(data[index]["title"] as String,
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 15),
                              if (index % 2 == 1)
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  height: 30,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text('BEST', style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              SizedBox(width: 5),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: 30,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text('D' + dayCount(data[index]['bookReturnDate']).toString(), style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(data[index]["author"] as String,
                                  style: textStyleGrey),
                              Text(' | ', style: textStyleGrey),
                              Text(data[index]["publisher"] as String,
                                  style: textStyleGrey),
                            ],
                          ),
                          SizedBox(height: 60),
                          Text('대출일: 2023/02/28 ~ 반납일: ${data[index]['bookReturnDate']}', style: textStyleGrey),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // lastDay 매개변수로 '2023/03/08' 입력받음
  int dayCount(returnDate) {
    // '2023/03/08' to '20230308'
    String lastDay = returnDate.replaceAll('/', '');
    final day = DateTime.now();

    // A.difference(b).inDays 사용하여 차이를 날짜로 나타냄
    int differnce = int.parse(day.difference(DateTime.parse(lastDay)).inDays.toString());
    return differnce - 1;
  }
}
