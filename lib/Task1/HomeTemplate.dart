import 'package:flutter/material.dart';

class meditation extends StatefulWidget {
  const meditation({super.key});

  @override
  State<meditation> createState() => _meditationState();
}

class _meditationState extends State<meditation> {
  List circol = [true, false, false, false, false, false];
  List names = [
    {"name": "Session 01"},
    {"name": "Session 02"},
    {"name": "Session 03"},
    {"name": "Session 04"},
    {"name": "Session 05"},
    {"name": "Session 06"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          isAntiAlias: true,
                          fit: BoxFit.none,
                          scale: 0.89,
                          alignment: Alignment(-0.5, -1.19),
                          filterQuality: FilterQuality.high,
                          image: AssetImage("assets/images/neha-.png")
                      ))),
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10, top: 60, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Meditation",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "3 - 10 MIN Course",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Text(
                          "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17),
                        child: Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: SearchBar(
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Icon(Icons.search, size: 28),
                            ),
                            hintStyle: MaterialStatePropertyAll(
                                TextStyle(color: Colors.grey, fontSize: 23)),
                            hintText: "Search",
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )),
                          ),
                        ),
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2.2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2),
                        itemCount: 6,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 0.5,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white70),
                          child: Row(children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 5),
                                child: circol[index]
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.indigo,
                                            radius: 21.5,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.indigo,
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.indigo,
                                            radius: 21.5,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.indigo,
                                            ),
                                          ),
                                        ],
                                      )),
                            Text(
                              "${names[index]["name"]}",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 20, left: 22),
                        child: Text(
                          "Meditation",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 27),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 0.5,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70),
                        height: 85,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 8),
                              child: SizedBox(
                                  width: 100,
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/neha-.png"),
                                  )),
                            ),
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        "Basics 2",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 26),
                                      child: Text(
                                        "Start your deepen your practice",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ]),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 12),
                                child: Icon(Icons.lock_outlined,
                                    size: 28, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5,
            ),
          ],
        ),
        child: BottomNavigationBar(selectedItemColor: Colors.purple, items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: "Weather"),
        ]),
      ),
    );
  }
}
