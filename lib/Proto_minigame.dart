import 'constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MinigamePage extends StatefulWidget {
  @override
  _MinigamePageState createState() => _MinigamePageState();
}

class _MinigamePageState extends State<MinigamePage> {
  List<ItemModel> items;
  List<ItemModel> items2;

  int score;
  bool gameOver;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(
          image: Image.network(
            "https://static.thenounproject.com/png/2427724-200.png",
            scale: 3,
          ),
          name: "Step 1 : ใช้สำลีเช็ดเลือด และกดห้ามเลือด",
          value: "Step 1 : ใช้สำลีเช็ดเลือด และกดห้ามเลือด"),
      ItemModel(
          image: Image.network(
            "https://static.thenounproject.com/png/2427817-200.png",
            scale: 3,
          ),
          name: "Step 2 : ใช้แอลกอฮอล์เช็ดทำความสะอาดรอบๆ แผล",
          value: "Step 2 : ใช้แอลกอฮอล์เช็ดทำความสะอาดรอบๆ แผล"),
      ItemModel(
          image: Image.network(
            "https://static.thenounproject.com/png/2427823-200.png",
            scale: 3,
          ),
          name:
              "Step 3 : ใช้สำลีชุบเบตาดีน หรือ โปรวิดี ไอโอดีนใส่แผลสดทารอบๆ แผล",
          value:
              "Step 3 : ใช้สำลีชุบเบตาดีน หรือ โปรวิดี ไอโอดีนใส่แผลสดทารอบๆ แผล"),
      ItemModel(
          image: Image.network(
            "https://static.thenounproject.com/png/2427749-200.png",
            scale: 3,
          ),
          name: "Step 4 : ใช้ผ้าพันแผล หรือพลาสเตอร์ปิดแผล",
          value: "Step 4 : ใช้ผ้าพันแผล หรือพลาสเตอร์ปิดแผล"),
      ItemModel(
          image: Image.network(
            "https://cdn.iconscout.com/icon/free/png-256/ambulance-2080900-1757005.png",
            scale: 3,
          ),
          name: "Step 5 : รีบน้ำผู้ป่วยส่งโรงพยาบาลในกรณีบาดแผลรุนแรง",
          value: "Step 5 : รีบน้ำผู้ป่วยส่งโรงพยาบาลในกรณีบาดแผลรุนแรง"),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) gameOver = true;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Matching Game'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text.rich(TextSpan(children: [
              TextSpan(text: "Score: "),
              TextSpan(
                  text: "$score",
                  style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ))
            ])),
            if (!gameOver)
              Row(
                children: <Widget>[
                  Column(
                      children: items.map((item) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Draggable<ItemModel>(
                        data: item,
                        childWhenDragging: Container(
                          child: item.image,
                          color: Colors.grey,
                        ),
                        feedback: Container(
                          child: item.image,
                        ),
                        child: Container(
                          child: item.image,
                        ),
                      ),
                    );
                  }).toList()),
                  Spacer(),
                  Column(
                      children: items2.map((item) {
                    return DragTarget<ItemModel>(
                      onAccept: (receivedItem) {
                        if (item.value == receivedItem.value) {
                          setState(() {
                            items.remove(receivedItem);
                            items2.remove(item);
                            score += 10;
                            item.accepting = false;
                          });
                        } else {
                          setState(() {
                            score -= 5;
                            item.accepting = false;
                          });
                        }
                      },
                      onLeave: (receivedItem) {
                        setState(() {
                          item.accepting = false;
                        });
                      },
                      onWillAccept: (receivedItem) {
                        setState(() {
                          item.accepting = true;
                        });
                        return true;
                      },
                      builder: (context, acceptedItems, rejectedItem) =>
                          Container(
                        color: item.accepting ? Colors.red : Colors.cyan,
                        height: 50,
                        width: 300,
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.all(8.0),
                        child: Text(
                          item.name,
                          style: GoogleFonts.prompt(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                    );
                  }).toList()),
                ],
              ),
            if (gameOver)
              const Text(
                "GameOver",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            if (gameOver)
              Center(
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.pink,
                  child: Text("New Game"),
                  onPressed: () {
                    initGame();
                    setState(() {});
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

class ItemModel {
  final String name;
  final String value;
  final Image image;
  bool accepting;

  ItemModel({this.name, this.value, this.image, this.accepting = false});
}
