import 'package:flutter/material.dart';
import 'cardDetails.dart';
import 'planet.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Widget> cardList = new List();

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    cardList = _generateCards();
  }

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
      body: Stack(alignment: Alignment.center, children: cardList),
    );
  }

  List<Widget> _generateCards() {
    List<MatchedPerson> matchedpeople = new List();
    matchedpeople.add(
      MatchedPerson(
          "Mussorie",
          "https://www.tripsavvy.com/thmb/LTudD1VFIPILWGW5MoCsgBmhOGs=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/464741705-56a3c03d5f9b58b7d0d39809.jpg",
          70.0),
    );
    matchedpeople.add(
      MatchedPerson(
          "Manali ",
          "https://www.tripsavvy.com/thmb/YGzlP0l5lE79cah0LdH8sSWe7EI=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-535240938-591c2d7b3df78cf5fa4919b5.jpg",
          80.0),
    );
    matchedpeople.add(MatchedPerson(
        "Gangtok (Sikkim)",
        "https://www.tripsavvy.com/thmb/5X29hRjFEbE-5IYT3PFk30kqMZ4=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-675923006-5a82469c3418c6003689af24.jpg",
        90.0));
    matchedpeople.add(MatchedPerson(
        "Darjeeling (West Bengal)",
        "https://www.tripsavvy.com/thmb/xbATyZ6fE8sMFYDrDXU7P1wnbgE=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-503908231-591be3103df78cf5fa000b74.jpg",
        100.0));
    matchedpeople.add(
      MatchedPerson(
          "Nainital (Uttarakhand)",
          "http://amazingindiablog.in/wp-content/uploads/2015/06/P5035083.jpg",
          110.0),
    );
    List<Widget> cardList = new List();

    for (int x = 0; x < 5; x++) {
      cardList.add(
        Positioned(
          top: matchedpeople[x].topMargin,
          child: Draggable(
              onDragEnd: (drag) {
                removeCards(x);
              },
              childWhenDragging: Container(),
              feedback: GestureDetector(
                onTap: () {
                  print("Hello All");
                },
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // color: Color.fromARGB(250, 112, 19, 179),
                  child: Column(
                    children: <Widget>[
                      Hero(
                        tag: "imageTag",
                        child: Image.network(
                          matchedpeople[x].personImage,
                          width: 320.0,
                          height: 440.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          matchedpeople[x].personName,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.purple,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CardDetails(matchedpeople[x].personImage, x);
                  }));
                },
                child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            image: DecorationImage(
                                image:
                                    NetworkImage(matchedpeople[x].personImage),
                                fit: BoxFit.cover),
                          ),
                          height: 400.0,
                          width: 350.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            matchedpeople[x].personName,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.purple,
                            ),
                          ),
                        )
                      ],
                    )),
              )),
        ),
      );
    }
    return cardList;
  }
}
