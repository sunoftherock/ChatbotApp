import 'package:flutter/material.dart';
import '../datafiles/matches.dart';
import 'messenger_screen.dart';

class MatchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MatchPageState();
  }
}

final items = List<String>.generate(5, (i) => "Item $i");

class MatchPageState extends State<MatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'lib/assets/images/pearicon.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Matches'),
            ),
          ],
        ),
      ),
      body: Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            child: ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                // var passedname = matches[index]['name'];
                return Card(
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text(
                            '${matches[index]['name']} - ${matches[index]['status']} '),
                        subtitle: Text('${matches[index]['lastMsg']}'),
                        trailing: OutlinedButton(
                          child: Icon(Icons.message),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      MessagesPage(matches[index]['name'])),
                            );
                          },
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: <Widget>[
                      //     TextButton(
                      //       child: const Text('BUY TICKETS'),
                      //       onPressed: () { /* ... */ },
                      //     ),
                      //     const SizedBox(width: 8),
                      //     TextButton(
                      //       child: const Text('LISTEN'),
                      //       onPressed: () { /* ... */ },
                      //     ),
                      //     const SizedBox(width: 8),
                      //   ],
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Container(
          //   height: 200,
          //   width: 390,
          //   child: Card(
          //     elevation: 5,
          //     child:
          //   ),
          // ),
        ),
      ),
    );
  }

// final List<String> entries = <String>['A', 'B', 'C'];
// final List<int> colorCodes = <int>[600, 500, 100];

// ListView.separated(
//   padding: const EdgeInsets.all(8),
//   itemCount: entries.length,
//   itemBuilder: (BuildContext context, int index) {
//     return Container(
//       height: 50,
//       color: Colors.amber[colorCodes[index]],
//       child: Center(child: Text('Entry ${entries[index]}')),
//     );
//   },
//   separatorBuilder: (BuildContext context, int index) => const Divider(),
// );

}
